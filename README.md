# Schleiereule - A Typst Template

[![Compilable](https://github.com/B1TC0R3/typst_schleiereule/actions/workflows/compile_typst_doc.yml/badge.svg)](https://github.com/B1TC0R3/typst_schleiereule/actions/workflows/compile_typst_doc.yml)

## Content

1. [About](#about)
2. [Usage](#usage)
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

### titlepage()

This function will create a titlepage.

Parameters:

| Name | Optional | Datatype | Description |
|------|----------|----------|-------------|
| `titlepage` | Yes | String | The title of the paper. |
| `subtitle`  | Yes | String | The subtitle of the paper. |
| `author`    | Yes | String | The author/s of the paper as a single string. |
| `logos`     | Yes | Array (Paths) | An array containing one or two relative/absolute paths to images. The images will automatically be resized. |
| `date` | Yes | String | The date that the paper is released on. |
| `content` | Yes | String | Freely editable section of the titlepage. Can be used when additional information or images should be displayed. |


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

### table\_of\_content()

This function will render an outline of the content and optionally of all listings, figures and tables.

Parameters:


| Name | Optional | Datatype | Description |
|------|----------|----------|–------------|
| `listings` | Yes | Boolean | Will not render an outline for listings when set to false. |
| `figures` | Yes | Boolean | Will not render an outline for figures when set to false. |
| `tables` | Yes | Boolean | Will not render an outline for tables when set to false. |

```typst
#table_of_content(
    listings: false
)
```

### listing()

This function is a wrapper for the typst package `codelst`.
It allows the addition of labeled sections of code to the paper.
Listings will automatically be displayed in the listings index unless the document
is configured otherwise.

Parameters:

| Name | Optional | Datatype | Description |
|------|----------|----------|–------------|
| `caption` | No | String | The caption of the listings. This text is also displayed in the listing outline. |
| `code` | No | Sourcecode | This section is rendered with syntax highlighting. The exact highlighting style depends on the specified langage. |
| `highlight` | Yes | Array (Integer) | Specify an arbitrary ammount of lines which will be highlighted in the listing. |

```typst
#listing(
    "This is an example caption",
    ```Bash
    sudo echo "Example commands" > some_file
    rm some_file
    \```,
    highlight: (1, 2,)
)
```

### note()

This function is a wrapper function for the typst package `drafting`.
It will add a neutral looking note to the paper.

Parameters: 

| Name | Optional | Datatype | Description |
|------|----------|----------|–------------|
| `content` | No | String | The contents of the note. |

### warning-note()

This function is a wrapper function for the typst package `drafting`.
It will add a red/orange looking note to the paper.

Parameters: 

| Name | Optional | Datatype | Description |
|------|----------|----------|–------------|
| `content` | No | String | The contents of the note. |
 

## 4. Example

- WIP
