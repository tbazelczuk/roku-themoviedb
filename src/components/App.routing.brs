function getAppRouting() as object
  return [
    { path: "", view: "HomeView" },
    { path: "movies", view: "MoviesView" },
  ]
end function
