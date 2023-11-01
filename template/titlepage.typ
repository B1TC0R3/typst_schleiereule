#let print_logos(
  logos: ()
) = {
  assert(
    type(logos) == array, 
    message: "Logos are not specified as an array.
       If you are only using one logo, type '(path,)'.\n\n"
  )

  if (logos.len() == 0) {
    v(20%)
    return
  }


  if (logos.len() == 1) {
    block(
      width : 100%,
      height: 20%,
      image(logos.at(0))
    )

    return
  }

  if (logos.len() >= 2) {
    logos = (logos.at(0), logos.at(1))

    block(
      width : 100%,
      height: 20%,

      stack(
        dir    : ltr,
        spacing: 30%,
        image(logos.at(0)),
        image(logos.at(1))
      )
    )
  }
}

#let titlepage(
  title  : "No Title",
  authors: (),
  logos  : (),
  date   : "",
  content: ""
) = {
  set align(center)

  print_logos(logos: logos)

  v(5%)
  text(30pt, title)

  line(length: 100%)
  linebreak()

  text(15pt, emph(authors.join(", ")))
  linebreak()

  date
  linebreak()

  v(20%)
  set align(left)
  block(
    width: 100%,
    height: 20%,
    content
  )

  pagebreak()
}
