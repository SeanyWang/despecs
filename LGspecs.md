---
title: Typing Specifications for Chinese Local Gazetteers, v.1
author: Sean Wang
---

# File conventions

Save the text in plain text format (`.txt`) with Unicode `utf-8` encoding. Each Chinese local gazetteer title is saved in its own `.txt` file. Create a `.zip` archive of all files.

Make use of the complete character repertoire found in Unicode version 5.1. This includes characters in the following Unicode blocks when applicable:

* CJK Unified Ideographs Extension A (U+3400 -- U+4DFF)
* CJK Unified Ideographs Extension B (U+20000 -- U+2A6DF)

At this point, do not make use of the characters in Extension C or D.

We will also need the list of unknown characters and symbols. Please send the list in two versions, both in the original file format (e.g. RTF, DOC, XLS) and as PDF.

Every file should begin with `<book>` and end with `</book>`. All transcription and other tags should be placed between the `<book>` tags.

The file structure should look as follows:
```
<book>
  <meta>
  ...
  </meta>
  <content>
  ...
  </content>
</book>
```

## Metadata

Each gazetteer file corresponds to a catalog record from the Harvard-Yenching Library's [Chinese Rare Local Gazetteers collection](https://hollis.harvard.edu/primo-explore/search?query=any,contains,Harvard-Yenching%20Library%20Chinese%20Local%20Gazetteers%20Project%22&tab=everything&search_scope=everything&vid=HVD2&lang=en_US&offset=0&fromRedirectFilter=true). Type metadata information in the file between the `<meta>` and `</meta>` tags, using fields provided in each individual catalog record.

For example:
```
<meta>
  <title>TITLE</title>
  <attribution>ATTRIBUTION</attribution>
  <author>AUTHOR</author>
  <published>PUBLISHED DATE</published>
  <description>DESCRIPTION</description>
  <notes>NOTES</notes>
  <subjects>SUBJECTS</subjects>
  <created>CREATION DATE</created>
  <hollis>HOLLIS NUMBER</hollis>
  <url>PERMALINK</url>
  <source>SOURCE</source>
</meta>
```

# Contents

Type all contents of each gazetteer between the `<content>` and `</content>` tags. Always start typing from the table of contents.

Begin every page with `<page>` and end with `</page>`. Type the page's entire content in one line between the two brackets `<page>` and `</page>`.

Ignore line changes in the text if the lines are part of the same paragraph. *However*, if there are any in-line spaces in the text or line breaks (e.g. spaces within a line or paragraph breaks), type one single space to represent them regardless of the length of space(s). For example:

Image | Markup
----- | ------
<img src="lgimg/txt2.jpg"> | `<page>務張之[...]以蘇辛未移疾[...]幽獨中</page>`<br />**Note:** There are no in-line spaces or paragraph changes, so ignore line changes and type the entire page in one line.
<img src="lgimg/txt1.jpg"> | `<page>大清[...]生 王三[...]人 割股[...]人 宋史思賢[...]人<001>心療母母子俱全王弟[...]</page>`<br />**Note:** Use one single space to represent any in-line spaces (regardless of length) and paragraph changes. This text contains parallel lines and an unknown (i.e. untypable) character, and the markup code makes use of the corresponding protocols (see below).

Do not type any repetitive marginalia, e.g. book title and page numbers.

If there are blank pages in between texts, rather than at the very beginning (i.e. before the table of contents) or the very end of each gazetteer, still type the `<page>` and `</page>` tags but nothing in between them to indicate a blank page.

For example:
```
<content>
  <page>TEXTS</page>
  <page></page>
  <page>TEXTS</page>
</content>
```

**Note:** In the digitization of the gazetteers, two pages may be on the same scan or on two consecutive scans.

## Fontsize

Sometimes there are changes in fontsize, e.g. subscripts, or small-fonts arranged in parallel in one line. Simply disregard these fontsize changes and continue typing the texts *in the order of text flows*. For example:

Image | Markup
----- | ------
<img src="lgimg/txt3.jpg"> | `<page>恍惚[...]心也陸文定[...]急流勇退[...]不知何如也遠近[...]間 張祥[...]</page>`<br />**Note:** Ignore the single space at the end of the parallel-line, as it does not represent a paragraph change and instead results from having an odd number of characters in the parallel-line section.
<img src="lgimg/txt4.jpg"> | `<page>水注[...]即此江總[...]西峰石壁[...]</page>`<br />`<page>中一碑[...]</page>`

# Tables and Lists

Continue typing in one single line per page and use a single space as field separators between the table cells.

**Note:** If you can identify a single space within a name etc. as a decorative space to make the table layout optically more pleasing, do not type it. For example:

