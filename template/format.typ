// Copyright 2024 Thomas Gingele https://github.com/B1TC0R3

#import "@preview/acrostiche:0.5.1": *

/*
 * Add author information to a section.
 *
 * Example:
 *
 * #author-tag("Rainer Zufall", coauthor: "Max Musterman, Anderer Name")
 */
#import "author_tag.typ": author-tag

/*
 * Content and style of the content of the document
 */
#import "content_configuration.typ": content-configuration

/*
 *
 */
#import "appendix_configuration.typ": appendix-configuration

/*
 * Table of content.
 * This will print the titles of all sections as well as listings, tables and other 
 * figures.
 *
 * Listings, tables and figures can be disabled individually by settings their
 * corresponding flag to 'false'. 
 * Example:
 *
 * #table_of_content(
 *   listings: false,
 *   tables  : false,
 *   figures : false,
 * )
 */
#import "table_of_content.typ": table-of-content

/*
 * The titlepage.
 * Currently only displays title and author/s.
 * Example:
 *
 * #titlepage(
 *   title  : "Document Title",
 *   authors: ("Author A", "Author B")
 * )
 */
#import "titlepage.typ": titlepage

/*
 * Listings.
 * The 'highlight' parameter is optional.
 * Example:
 *
 * #listing(
 *   "Example Caption",
 *   ```bash
 *   echo "Hello World"
 *   ```,
 *   highlighted: (1,)
 * )
 */
#import "listing.typ": listing

/*
 * Add editor notes.
 * Example:
 * 
 * #note("This text will be displayed in a red box.")
 * #warning-note("This is some random warning, be cautious.")
 */
#import "notes.typ": note, good-note, warning-note, error-note

/*
 * A theme for normal tables.
 * Example:
 *
 * #styled-table(
 *   table(
 *     columns: ...
 *   )
 * )
 */
#import "styled_table.typ": styled-table

/*
 * A container for a vulnerability with CVSS score.
 * Example:
 *
 * #vulnerability(
 *   score: 7.8,
 *   title: [Some Vulnerability],
 *   description: [...]
 *   impact: [...],
 *   recommendation: [...]
 * )
 */
#import "vulnerability.typ": vulnerability

/*
 * Create a signature field.
 * Example:
 *
 * #signature_field(
 *   name: "Rainer Zufall",
 *   place: "Exampletopia",
 *   date: "08.11.2024"
 * )
 */
#import "signature_field.typ": signature-field
