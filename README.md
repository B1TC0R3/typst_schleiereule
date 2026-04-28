# Schleiereule - A Typst Template
[![Compilable](https://github.com/B1TC0R3/typst_schleiereule/actions/workflows/compile_typst_doc.yml/badge.svg)](https://github.com/B1TC0R3/typst_schleiereule/actions/workflows/compile_typst_doc.yml)

## Content

1. [About](#about)
1. [Usage](#usage)
3. [Example](#example)

## 1. About

This repository contains a template aimed to be as adaptable as possible.
It offers easy-to-use functions to quickly set up a titlepage with up to two logos, toggleable outlines for chapters, figures, listings and tables as well as other neat features.

## Usage

All of the parameters shown below are optional.

```typ
#import "/template/template.typ": *

#schleiereule(
  /*
  * Alternatively, it is also possible to specify however many logos you want with an array.
  * Tiling is automatic.
  *
  * logo: ("logo1.png", "logo2.png", ...)
  * */
  logo: "images/logo.png",

  /*
  * The size of the title will scale automatically the longer/shorter it becomes.
  * This happens within a static threshold to prevent style issues.
  * */
  title: "This is an example title",

  /*
  * The size of the subtitle will scale automatically the longer/shorter it becomes.
  * This happens within a static threshold to prevent style issues.
  * */
  subtitle: "This is a subtitle",

  /*
  * Alternatively, it is possible to specify however many authors a required with an array.
  *
  * authors: ("Rainer Zufall", "Wilma Ruhe", ...)
  * */
  authors: "Rainer Zufall",

  /*
  * The path to the glossary file. The file has to export a dictionary named 'entry_list'
  * in accordance with the typst package 'glossarium'.
  *
  * Additional information: https://typst.app/universe/package/glossarium
  * */
  glossary: "glossary.typ",

  /*
  * The body of the paper. Can be a single string, piece of content, or an array with
  * both data types mixed. Strings will automatically be treated as filenames.
  * */
  body: (
    "content/example.typ",
    [
      = Second Chapter

      This is some additional custom content.
    ],
  ),

  /*
  * Works the same way as 'body' with support for strings, content, or arrays with both mixed.
  * */
  appendix: [This would be an appendix entry.],

  /*
  * The path to the bibliography file.
  * */
  bibliography_file: "bib.yml",

  /*
  * The language of the document.
  * Currently, only English and German are supported.
  * */
  lang: "en",
)
```

## 4. Example

Example typst code for how to work with the template can be found in [main.typ](./main.typ)
and [example.typ](./content/example.typ).

A compiled example for what the template looks like can be found in [example.pdf](./example.pdf).
