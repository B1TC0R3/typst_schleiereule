// Copyright 2024 Thomas Gingele https://github.com/B1TC0R3

#{
set text(lang: "de")
import "/template/format.typ": *

//Configure font
set text(
  font: "Inria Serif", // When compiling locally, eiter install this font or change to another one
  size: 12pt
)

//Title page
titlepage(
  title   : "This is a title",
  subtitle: "This is a subtitle",
  date    : datetime.today().display("[day].[month].[year]"),
  author  : "Thomas Gingele, Max Musterman",
  logos   : ("/images/logo.png",), //Supports 0 to 2 logos, enter image path/s as array
  content : [
    // This text area can be edited freely, as you would the normal document
  ]
)

//Table of content
table-of-content()

//Load acronyms
include("acronyms.typ")
print-index(
  title: "Acronyms",
  row-gutter: 10pt
)

//Chapters and content
// Add an include for every file you have
show: doc => content-configuration(doc)
// The recommended structure would look like this:
// include("/content/01_introduction.typ")
// include("/content/02_basics.typ")
// ...
include("/content/xx_examples.typ")

//Bibliography and appendix
show: doc => appendix-configuration(doc)
bibliography("bib.bib")
}
