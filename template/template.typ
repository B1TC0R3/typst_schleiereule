// Copyright 2025 Thomas Gingele https://github.com/B1TC0R3
#import "@preview/glossarium:0.5.10": make-glossary, register-glossary, print-glossary, gls, glspl
#import "@preview/codelst:2.0.2": sourcecode

// --- Global Settings --------------------------------------------
#let MIN_TITLE_SIZE = 30pt
#let MAX_TITLE_SIZE = 70pt

#let MIN_SUBTITLE_SIZE = 17pt
#let MAX_SUBTITLE_SIZE = 27pt
#let SUBTITLE_STYLE = "italic"

#let AUTHOR_SIZE = 12pt
#let AUTHOR_JOIN_CHAR = ", "
#let AUTHOR_LAST_JOIN_CHAR = none // Overwritten by context later
#let AUTHOR_DECORATOR = none // Overwritten by context later

#let HEADING_FONT = "TeX Gyre Heros"
#let HEADING_SIZE_LEVEL_1 = 23pt
#let HEADING_SIZE_LEVEL_2 = 19pt
#let HEADING_SIZE_LEVEL_3 = 15pt

#let TEXT_SIZE = 12pt
#let TEXT_FONT = "New Computer Modern"

#let OUTLINE_NUMBERING = "I"
#let BODY_NUMBERING = "1"
#let HEADING_NUMBERING = "1."
#let APPENDIX_NUMBERING = "A"

// --- Functions -------------------------------------------

/// Put text into stylized brackets.
/// Usage: #bracket[Example Text]
///
/// -> content
#let bracket(
  // The text to put into brackets.
  // -> content
  body,
) = {
  text(
    style: "italic",
    ["#body"]
  )
}

/// Create a source code listing.
/// Usage: #listing(```bash echo Hello```, caption: [Hello world in Bash])
///
/// -> content, figure
#let listing(
  // The source code to put into the listing.
  // -> raw
  code,

  // [OPTIONAL] The caption of the listing
  // -> str, content
  caption: none, 

  // [OPTIONAL] An array of lines to highlight.
  // -> array
  highlight: (),
) = {
if caption != none {
    figure(
      sourcecode(highlighted: highlight)[#code],
      caption: caption,
    )
  } else {
    sourcecode(highlighted: highlight)[#code]
  }
}

/// Create a field for signatures.
/// Usage: #signature_field(name: "Wilma Ruhe")
///
/// -> content
#let signature_field(
  // [OPTIONAL] The phyiscal place of the signature, e.g. a Exampletown.
  // -> str, content
  place: none,

  // [OPTIONAL] The name of the signing person.
  // -> str, content
  name: none,

  // [OPTIONAL] The date of the signature. Defaults to the current date.
  // -> str, content
  date: datetime.today().display("[year]-[month]-[day]"),
) = {
  v(40pt)
  line(length: 150pt)

  if date != none { date }
  if date != none and place != none { ", " }
  if place != none { place }
  linebreak()
  if name != none { name + linebreak() }
}

/// Insert a sticky-note-like message into the page.
/// Usage: #note(title: "Example Title")[Example Text]
///
/// -> content
#let note(
  // [OPTIONAL] Title of the note.
  // -> content
  title: none,

  // [OPTIONAL] Color presets for the note. 
  // Supported values: normal, good, warning, error.
  // -> str
  mode: "normal",

  // Content of the note.
  // -> content
  body,
) = {
  let modes = (
    "normal": (
      "background": luma(236),
      "stroke": luma(150),
    ),
    "good": (
      "background": green.lighten(70%),
      "stroke": green,
    ),
    "warning": (
      "background": orange.lighten(70%),
      "stroke": orange,
    ),
    "error": (
      "background": red.lighten(70%),
      "stroke": red,
    ),
  )

  if mode not in modes.keys() {
    panic(
      "Parameter 'mode' of function 'note' must be one of the following: '" +
      modes.keys().join("', '", last: "' or' ") +
      "'"
    )
  }

  block(
    fill: modes.at(mode).at("background"),
    stroke: (left: modes.at(mode).at("stroke") + 3pt),
    width: 100%,
    height: auto,
    inset: 5pt,
    {
      if title != none and title != "" {
        text(
          weight: "bold",
          font: "TeX Gyre Heros",
          title
        )
        linebreak()
      }
      body
    }
  )
}

