#let content_configuration(doc) = {
  set heading(
    level:      3,
    numbering:  "1.1.1.",
    outlined:   true,
    bookmarked: true,
  )

  show figure.caption: emph
  
  doc
  pagebreak()
}