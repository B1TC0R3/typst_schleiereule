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
  "Example Listing with code highlight",
  ```python
  def main():
    a = 10 + 25
    for count in range(a):
      print("Too many hello worlds! :(")
  ```,
  highlight: (3,)
)

#lorem(25)

#figure(
  styled-table(
    table(
      columns: (auto, auto),
      inset: 10pt,
      align: horizon,
      [*Column A*], [*Column B*],
      [Content A.a], [Content B.a],
      [Content A.b], [Content B.b]
    )
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

#vulnerability(
  cvss: 7.8,
  title: "Some Vulnerability" ,
  description: [What the vulnerability is about],
  impact: [What the vulnerability can cause],
  recommendation: [What to do against the vulnerability]
)
