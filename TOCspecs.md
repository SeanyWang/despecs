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

We now add the following two fields of metadata, `<url>` and `<toc>`, so that the structure will now look as follows:
```
<book>
  <meta>
    <hollis>HOLLIS NUMBER</hollis>
    <title>TITLE</title>
    <url>IMAGE VIEWER URL</url>
    <toc>
      TABLE OF CONTENTS INFORMATION
    </toc>
  </meta>
  <content>
  </content>
</book>
```

# Image viewer URL

Please copy and paste the URL of the image viewer into the metadata. For example, the file `07453713.txt` links to the catalog record [五涼考治六德集全誌](http://id.lib.harvard.edu/alma/990074537130203941/catalog). After clicking on 'View Online,' the image viewer will open. Please enter the URL as `<url>https://iiif.lib.harvard.edu/manifests/view/drs:49827457$1i</url>`.

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

In the table of contents, four fields of metadata are necessary to be entered: the section level （top three levels only), the section name, the section's starting sequence number, and its ending sequence number; the four fields are separated by the separator `|`. As you can see below, the section name field can often be copied directly without too much re-typing.

From browsing the scanned pages, one can see that the table of contents begins after `<pb />` on seq. 55 and ends before `<pb />` on seq. 57, within multiple `<ls>`. Now instead of re-typing the table of contents, one can simply navigate to later in the file, copy the texts already typed from seq. 55-57, and paste them to the metadata section. Once the texts have been pasted, edit them into the following `<toc>` format below, where the first two metadata fields can be immediately filled in based on the structure of the table of contents.

```
<toc>
1 | 上諭 首卷
1 | 星野
2 | 第一卷
1 | 沿革
2 | 第二卷
2 | 第三卷
1 | 形勝
2 | 第四卷
1 | 城池 疆域附
2 | 第五
2 | 第六卷
1 | 山川
2 | 第七卷
2 | 第八卷
2 | 第九卷
2 | 第十卷
2 | 第十一卷
2 | 第十二卷
2 | 第十三卷
1 | 水利
2 | 第十四卷
2 | 第十五卷
2 | 第十六卷
1 | 學校 貢院附
2 | 第十七卷
2 | 第十八卷
1 | 公署
2 | 第十九卷
2 | 第二十卷
[...]
1 | 藝文
2 | 詔敕表箋
3 | 第一百十四卷
2 | 劄子奏疏
3 | 第一百十五卷
[...]
3 | 一百十八卷
2 | 狀議
3 | 第一百十九卷
2 | 碑碣墓表
3 | 第一百二十
3 | 第一百二十一卷
2 | 記
3 | 第一百二十二卷
[...]
3 | 一百三十五卷
2 | 序
3 | 第一百三十六卷
[...]
3 | 一百三十九卷
2 | 書啟
3 | 第一百四十卷
2 | 論辨說考疏引
3 | 第一百四十一卷
2 | 傳贊頌銘
3 | 第一百四十二卷
2 | 題跋志書記畧
3 | 第一百四十三卷
2 | 文青詞
3 | 第一百四十四卷
2 | 教策講義語録文牒牌檄告約
3 | 第一百四十五卷
2 | 辭賦
3 | 第一百四十六卷
2 | 詩
3 | 第一百四十七卷
[...]
3 | 一百五十八卷 詩餘附末
1 | 雜記
2 | 第一百五十九卷
[...]
2 | 第一百六十二卷
```

Once this is done, then one must go through the files and locate the start and end sequence numbers of each section. Since this table of content covers multiple files, please add the file prefix before the specific sequence numbers. A tip: it is much easier to search for section headings based on keywords (e.g., 江西通志卷第三); try only using the image viewer for copying the URLs or for verification when the typed texts are unclear.

```
1 | 上諭 | 01-57 | 02-91
2 | 首卷之一 | 01-57 | 01-62
2 | 首卷之二 | 01-63 | 01-77
2 | 首卷之三 | 02-2 | 02-91
1 | 星野 | 03-2 | 03-26
2 | 第一卷 | 03-2 | 03-26
1 | 沿革 | 03-27 | 03-77
2 | 第二卷 | 03-27 | 03-53
2 | 第三卷 | 03-54 | 03-77
1 | 形勝 | 04-2 | 04-29
2 | 第四卷 | 04-2 | 04-29
1 | 城池 疆域附 | 04-29 | 05-42
2 | 第五卷 | 04-29 | 04-68
2 | 第六卷 | 05-2 | 05-42
1 | 山川 | 05-42 | 07-80
2 | 第七卷 | 05-42 | 05-66
2 | 第八卷 | 05-67 | 05-99
2 | 第九卷 | 06-2 | 06-37
2 | 第十卷 | 06-38 | 06-72
2 | 第十一卷 | 06-73 | 06-110
2 | 第十二卷 | 07-2 | 07-36
2 | 第十三卷 | 07-36 | 07-80
1 | 水利 | 08-2 | 09-37
2 | 第十四卷 | 08-2 | 08-33
2 | 第十五卷 | 08-33 | 08-74
2 | 第十六卷 | 09-2 | 09-37
1 | 學校 貢院附 | 09-38 | 10-46
2 | 第十七卷 | 09-38 | 09-77
2 | 第十八卷 | 10-2 | 10-46
1 | 公署 | 10-46 | 11-44
2 | 第十九卷 | 10-46 | 10-95
2 | 第二十卷 | 11-2 | 11-44
[...]
1 | 藝文 | 55-81 | 78-66
2 | 詔敕表箋 | 55-81 | 55-104
3 | 第一百十四卷 | 55-81 | 55-104
2 | 劄子奏疏 | 56-2 | 57-81
3 | 第一百十五卷 | 56-2 | 56-33
[...]
3 | 第一百十八卷 | 57-44 | 57-81
[...]
2 | 詩 | 73-2 | 78-66
3 | 第一百四十七卷 | 73-2 | 73-28
[...]
3 | 第一百五十八卷 詩餘附末 | 78-38 | 78-66
1 | 雜記 | 79-2 | 80-77
2 | 第一百五十九卷 | 79-2 | 79-48
[...]
2 | 第一百六十二卷 | 80-39 | 80-77
```

Putting this all together, the metadata section for the first file (`07468498-01.txt`) in this collection would look like the following:

```
<meta>
<hollis>07468498-01</hollis>
<title>［雍正］江西通志162卷首3卷</title>
<url>https://iiif.lib.harvard.edu/manifests/view/drs:428490607$1i</url>
<toc>
1 | 上諭 | 01-57 | 02-91
[...]
2 | 第一百六十二卷 | 80-39 | 80-77
</toc>
</meta>
```

And because the entire table of contents information is included with the first file, subsequent files from the second one onward will not have `<toc>` in the metadata, just the file's specific image viewer `<url>`. For example, the metadata section for the file `07468498-02.txt` would look like the following:

```
<meta>
<hollis>07468498-02</hollis>
<title>［雍正］江西通志162卷首3卷</title>
<url>https://iiif.lib.harvard.edu/manifests/view/drs:54470198$1i</url>
</meta>
```

## Scenario 2
