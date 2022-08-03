sub constructor()
  m.selectedGenre = m.store.get("selectedGenre")
end sub

sub componentDidMount()
  m.elementToFocus = m.genresList
end sub

sub onItemSelected(event as Object)
  m.store.set("selectedGenre", event.getData())
  m.router.navigate("/movies")
end sub
