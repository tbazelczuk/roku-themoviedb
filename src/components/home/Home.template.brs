function render() as object
  return [
    {
      name: "Poster",
      props: {
        id: "logo",
        height: m.theme.logo.height,
        width: m.theme.logo.width,
        uri: m.theme.logo.uri,
        translation: [50, 50],
      },
    },
    {
      name: "LayoutGroup",
      props: {
        id: "container",
        layoutDirection: "horiz",
        horizAlignment: "center",
        translation: [m.theme.resolution.width / 2, 200],
      },
      children: [
        {
          name: "Genres",
          props: {
            id: "genresList",
          },
          dynamicProps: {
            selected: m.selectedGenre,
          },
          events: {
            onItemSelected: "onItemSelected",
          }
        }
      ]
    }
  ]
end function
