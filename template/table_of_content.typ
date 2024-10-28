// Copyright 2024 Thomas Gingele https://github.com/B1TC0R3

#let table-of-content(
  listings: true,
  figures : true,
  tables  : true,
) = {
  let table_configurations = (
    (
      title  : "Listings", 
      kind   : raw,
      enabled: listings,
    ),
    (
      title  : "Figures",
      kind   : image,
      enabled: figures,
    ),
    (
      title  : "Tables",
      kind   : table,
      enabled: tables,
    ),
  )
  
  show outline.entry.where(level: 1): it => {
    v(15pt, weak: true)
    strong(it)
  }
  
  outline(indent: auto)
  pagebreak()

  for config in table_configurations {
    if config.enabled {
      block(
        height: auto,
        {
          outline(
            title: config.title,
            target: figure.where(kind: config.kind)
          )
          v(50pt)
        }
      )
    } 
  }
}
