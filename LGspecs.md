---
title: Typing Specifications for Chinese Local Gazetteers
author: Sean Wang
date: 21 August 2018
---

# File conventions

Save the text in plain text format (`.txt`) with Unicode `utf-8` encoding. Each Chinese local gazetteer title is saved in its own `.txt` file. Create a `.zip` archive of all files.

Make use of the complete character repertoire found in Unicode version 5.1. This includes characters in the following Unicode blocks when applicable:

* CJK Unified Ideographs Extension A (U+3400 -- U+4DFF)
* CJK Unified Ideographs Extension B (U+20000 -- U+2A6DF)

At this point, do not make use of the characters in Extension C or D.

We will also need the list of unknown characters (see \sect{section unknown characters}) and the list of character variants (see \sect{section character variants}). Please send each list in two versions, namely in the original file format (e.g. RTF, DOC, XLS) and as PDF.

# General markup

Start typing from the table of contents. METADATA??? TABLE OF CONTENTS???

Begin every page with `<page>` and end with `</page>`. Type the page's entire content in one line between the two brackets `<page>` and `</page>`. Ignore line breaks in the text.

If there are blank pages in between texts, rather than at the very beginning (i.e. before the table of contents) or the very end of each gazetteer, still type the `<page>` and `</page>` tags but nothing in between them to indicate a blank page.

**Please note:** In the digitization of the gazetteers, two pages may be on the same scan or on two consecutive scans.

## Fontsize

Sometimes there are changes in fontsize, e.g. subscripts, or small-fonts arranged in parallel in one line. Simply disregard these fontsize changes and continue typing the texts *in the order of text flows*.

# Tables and Lists

Continue typing in one single line per page and use a single space as field separators.

**Please note:** If you can identify a single space within a name etc. as a decorative space to make the table layout optically more pleasing, do not type it.

# Images

Use `<img>` and `</img>` tags to mark any images. If there is a caption available or if the image has texts embedded, type the texts in between the `<img>` tags. Otherwise, leave a single space between the the `<img>` tags.

## Stamps

Ignore stamps and other images that are not part of the actual gazetteer contents.

# Miscellaneous Characters

## Unreadable Characters

If there is a unreadable character in the text, type the symbol `@` as substitute. Use one `@` for each unreadable character, e.g. `unr@@dable`.

## Unknown Characters

If there is an unknown character in the text, i.e. a character variant which is readable but where you cannot identify the standard character or cannot type it, add it to the numbered list of unknown characters. From then on, type its number whenever it occurs in the text, e.g. `<001>`.

Before you create a number for an unknown character, first check whether it is already on the list of unknown characters. Assign the number `<001>` to the first unknown character, `<002>` to the second unknown character, and so on. Do not assign the same number twice. Use this number to type the unknown character. Always use the same number if the same unknown character occurs again.

**Please note:** Make sure that for a given gazetteer title there is a single list containing all unknown characters, and that everyone uses this list. When the text is sent back to us, we will need a copy of this list.

## Symbols

There are sometimes symbols (excluding punctuation marks) in the texts, e.g. circles. Treat these symbols as unknown characters and follow the same protocol.
