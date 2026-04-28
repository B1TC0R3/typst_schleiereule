#import "/template/template.typ": *

= Introduction <intro>

The label of the section can later be referenced like this: @intro

Acronyms work like this: #gls("acr")

Bibliography reference: Something @thisisabibliographyentry

#note("Just adding some simple information here")
#note(mode: "warning", "This is a warning!")

== Subintroduction

#lorem(50)

#listing(
  ```python
  def main():
    a = 10 + 25
    for count in range(a):
      print("Too many hello worlds! :(")
  ```,
  caption: "Example Python code with line highlighting.",
  highlight: (3,)
)

#lorem(25)

#figure(
  table(
    columns: (50%, 50%),
    inset: 10pt,
    align: horizon,
    [*Column A*], [*Column B*],
    [Content A.a], [Content B.a],
    [Content A.b], [Content B.b],
    [Content A.c], [Content B.c],
  ),
  caption: "Example Table"
) <some_example_figure>

This figure can be referenced with @some_example_figure.

#lorem(25)

#figure(
  $ a + b $,
  caption: "Example mega complicated math"
)

#pagebreak()
