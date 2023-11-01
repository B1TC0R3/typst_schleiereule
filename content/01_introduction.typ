#import "../template/format.typ": *

= Introduction

This is a test citing, my friend @test.

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

#lorem(50)

#figure(
  table(
    columns: (auto, auto),
    inset: 10pt,
    align: horizon,
    [*Column A*], [*Column B*],
    [Content A.a], [Content B.a],
    [Content A.b], [Content B.b]
  ),
  caption: "Example Table"
)

#lorem(50)

#figure(
  $ a + b $,
  caption: "Example figure"
)
