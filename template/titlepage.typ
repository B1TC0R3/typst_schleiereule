// Copyright 2024 Thomas Gingele https://github.com/B1TC0R3

#let print_logos(logos) = {
  assert(
    type(logos) == array, 
    message: "Logos are not specified as an array.
       If you are only using one logo, type '(path,)'."
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
  title   : "No Title",
  subtitle: "",
  author  : "",
  logos   : (),
  date    : "",
  content : ""
) = {
  set align(center)

  print_logos(logos)
  v(5%)

  block( text(30pt, title))
  linebreak()
  text(17pt, style: "italic", subtitle)
  line(length: 100%)
  v(5pt)
  
  text(15pt, "by")
  v(10pt)
  
  text(17pt, emph(author))
  v(15pt)
  
  date
  v(20%)
  
  set align(left)
  block(
    width: 100%,
    height: auto,
    breakable: false,
    content
  )

  pagebreak()
}
