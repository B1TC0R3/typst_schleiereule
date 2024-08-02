# Schleiereule - A Typst Template
[![Compilable](https://github.com/B1TC0R3/typst_schleiereule/actions/workflows/compile_typst_doc.yml/badge.svg)](https://github.com/B1TC0R3/typst_schleiereule/actions/workflows/compile_typst_doc.yml)

## Content

1. [About](#about)
2. [Styles](#styles)
2. [Functions](#functions)
    - [titlepage](#titlepage)
    - [table\_of\_content](#table_of_content)
    - [listing](#listing)
    - [note](#note)
    - [styled-table](#styled-table)
    - [vulnerability](#vulnerability)
3. [Example](#example)

## 1. About

This repository contains a template aimed to be as adaptable as possible.
It offers easy-to-use functions to quickly set up a titlepage with up to two logos, toggleable outlines for chapters,
figures, listings and tables as well as other neat features.

## 2. Styles

**content-configuration** contains the look-and-feel for the main body of the paper.
It can be applied by adding the following line.
All typst code after the `#show` statement will take the rules set by the configuration into account.

```
#show: doc => content_configuration(doc)
```

**appendix-configuration** changes the configuration applied by **content-configuration**
slightly. At the moment this only means changing the page numbering style from numbers to letters.

## 3. Functions

### titlepage

This function will create a titlepage.

#### Parameters

| Name | Optional | Datatype | Description |
|------|----------|----------|-------------|
| `titlepage` | Yes | content | The title of the paper. |
| `subtitle`  | Yes | content | The subtitle of the paper. |
| `author`    | Yes | content | The author/s of the paper as a single string. |
| `logos`     | Yes | Array (Paths) | An array containing one or two relative/absolute paths to images. The images will automatically be resized. |
| `date` | Yes | content | The date that the paper is released on. |
| `content` | Yes | content | Freely editable section of the titlepage. Can be used when additional information or images should be displayed. |


```typst
#titlepage(
    title   : "Example Title",
    subtitle: "Example Subtitle",
    author  : "Some Guy",
    logos   : ("path/to/logo_a.png", "path/to/logo_b.png"),
    date    : datetime.today().display("[day].[month].[year]"),
    content : [
        *NOTICE*:
        This is an extra bit of example text.
    ]
)
```

### table_of_content

This function will render an outline of the content and optionally of all listings, figures and tables.

#### Parameters


| Name       | Optional | Datatype | Description |
|------------|----------|----------|-------------|
| `listings` | Yes      | Boolean  | Will not render an outline for listings when set to false. |
| `figures`  | Yes      | Boolean  | Will not render an outline for figures when set to false. |
| `tables`   | Yes      | Boolean  | Will not render an outline for tables when set to false. |

```typst
#table_of_content(
    listings: false
)
```

### listing

This function is a wrapper for the typst package [codelst](https://github.com/typst/packages/tree/main/packages/preview/codelst).
It allows the addition of labeled sections of code to the paper.
Listings will automatically be displayed in the listings index unless the document
is configured otherwise.

#### Parameters

| Name        | Optional | Datatype        | Description |
|-------------|----------|-----------------|-------------|
| `caption`   | No       | content         | The caption of the listings. This text is also displayed in the listing outline. |
| `code`      | No       | raw             | This section is rendered with syntax highlighting. The exact highlighting style depends on the specified langage. |
| `highlight` | Yes      | Array (Integer) | Specify an arbitrary ammount of lines which will be highlighted in the listing. |

```typst
#listing(
    "This is an example caption",
    ```Bash
    sudo echo "Example commands" > some_file
    rm some_file
    ```,
    highlight: (1, 2,)
)
```

### note

This function is a wrapper function for the typst package [drafting](https://github.com/typst/packages/tree/main/packages/preview/drafting).
It will add a neutral looking note to the paper.

#### Parameters

| Name      | Optional | Datatype | Description |
|-----------|----------|----------|-------------|
| `content` | No       | content  | The contents of the note. |
| `width`   | Yes      | auto, relative | The width of the box in which the note is contained. |
| `stroke`  | Yes      | none, auto, length, color, gradient, stroke, pattern, dictionary | The stroke of the rectangle drawn around the note. |
| `fill`    | Yes      | none, color, gradient, pattern | The backgroundcolor of the rectangle drawn around the note. |

Multiple wrapper functions with different color configurations also are available in the template.
These are:

- `#good-note(...)`: Colored green
- `#warning-note(...)`: Colored orange
- `#error-note(...)`: Colored red

```typst
#note([
    This is an example note.
])
```

### styled-table

This is a wrapper for a normal table.
It addes some stylistics to it.

> Note: This function may later be made a part of the theme itself, but it its own function for now to leave the user a choice.

#### Parameters

| Name      | Optional | Datatype | Description |
|-----------|----------|----------|-------------|
| `table`   | No       | table    | The table whichs style will be changed. |

```typst
#styled-table(
    #table(
        columns: 2,
        [*A*], [*B*],
        [a], [b],
    )
)
```

### vulnerability

Adds a pre-configured table to explain a vulnerbility.
Color and severit automatically update based on the give cvss 3.0 score.

#### Parameters

| Name      | Optional | Datatype | Description |
|-----------|----------|----------|-------------|
| `cvss`    | Yes      | Integer  | The CVSS 3.0 score of the vulnerability. |
| `title`   | Yes      | String, content | The title of the vulnerability. |
| `description` | Yes | String, content | A description of the vulnerability. |
| `impact` | Yes | String, content | The impact of the vulnerability. |
| `recommendation`| Yes | String, content | A recommendation on how to deal with the vulnerability. |

```typst
#vulnerability(
    cvss: 7.8,
    title: [Some Vulnerability],
    description: [...],
    impact: [...],
    recommendation: [...]
)
```

### signature_field

Allows the user to add a field for signatures onto the document.

> Note: Feature currently untested

#### Parameters

| Name | Optional | Datatype | Description |
|------|----------|----------|-------------|
| `name`  | Yes | String, content | The name of the signee, printed below the signature field in. |
| `place` | Yes | String, content | The place where the document was signed. |
| `date`  | Yes | String, content | The date of the signature. Defaults to the current date. |
| `spacing` | Yes | Unit | The distance between the previous content and the signature field. Defaults to 40pt. |
| `length` | Yes | Unit | The length of the signature field. Defaults to 200pt. |

```typst
#signature_field(
    name: "Rainer Zufall",
    place: "Exampletopia",
    date: "08.11.2024"
)
```

## 4. Example

An example for what the template looks like can be found [here](./example.pdf).
