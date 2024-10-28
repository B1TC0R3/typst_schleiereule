,,// Copyright 2024 Thomas Gingele https://github.com/B1TC0R3

#import "@preview/codelst:2.0.1": sourcecode

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