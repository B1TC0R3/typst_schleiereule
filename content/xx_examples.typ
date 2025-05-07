#import "../template/format.typ": *
#import "@preview/codelst:2.0.1": sourcecode

= Introduction <intro>

The label of the section can later be referenced like this: @intro

Acronyms work like this: #acr("WTP")

Bibliography reference: Something @thisisabibliographyentry

#note("Just adding some simple information here")
#warning-note("This is a note from the editor. Please remove me later or something.")

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
    [Content A.b], [Content B.b]
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
