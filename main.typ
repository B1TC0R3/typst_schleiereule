// Copyright 2024 Thomas Gingele https://github.com/B1TC0R3

#{
import "template/format.typ": *
import "@preview/acrostiche:0.3.0": *

//Configure font
set text(
  font: "Inria Serif",
  size: 12pt
)

//Title page
titlepage(
  title   : "Title getting longer and longer I really just want a linebreak here",
  subtitle: "This is a subtitle",
  date    : datetime.today().display("[day].[month].[year]"),
  author  : "Some Guy, Another Guy",
  logos   : ("../images/logo.png",), //Supports 0 to 2 logos, enter image path/s as array
  content : [
    // This text area can be edited freely, as you would the normal document
  ]
)

//Table of content
table_of_content()

//Load acronyms
include("acronyms.typ")

//Chapters and content
// Add an include for every file you have
show: doc => content_configuration(doc)
include("content/xx_examples.typ")

//Bibliography and appendix
show: doc => appendix_configuration(doc)
bibliography("bib.yml", full: true)
}