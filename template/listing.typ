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