function render() as Object
  if m.state.error <> Invalid
    return {
      name: "Label",
      props: {
        id: "errorLabel",
        horizAlign: "center",
        width: m.theme.resolution.width,
        translation: [0, m.theme.resolution.height / 2],
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
    name: "LayoutGroup",
    props: {
      id: "container",
      translation: [20, 20],
    },
    children: [
      {
        name: "Label",
        props: {
          id: "infoLabel",
          horizAlign: "center",
          width: m.theme.resolution.width,
        },
        dynamicProps: {
          text: m.genre.name + " - page " + m.state.page.toStr() + " of " + m.state.totalPages.toStr()
        }
      },
      {
        name: "PosterGrid",
        props: {
          id: "moviesGrid",
          basePosterSize: [185, 278],
          itemSpacing: [50, 15],
          caption1NumLines: 1,
          numColumns: 8,
          numRows: 3,
        },
        dynamicProps: {
          content: mapToContentNode(m.state.items),
        },
      },
    ]
  }
end function

function mapToContentNode(items as Object) as Object
  content = CreateObject("roSGNode", "ContentNode")

  for each item in items
    child = content.createChild("ContentNode")
    child.setFields({
      shortdescriptionline1: item.title,
      hdgridposterurl: item.posterUrl
    })
  end for

  return content
end function
