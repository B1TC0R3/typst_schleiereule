
,,// Copyright 2024 Thomas Gingele https://github.com/B1TC0R3

#let content-configuration(doc) = {
  let page_numbering_style = "1"
  let heading_numbering    = "1."

  
  //Page layout
  set page(

    /*
     *  _    _                _           
     * | |  | |              | |          
     * | |__| | ___  __ _  __| | ___ _ __ 
     * |  __  |/ _ \/ _` |/ _` |/ _ \ '__|
     * | |  | |  __/ (_| | (_| |  __/ |   
     * |_|  |_|\___|\__,_|\__,_|\___|_|   
     */
    header: context({
      let elem_body
      let elems

      if counter(page).get().first() > 1 {
        elems = query(
          selector(heading).after(here()),
        )

        if elems.len() > 0 {
          elem_body = elems.first().body
        }

      } else {
        elems = query(
          selector(heading).before(here()),
        )

        elem_body = elems.last().body
        
      }
      
      if elems != () {
        align(
          right, 
          smallcaps[#elem_body]
        )  
      }
      
      line(end: (100%, 0%))
    }),

    /*
     *  ______          _            
     * |  ____|        | |           
     * | |__ ___   ___ | |_ ___ _ __ 
     * |  __/ _ \ / _ \| __/ _ \ '__|
     * | | | (_) | (_) | ||  __/ |   
     * |_|  \___/ \___/ \__\___|_|  
     */
    footer: [
      #line(end: (100%, 0%))
      #align(right, context{ counter(page).display(
        page_numbering_style
      )})
    ]
  )

  //Reset page counter
  counter(page).update(1)
  
  //Heading configuration
  set heading(
    numbering:  heading_numbering,
    outlined:   true,
    bookmarked: true,
  )

  //Configure heading level look and feel individually
  show heading.where(level: 1): heading => {
    text(size: 25pt, weight: "bold", heading)
    v(10pt)
  }

  show heading.where(level: 2): heading => {
    text(size: 20pt, heading)
    v(5pt)
  }

  show heading.where(level: 3): heading => {
    text(size: 15pt,heading)
    v(5pt)
  }

  //show table.cell.where(y: 0): strong
  show table: set table(
    fill: (x, y) => {
      if y == 0 {
        gray.lighten(80%)
      }
    }
  )

  /*
  show raw.where(block: false): box.with(
    fill: luma(220),
    outset: (x: 1pt, y: 2pt),
    radius: 2pt,
  )
  */

  show raw.where(block: false): text.with(font: "Fira Code")
  
  show figure.caption: emph
  show link: set text(fill: blue.darken(60%))
  
  doc
}