Image | Markup
----- | ------
<img src="lgimg/tab1.jpg"> | `<page>楊家坊 李家口 [...] 西稍門 以上西鄉共八十五庄</page>`
<img src="lgimg/tab2.jpg"> | `<page>監察御史鄭智 監察御史曾鳳韶 監察御史王彬 [...]</page>`
<img src="lgimg/tab3.jpg"> | `<page>十六年 楚 棠邑 平陵邑 敬王三十四年 吳 棠邑 平陵邑 元王二年 楚 棠邑 越 平陵邑 [...]</page>`<br />**Note:** See protocol for parallel-line texts above.
<img src="lgimg/tab4.jpg"> | `<page>興教寺 在東[...]記 觀音寺 在西門[...]省志 [...]</page>`<br />**Note:** Ignore blank line and treat it as a regular paragraph break, i.e. represent it with a single space.
<img src="lgimg/tab5.jpg"> | `<page>庚辰 [...] 嘉靖壬午 [...]</page>`<br />**Note:** Be careful with parallel-line texts that only have one character in each line.
<img src="lgimg/tab6.jpg"> | `<page>歷官表上 卷之十六 [...] 卷之二十</page>`<br />`<page>人物傳一 卷之二十一 [...] 卷之二十五</page>`<br />**Note:** This is a typical gazetteer table of contents.

# Images

Use the `<img />` tag to mark any images without any caption/title or texts embedded within it.

* If there is a caption/title available, include it inside the tag, i.e. `<img title="CAPTION" />`.
* If the image has texts embedded within, type the texts in between the `<img>` tags, i.e. `<img>TEXTS</img>`.
* If the image has both a caption and texts embedded within, combine the two protocols above, i.e. `<img title="CAPTION">TEXTS</img>`.

For example:

Image | Markup
----- | ------
<img src="lgimg/fig1.jpg"> | `<page><img /></page>`
<img src="lgimg/fig2.jpg"> | `<page><img title="學宮<002>">東 訓導 儒學 教諭宅 東廡 名宦祠</img></page>`<br />**Note:** This image caption contains an unknown (i.e. untypable) character and the code makes use of the corresponding protocol (see below).
<img src="lgimg/fig3.jpg"> | `<page><img title="東西哲陳設圖">栗 鹿脯 鹽 棗 燭 [continue typing all texts]</img></page>`<br />**Note:** This is a list-figure with a title, so combine the list and image protocols.
<img src="lgimg/fig4.jpg"> | `<page><img title="南朝都建康圖">建興郡 句容縣 [continue typing all texts]</img></page>`<br />`<page><img>親康宮 @@ [continue typing all texts]</img></page>`<br />**Note:** Although this map spans two pages, its caption (in its entirety) appears only on the first page. Thus, treat the first page as an image with both caption and texts embedded within, and the second page as an image with only texts embedded within. Also, the second page contains unreadable characters and the code makes use of the corresponding protocol (see below).
<img src="lgimg/fig6.jpg"> | `<page><img /></page>`<br />`<page><img title="天印山">在城南四十里高[continue typing all texts without line changes]</img></page>`<br />**Note:** Same as above, except that the caption is on the second page.
<img src="lgimg/fig5.jpg"> | `<page><img title="城圖-1">東 太山行宮 [continue typing all texts]</img></page>`<br />`<page><img title="城圖-2">大士閣 @洞 北 [continue typing all texts]</img></page>`<br />**Note:** This map spans two pages and its caption ("城圖") also spans the two pages. In this case, type the entire caption inside every page's `<img title="">` tag and add "-[number of page]" to the caption, i.e. `<img title="城圖-1">`.
<img src="lgimg/fig7.jpg"> | `<page><img title="星野圖">東 危 北 南 虛 西</img></page>`<br />**Note:** This image's caption is embedded within.

## Stamps

Ignore stamps and other images that are not part of the actual gazetteer contents (see also marginalia protocol above).

# Miscellaneous Characters

## Unreadable Characters

If there is a unreadable character in the text, type the symbol `@` as substitute. Use one `@` for each unreadable character, e.g. `UNR@@DABLE`.

## Unknown Characters

If there is an unknown character in the text, i.e. a character variant which is readable but where you cannot identify the standard character or cannot type it, add it to the numbered list of unknown characters. From then on, type its number whenever it occurs in the text, e.g. `<001>`.

Before you create a number for an unknown character, first check whether it is already on the list of unknown characters. Assign the number `<001>` to the first unknown character, `<002>` to the second unknown character, and so on. Do not assign the same number twice. Use this number to type the unknown character. Always use the same number if the same unknown character occurs again.

**Please note:** Make sure that for a given gazetteer title there is a single list containing all unknown characters, and that everyone uses this list. When the text is sent back to us, we will need a copy of this list.

## Symbols

There are sometimes symbols (excluding punctuation marks) in the texts, e.g. circles. Treat these symbols as unknown characters and follow the same protocol above.
