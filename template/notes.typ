// Copyright 2024 Thomas Gingele https://github.com/B1TC0R3

#import "@preview/drafting:0.1.2": *

#let note_inset         = 1em
#let note_border_radius = 0.5em

#let note_info_border_color        = black
#let note_info_background_color    = gray.lighten(80%)
#let note_warning_border_color     = red
#let note_warning_background_color = orange.lighten(80%)

#let note(
  content,
  width: auto,
  color: note_info_border_color,
) = {
  inline-note(
    content,
    stroke: color,
    rect  : rect.with(
      inset : note_inset,
      radius: note_border_radius,
      fill  : color.lighten(80%),
      width : width
    )
  )
}

#let warning-note(
  content,
  width: auto
) = {
  inline-note(
    content,
    stroke: note_warning_border_color,
    rect  : rect.with(
      inset : note_inset,
      radius: note_border_radius, 
      fill  : note_warning_background_color
    ),
  )
}
