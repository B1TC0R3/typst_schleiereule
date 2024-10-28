// Copyright 2024 Thomas Gingele https://github.com/B1TC0R3

#let styled-table(table) = {
  align(center,
    block(
      radius: 5pt,
      stroke: 2pt,
      clip: true,
      width: 100%,
      breakable: true,
      table
    )
  )
}