// --- Template --------------------------------------------
/// Template function.
/// For full documentation, please refer to the Github repository.
/// -> content
#let schleiereule(
  // [OPTIONAL] One or many filenames for logo images.
  // -> str, array
  logo: none,

  // [OPTIONAL] The title of the document.
  // -> str
  title: none,

  // [OPTIONAL] The subtitle of the document.
  // -> str
  subtitle: none,

  // [OPTIONAL] The author/s of the document.
  // -> str, array
  authors: none,

  // [OPTIONAL] Configuration for the different types of indexes.
  // -> dict
  outlines: (
    headings: true,
    figures: true,
    tables: true,
    listings: true, 
  ),

  // [OPTIONAL] Filepath to the glossary file.
  glossary: none,

  // [OPTIONAL] The content of the document.
  // -> str, content, array
  body: none,

  // [OPTIONAL] The appendix of the document.
  // -> str, content, array
  appendix: none,

  // [OPTIONSl] The bibliography file of the document.
  // -> str
  bibliography_file: none,

  // [OPTIONAL] The lagugage of the document.
  // -> str
  lang: "en",
) = {
  // --- Locale ----------------------------------------------
  let LOCALE_TITLE_PAGE_BY = (
    "en": "by",
    "de": "von",
  )

  let LOCALE_TITLE_PAGE_AND = (
    "en": "and",
    "de": "und",
  )

  let LOCALE_FIGURE_OUTLINE_TITLE = (
    "en": "Figures",
    "de": "Abbildungen",
  )

  let LOCALE_TABLE_OUTLINE_TITLE = (
    "en": "Tables",
    "de": "Tabellen",
  )

  let LOCALE_LISTING_OUTLINE_TITLE = (
    "en": "Listings",
    "de": "Auszüge",
  )

  let LOCALE_GLOSARRY_TITLE = (
    "en": "Glossary",
    "de": "Glossar",
  )

  // --- Locale Overwrite -----------------------------------------------
  let AUTHOR_LAST_JOIN_CHAR = " " + LOCALE_TITLE_PAGE_AND.at(lang) + " "
  let AUTHOR_DECORATOR = LOCALE_TITLE_PAGE_BY.at(lang)

  // --- Logic -----------------------------------------------
  set text(
    lang: lang,
    size: TEXT_SIZE,
    font: TEXT_FONT,
  )

  set heading(
    numbering: HEADING_NUMBERING
  )

  show outline.entry.where(level: 1): entry => {
    v(3pt)
    text(weight: "bold", entry)
  }

  show heading.where(level: 1): heading => {
    text(
      size: HEADING_SIZE_LEVEL_1,
      font: HEADING_FONT,
      heading
    ) 
  }

  show heading.where(level: 2): heading => {
    text(
      size: HEADING_SIZE_LEVEL_2,
      font: HEADING_FONT,
      heading
    ) 
  }

  show heading.where(level: 3): heading => {
    text(
      size: HEADING_SIZE_LEVEL_3,
      font: HEADING_FONT,
      heading
    ) 
  }

  block(
    breakable: false,
    width: 100%,
    height: 100%,
    {
      if logo != none {
        if type(logo) == array {
          if logo.len() > 0 {
            let remainder = calc.rem(logo.len(), 3)
            let row_count = if logo.len() - remainder >= 3 {
              int(((logo.len() - remainder) / 3))
            } else {
              0
            }

            let columns = ()
            let i = 0
            while i < row_count {
              columns.push((33%, 33%, 33%))
              i += 1
            }

            let split_logos = if row_count > 0 {
              logo.chunks(logo.len() - remainder)
            } else if remainder > 0 {
              (none,logo)
            }

            if row_count > 0 {
              grid(
                align: center,
                columns: (33%, 33%, 33%),
                ..split_logos.at(0).map(icon => image("/" + icon))
              )
            }

            if remainder > 0 {
              let column_width = if row_count == 0 {
                100% / remainder   
              } else {
                33%
              }

              let columns = ()
              let i = 0
              while i < remainder {
                columns.push(column_width)
                i += 1
              }

              align(
                center,
                grid(
                  rows: 1,
                  columns: columns,
                  ..split_logos.at(1).map(icon => image("/" + icon))
                )
              )
            }
          }

        } else if type(logo) == str {
          if logo != "" {
            image(
              "/" + logo, width: 100%
            )
          }

        } else {
            panic("
              Unsupported type passed to '#schleiereule()' in parameter 'logo'.
              Parameter 'logo' must be of type array or string.
            ")
        }
      }

      let has_title = title != none and title != "" and title != [];
      if has_title {
        context {
          let title_width = measure(title).width.pt()
          let dynamic_title_width = calc.clamp(
            ((10 / title_width) * 10) * 50,
            MIN_TITLE_SIZE.pt(),
            MAX_TITLE_SIZE.pt()
          ) * 1pt

          align(
            center,
            text(
              size: dynamic_title_width,
              title
            )
          )
        }
      }

      let has_subtitle = subtitle != none and subtitle != "" and subtitle != [];
      if has_subtitle {
        context {
          let subtitle_width = measure(subtitle).width.pt()
          let dynamic_subtitle_width = calc.clamp(
            ((10 / subtitle_width) * 10) * 50,
            MIN_SUBTITLE_SIZE.pt(),
            MAX_SUBTITLE_SIZE.pt()
          ) * 1pt

          align(
            center,
            text(
              size: dynamic_subtitle_width,
              style: SUBTITLE_STYLE,
              subtitle
            )
          )
        }
      }

      if has_title or has_subtitle {
        line(length: 100%)

        if authors != none {
          align(
            center,
            text(
              size: 13pt,
              style: "italic",
              AUTHOR_DECORATOR,
            )
          )

          if type(authors) == array {
            align(
              center,
              text(
                size: 15pt,
                authors.join(
                  AUTHOR_JOIN_CHAR,
                  last: AUTHOR_LAST_JOIN_CHAR,
                )
              )
            )

          } else if type(authors) == str or type(authors) == content {
            align(
              center,
              text(size: 15pt, authors)
            )

          } else {
            panic("
              Unsupported type passed to '#schleiereule()' in parameter 'authors'.
              Parameter 'authors' must be of type array, string or content.
            ")
          }
        }
      }
    }
  )

  set page(numbering: "I")
  counter(page).update(1)

  context {
    if outlines.headings {
      outline()
    }

    if outlines.figures and counter(figure.where(kind: image)).final().at(0) > 0{
      outline(
        title: LOCALE_FIGURE_OUTLINE_TITLE.at(lang),
        target: figure.where(kind: image),
      )
    }

    if outlines.tables and counter(figure.where(kind: table)).final().at(0) > 0{
      outline(
        title: LOCALE_TABLE_OUTLINE_TITLE.at(lang),
        target: figure.where(kind: table),
      )
    }

    if outlines.listings and counter(figure.where(kind: raw)).final().at(0) > 0 {
      outline(
        title: LOCALE_LISTING_OUTLINE_TITLE.at(lang),
        target: figure.where(kind: raw),
      )
    }
  }

  if glossary != none {
    if type(glossary) == str {
      pagebreak()
      heading(LOCALE_GLOSARRY_TITLE.at(lang), numbering: none)
      show: make-glossary

      import("/" + glossary): entry_list

      register-glossary(entry_list)
      print-glossary(entry_list)
    } else {
      panic("
        Unsupported type passed to '#schleiereule()' in parameter 'glossary'.
        Parameter 'authors' must be of type string and point to a file.
      ")
    }
  }

  pagebreak()
  counter(heading).update(0)
  counter(page).update(1)

  set page(
    numbering: BODY_NUMBERING,
    header: context {
      let heading_text = ""

      let current_headings = query(
        selector(heading.where(level: 1))
      ).filter(h => h.location().page() == here().page())

      if current_headings != none and current_headings.len() > 0 {
        heading_text = current_headings.first().body

      } else {
        let headings_before = query(selector(heading).before(here()))
        let current_header = headings_before.filter(h => h.level == 1).last()
        heading_text = current_header.body
      }

      text(
        size: TEXT_SIZE,
        smallcaps(heading_text) 
      )

      line(length: 100%) 
    },
    footer: context {
      line(length: 100%)
      align(
        center,
        counter(page).display(),
      )
    }
  )

  set par(
    justify: true
  )

  set table(
    align: left,
    fill: (x, y) => if y == 0 {
      blue.lighten(70%)
    } else if calc.rem(y, 2) == 1 {
      luma(236)
    },
  )

  show table.cell.where(y: 0): strong

  if body != none {
    if type(body) == array { 
      for body_component in body {
        if  type(body_component) == content {
          body_component
          linebreak()

        } else if type(body_component) == str {
          include("/" + body_component)
          linebreak()

        } else {
          panic("
            Unsupported type passed to '#schleiereule()' in parameter 'body'.
            When using an array, all elements must be of type string or content.
          ")
        }
      }

    } else if type(body) == str {
      include("/" + body)
      linebreak()

    } else if type(body) == content { 
      body

    } else {
      panic("
        Unsupported type passed to '#schleiereule()' in parameter 'body'.
        Parameter 'body' must be of type array, string or content.
      ")
    }
  }

  pagebreak()
  counter(page).update(1)
  set page(numbering: "A")

  if bibliography_file != none {
    bibliography("/" + bibliography_file)
  }

  pagebreak()
  heading(
    level: 1,
    numbering: none,
    [Appendix],
  )

  if appendix != none {
    if type(appendix) == array { 
      for appendix_component in appendix {
        if  type(appendix_component) == content {
          appendix_component
          linebreak()

        } else if type(appendix_component) == str {
          include("/" + appendix_component)
          linebreak()

        } else {
          panic("
            Unsupported type passed to '#schleiereule()' in parameter 'appendix'.
            When using an array, all elements must be of type string or content.
          ")
        }
      }

    } else if type(appendix) == str {
      include("/" + appendix)
      linebreak()

    } else if type(appendix) == content { 
      appendix

    } else {
      panic("
        Unsupported type passed to '#schleiereule()' in parameter 'appendix'.
        Parameter 'body' must be of type array, string or content.
      ")
    }
  }
}
