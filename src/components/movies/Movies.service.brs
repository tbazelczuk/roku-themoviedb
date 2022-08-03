' @import /components/http/request/createRequest.brs from @dazn/kopytko-framework

function MoviesService() as Object
  prototype = {}

  prototype.getAll = function (options as Object) as Object
    return createRequest("MoviesRequest", options)
  end function

  return prototype
end function
