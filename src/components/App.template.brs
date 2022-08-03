function render() as object
  return [
    {
      name: "Rectangle",
      props: {
        id: "background",
        width: m.theme.resolution.width,
        height: m.theme.resolution.height,
        color: m.theme.colors.black,
      }
    },
    {
      name: "RouterOutlet",
      props: {
        id: "routerOutlet",
        outletName: "app-outlet",
      },
    },
  ]
end function
