#let signature_field(
  place: none,
  name: none,
  date: datetime.today().display("[year]-[month]-[day]")
  spacing: 40pt,
  length: 200pt
) = {
  v(spacing)
  line(length: length)
  
  if (date)   { date }
  if (place)  { place }
  linebreak()
  if ( name ) { name + linebreak() }
}
