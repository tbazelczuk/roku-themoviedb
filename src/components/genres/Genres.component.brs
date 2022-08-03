' @import /components/http/request/createRequest.brs from @dazn/kopytko-framework
' @import /components/genres/Genres.service.brs

sub constructor()
  m.service = GenresService()

  m.state = {
    items: Invalid,
    error: Invalid,
  }
end sub

sub fetchGenres()
  m.service.getAll().then(onFetchSuccess, onFetchFailure)
end sub

sub componentDidMount()
  fetchGenres()
end sub

sub componentWillUnmount()
  if m.genresList <> Invalid
    m.genresList.unobserveFieldScoped("itemSelected")
  end if
end sub

sub itemSelected(event as Object)
  m.top.onItemSelected = m.state.items[m.genresList.itemSelected]
end sub

sub onFetchSuccess(genres as Object)
  setState({
    items: genres.getChildren(-1, 0),
    error: Invalid
  }, focusGenresList)
end sub

sub focusGenresList()
  if m.genresList <> Invalid
    m.genresList.observeFieldScoped("itemSelected", "itemSelected")
    m.genresList.setFocus(true)
  end if
end sub

sub onFetchFailure(error as Object)
  setState({ error: error.message })
end sub
