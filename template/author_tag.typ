// Copyright 2024 Thomas Gingele https://github.com/B1TC0R3

#let author-tag(authors, coauthors: "", editors: "") = {
  let information = "Author/en: " + authors

  if coauthors != "" {
    information += "; Coauthor/en: " + coauthors
  }
  
  if editors != "" {
    information += "; Editor/en: " + editors
  }
  
  text(
    size: 10pt,
    baseline: -10pt,
    emph(information)
  ) 
}