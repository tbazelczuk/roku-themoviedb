' @import /components/rokuComponents/AppInfo.brs from @dazn/kopytko-utils
' @import /components/getProperty.brs from @dazn/kopytko-utils

function getRequestOptions(options as Object) as object
  language = AppInfo().getValue("language")
  baseUrl = AppInfo().getValue("baseUrl")
  apiKey = AppInfo().getValue("apiKey")

  return {
    url: baseUrl + "/3/genre/movie/list",
    queryParams: {
      api_key: apiKey,
      language: language,
    }
  }
end function

function parseResponseData(data as Object) as object
  genres = CreateObject("roSGNode", "GenresModel")

  for each item in data.genres
    genre = genres.createChild("GenreModel")
    genre.setFields({
      id: item.id,
      name: item.name,
    })
  end for

  return genres
end function

function generateErrorData(response as Object) as Object
  error = CreateObject("roSGNode", "HttpErrorModel")
  error.setFields({
    httpStatusCode: response.httpStatusCode,
    message: getProperty(response.rawData, ["status_message"], "Response error"),
  })

  return error
end function
