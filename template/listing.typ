,,// Copyright 2024 Thomas Gingele https://github.com/B1TC0R3

#import "@preview/codelst:2.0.2": sourcecode

#let listing(
  caption, 
  code, 
  highlight: ()
) = {
  figure(
    sourcecode(highlighted: highlight)[#code],
    caption: caption,
  )
}
