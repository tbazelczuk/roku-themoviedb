' @import /components/http/request/createRequest.brs from @dazn/kopytko-framework
' @import /components/promise/PromiseResolve.brs from @dazn/kopytko-utils
' @import /components/genres/Genres.cache.brs

function GenresService() as Object
  prototype = {}

  prototype.cache = GenresCache()

  prototype.getAll = function () as Object
    genres = m.cache.get()

    if genres <> Invalid
      return PromiseResolve(genres)
    end if

    return createRequest("GenresRequest").then(m.onFetchSuccess, Invalid, m)
  end function

  prototype.onFetchSuccess = function (genres as Object, m as Object) as Object
    m.cache.set(genres)

    return genres
  end function

  return prototype
end function
