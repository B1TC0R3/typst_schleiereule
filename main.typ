#import "template/format.typ": *

//Font
#set text(
  font: "Inria Serif",
  size: 12pt
)

//Title page
#titlepage(
  title  : "This is a very long example title to fill more lines",
  date   : "01.01.1970",
  authors: ("Thomas Gingele", "His fictional friend"),
  logos  : (), //Supports 0 to 2 logos, enter image path/s as array
  content: [
    This is some additional content for the title page.\
    It can be used for adding important information.\
    It supports normal typst syntax for formatting as well.
  ]
)

//Table of content
#table_of_content()

// Content
#show: doc => content_configuration(doc)
#include("content/01_introduction.typ")
#pagebreak()

//Bibliography
#bibliography("bib.bib")
