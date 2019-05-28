---
title: Table of contents and other metadata addition, v.1
author: Sean Wang
---

# Preamble

Since 2018, several hundred titles of local gazetteers from the Harvard-Yenching Library have been typed, currently totaling 707 files. In this round, we plan to add table-of-contents and related metadata to the files, in order to enrich its utility to our scholars. We will provide a spreadsheet of all the files to be amended in this round.

Each file already contains the following structure:
```
<book>
  <meta>
    <hollis>HOLLIS NUMBER</hollis>
    <title>TITLE</title>
  </meta>
  <content>
  </content>
</book>
```

We now add the following two fields of metadata, `<drs>` and `<toc>`, so that the structure will now look as follows:
```
<book>
  <meta>
    <hollis>HOLLIS NUMBER</hollis>
    <title>TITLE</title>
    <drs>DRS NUMBER</drs>
    <toc>
      TABLE OF CONTENTS INFORMATION
    </toc>
  </meta>
  <content>
  </content>
</book>
```

# DRS Number

Based on the URL of the image viewer, please enter the DRS number in the metadata. For example, the file `07453713.txt` links to the catalog record [五涼考治六德集全誌](http://id.lib.harvard.edu/alma/990074537130203941/catalog). After clicking on 'View Online,' the image viewer will open. From the URL, please copy the DRS number and enter it as `<drs>49827457</drs>`.

![DRS number from the image viewer](lgimg/drs1.png)

# Table of contents

We want to capture the table of contents (目錄) information from the image viewer, including starting and ending sequence numbers for each section. To do so, one must first determine which of the three possible scenarios each file falls under:

1. The file is only part of a local gazetteer title: *rare but easy to detect*
2. The file is the entirety of a local gazetteer title: *the most common scenario*
3. The file contains multiple local gazetteer titles: *more difficult to detect*

Below we provide examples on how to enter table of contents information for all three scenarios.

## Scenario 1

Files under this scenario are easy to detect because their names will be in the format `HOLLIS#-xxx.txt`, where the HOLLIS numbers will be the same. For example, the catalog record [江西通志](http://id.lib.harvard.edu/alma/990074684980203941/catalog) produced 80 separate files, from `07468498-01.txt` to `07468498-80.txt`, with each representing one image viewer from [this list](https://listview.lib.harvard.edu/lists/drs-50151964). In this scenario, the table of contents information from all 80 files should be entered only in the first file `07468498-01.txt`, but the specific DRS numbers are entered in every corresponding file.

In the first file, `07468498-01.txt`, one can immediately add `<drs>428490607</drs>` to the metadata, based on the image viewer.

![DRS number from the image viewer](lgimg/drs2.png)

Then, scroll down the navigation on the left-hand side to locate the sequence with 目錄, in this case seq. 55.

![locating TOC from the image viewer](lgimg/toc1.png)

From browsing the scanned pages, one can see that the table of contents begins after `<pb />` on seq. 55 and ends before `<pb />` on seq. 57. Now instead of re-typing the table of contents, one can simply navigate to later in the file, copy the texts already typed from seq. 55-57, and paste them to the metadata section.
