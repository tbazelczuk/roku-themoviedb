function render() as Object
  if m.state.error <> Invalid
    return {
      name: "Label",
      props: {
        id: "errorLabel"
      },
      dynamicProps: {
        text: m.state.error,
      }
    }
  end if

  if m.state.items = Invalid
    return {
      name: "Spinner",
      props: {
        id: "spinner"
      }
    }
  end if

  return {
    name: "LabelList",
    props: {
      id: "genresList",
      itemSize: [400, 48],
    },
    dynamicProps: {
      jumpToItem: findItemIndex(m.state.items, m.top.selected),
      content: mapToContentNode(m.state.items),
    }
  }
end function

function findItemIndex(items as Object, item as Object) as Integer
  count = items.count()

  if count = 0 OR item = Invalid
    return -1
  end if

  for i = 0 to count - 1
    if items[i].id = item.id
      return i
    end if
  end for

  return -1
end function

function mapToContentNode(items as Object) as Object
  content = CreateObject("roSGNode", "ContentNode")

  for each item in items
    child = content.createChild("ContentNode")
    child.setFields({
      id: item.id,
      title: item.name,
    })
  end for

  return content
end function
