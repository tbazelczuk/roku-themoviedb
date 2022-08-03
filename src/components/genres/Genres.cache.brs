' @import /components/registry/Registry.facade.brs from @dazn/kopytko-framework
' @import /components/rokuComponents/DateTime.brs from @dazn/kopytko-utils
' @import /components/getProperty.brs from @dazn/kopytko-utils

function GenresCache() as Object
  prototype = {}

  prototype.cache = RegistryFacade()
  prototype.key = "GENRES"
  prototype.cacheTime = 60 * 60 * 24 ' expiration time in seconds

  prototype.get = function () as Object
    currentTimestamp = DateTime().asSeconds()
    cacheItem = m.cache.get(m.key)

    if cacheItem = Invalid OR cacheItem.expirationTimestamp = Invalid OR cacheItem.expirationTimestamp < currentTimestamp
      return Invalid
    end if

    genres = CreateObject("roSGNode", "GenresModel")
    genres.callFunc("fromJSON", cacheItem.genres)

    return genres
  end function

  prototype.set = sub (genres as Object)
    m.cache.set(m.key, {
      expirationTimestamp: DateTime().asSeconds() + m.cacheTime,
      genres: genres.callFunc("toJSON"),
    })
  end sub

  return prototype
end function
