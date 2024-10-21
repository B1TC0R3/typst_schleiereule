// Copyright 2024 Thomas Gingele https://github.com/B1TC0R3

#let appendix_configuration(doc) = {
  let page_numbering_style = "A"
  let heading_numbering    = "A."

  set page(
    numbering: page_numbering_style,
    footer: {
      line(end: (100%, 0%))
      align(right, counter(page).display(page_numbering_style))
    }
  )

  counter(page).update(1)
  
  doc
}
