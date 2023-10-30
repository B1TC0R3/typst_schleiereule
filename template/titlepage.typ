#let titlepage(
  title  : "No Title",
  authors: (),
) = {
  set align(center)
  text(30pt, title)

  set align(center)
  text(17pt, emph(authors.join(", ")))

  pagebreak()
}