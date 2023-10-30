/*
 * Content and style of the content of the document
 */
#import "content_configuration.typ": content_configuration

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
#import "table_of_content.typ": table_of_content

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