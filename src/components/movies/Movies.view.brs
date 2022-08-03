' @import /components/movies/Movies.service.brs
' @import /components/ternary.brs from @dazn/kopytko-utils

sub constructor()
  m.service = MoviesService()

  m.genre = m.store.get("selectedGenre")

  m.state = {
    items: Invalid,
    error: Invalid,
    totalPages: 0,
    page: 0,
  }
end sub

sub fetchMovies(page as Integer, genreId as String)
  m.service.getAll({
    genreId: genreId,
    page: page,
  }).then(onFetchSuccess, onFetchFailure)
end sub

sub fetchPrevPage()
  page = ternary(m.state.page = 1, m.state.totalPages, m.state.page - 1)
  fetchMovies(page, m.genre.id)
end sub

sub fetchNextPage()
  page = ternary(m.state.page + 1 > m.state.totalPages, 1, m.state.page + 1)
  fetchMovies(page, m.genre.id)
end sub

sub componentDidMount()
  fetchMovies(1, m.genre.id)
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
  if (NOT press) then return false

  if (key = "up")
    fetchNextPage()

    return true
  else if (key = "down")
    fetchPrevPage()

    return true
  end if

  return false
end function

sub onFetchSuccess(movies as Object)
  setState({
    error: Invalid
    items: movies.getChildren(-1, 0),
    totalPages: movies.totalPages,
    page: movies.page,
  })
end sub

sub onFetchFailure(error as Object)
  setState({ error: error.message })
end sub
