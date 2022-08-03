' @import /components/rokuComponents/AppInfo.brs from @dazn/kopytko-utils
' @import /components/getProperty.brs from @dazn/kopytko-utils

function getRequestOptions(options as Object) as object
  language = AppInfo().getValue("language")
  baseUrl = AppInfo().getValue("baseUrl")
  apiKey = AppInfo().getValue("apiKey")

  genreId = options.genreId.toStr()
  page = options.page.toStr()

  return {
    url: baseUrl + "/3/discover/movie",
    queryParams: {
      sort_by: "popularity.desc",
      language: language,
      with_genres: genreId
      api_key: apiKey,
      page: page,
    },
  }
end function

function parseResponseData(data as Object) as object
  movies = CreateObject("roSGNode", "MoviesModel")
  movies.totalPages = data.total_pages
  movies.page = data.page

  for each item in data.results
    movie = movies.createChild("MovieModel")
    movie.setFields({
      id: item.id,
      title: item.title,
      posterUrl: mapPosterUrl(item.poster_path),
    })
  end for

  return movies
end function

function generateErrorData(response as Object) as Object
  error = CreateObject("roSGNode", "HttpErrorModel")
  error.setFields({
    httpStatusCode: response.httpStatusCode,
    message: getProperty(response.rawData, ["errors"], ["Response error"])[0],
  })

  return error
end function

function mapPosterUrl(posterUrl as Object) as Object
  if posterUrl = Invalid
    return Invalid
  end if

  return "https://image.tmdb.org/t/p/w185" + posterUrl
end function
