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

In the table of contents, four fields of metadata are necessary to be entered: the section level （top two levels only), the section name, the section's starting sequence number, and its ending sequence number; the four fields are separated by the separator `|`. As you can see below, the section name field can often be copied directly without too much re-typing.

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
1 | 書院
2 | 第二十一卷

2 | 第二十二卷 |  |
1 | 田賦 戶口附
第二十三卷至二十五卷 |  |
 | 風俗 第二十六卷 |  |
 | 土產 第二十七卷 |  |
 | 兵衛 漕運附第二十八卷 |  |
 | 武事 第二十九卷至三十三卷 |  |
關津 橋渡附第三十四卷
驛鹽 第三十五卷至三十七卷
古蹟 第三十八卷至四十二卷
封爵 第四十三卷至四十五卷
秩官 第四十六卷至四十八卷
選舉 第四十九卷至五十六卷
名宦 第五十七卷至六十五卷
<pb />
人物 第六十六卷至九十四卷
寓賢 第九十五第九十六卷
列女 第九十七卷至一百二卷
仙釋 第一百三卷至一百五卷
方技 第一百六卷
祥異 第一百七卷
祠廟 第一百八第一百九卷
邱墓 第一百十卷
寺觀 第一百十一卷至一百十三卷
藝文 第一百十四卷至一百五十八卷
詔敕表箋第一百十四卷劄子奏疏第一百十五卷至一百十八卷
狀議第一百十九卷
碑碣墓表第一百二十第一百二十一卷</ls></page>
<page seq="57"><ls>記第一百二十二卷至一百三十五卷
序第一百三十六卷至一百三十九卷
書啟第一百四十卷
論辨說考疏引第一百四十一卷
傳贊頌銘第一百四十二卷
題跋志書記畧第一百四十三卷
文青詞第一百四十四卷
教策講義語録文牒牌檄告約第一百四十五卷
辭賦第一百四十六卷
詩第一百四十七卷至一百五十八卷詩餘附末
雜記 第一百五十九卷至一百六十二卷
江西通志目錄</ls>
```

Once this is done, then one must go through the files and locate the start and end sequence numbers of each section. Since this table of content covers multiple files, please add the file prefix before the specific sequence numbers. A tip: it is much easier to search for section headings based on keywords (e.g., 江西通志卷第三).

```
1 | 上諭 首卷 | 01-57 |
1 | 星野 | 03-2
2 | 第一卷 | 03-2
1 | 沿革 | 03-27
2 | 第二卷 | 03-27
2 | 第三卷 | 03-54
1 | 形勝 | 04-2
2 | 第四卷 | 04-2
1 | 城池 疆域附 | 04-29
2 | 第五卷 | 04-29
2 | 第六卷 | 05-2
1 | 山川 | 05-42
2 | 第七卷 | 05-42
2 | 第八卷 | 05-67
2 | 第九卷 | 06-2
2 | 第十卷 | 06-38
2 | 第十一卷 | 06-73
2 | 第十二卷 | 07-2
2 | 第十三卷 | 07-36
1 | 水利 | 08-2
2 | 第十四卷 | 08-2
2 | 第十五卷 | 08-33
2 | 第十六卷 | 09-2
1 | 學校 貢院附 | 09-38
2 | 第十七卷 | 09-38
2 | 第十八卷 | 10-2
1 | 公署 | 10-46
2 | 第十九卷 | 10-46
2 | 第二十卷 | 11-2
1 | 書院 | 11-45
2 | 第二十一卷 | 11-45
```
