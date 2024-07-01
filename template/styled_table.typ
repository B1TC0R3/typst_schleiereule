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