#import "template/format.typ": *

//Font
#set text(
  font: "Inria Serif",
  size: 12pt
)

//Title page
#titlepage(
  title: "Example Title",
  authors: (
    "Thomas Gingele",
  )
)

//Table of content
#table_of_content()

// Content
#show: doc => content_configuration(doc)
#include("content/01_introduction.typ")
#pagebreak()

//Bibliography
#bibliography("bib.yml")
