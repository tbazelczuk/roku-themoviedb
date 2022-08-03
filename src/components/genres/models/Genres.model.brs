function toJSON() as String
  items = []

  for each item in m.top.getChildren(-1, 0)
    items.push({
      id: item.id,
      name: item.name,
    })
  end for

  return formatJSON(items)
end function

sub fromJSON(json as String)
  items = parseJSON(json)

  for each item in items
    child = m.top.createChild("GenreModel")
    child.setFields({
      id: item.id,
      name: item.name,
    })
  end for
end sub
