#let table_of_content(
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

  outline()
  pagebreak()

  for config in table_configurations {
    if config.enabled {
      outline(
        title: config.title,
        target: figure.where(kind: config.kind)
      )
      pagebreak()
    } 
  }
}
