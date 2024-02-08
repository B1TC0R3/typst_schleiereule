// Copyright 2024 Thomas Gingele https://github.com/B1TC0R3

#let content_configuration(doc) = {
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
    header: locate(loc => {
      let elem_body
      let elems = query(
        selector(heading).after(loc),
        loc,
      )

      if elems == () {
        elems = query(
          selector(heading).before(loc),
          loc,
        )

        elem_body = elems.last().body
        
      } else {
        elem_body = elems.first().body
        
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
      #align(right, counter(page).display(
        page_numbering_style
      ))
    ]
  )

  //Reset page counter
  counter(page).update(1)
  
  //Heading configuration
  set heading(
    level:      3,
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
  
  show figure.caption: emph                   //Captions are italic
  show link: set text(fill: blue.darken(60%)) //Links are blue
  
  doc
}