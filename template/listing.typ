// Copyright 2024 Thomas Gingele https://github.com/B1TC0R3

#import "@preview/codelst:1.0.0": sourcecode

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