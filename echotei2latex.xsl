<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                exclude-result-prefixes="xs tei"
                version="2.0">

  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:strip-space  elements="*"/>
  <!--
      make:
      - formatting of several authors
      - some fields could contain markup, this is currently ignored
  -->

  <xsl:template match="*">
    <!--
        catchall template
        https://stackoverflow.com/questions/3360017/why-does-xslt-output-all-text-by-default
    -->
    <xsl:message terminate="no">WARNING: Unmatched element: <xsl:value-of select="name()"/></xsl:message>

    <xsl:apply-templates/>
  </xsl:template>


  <xsl:template match="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title">
    <xsl:text>\documentclass[12pt, twoside,
    headings=small]{scrbook}&#x000a;\usepackage{luaotfload}&#x000a;\usepackage[EU2]{fontenc}&#x000a;\usepackage{graphicx}&#x000a;\usepackage{libertine}&#x000a;\setlength{\fboxsep}{3pt}&#x000a;\setlength{\fboxrule}{2pt}&#x000a;\usepackage{etoolbox}&#x000a;\makeatletter&#x000a;\patchcmd{\scr@startchapter}{\if@openright\cleardoublepage\else\clearpage\fi}{}{}{}&#x000a;\makeatother&#x000a;\usepackage{hyperref}
</xsl:text>
  </xsl:template>

  <!-- ignore some header fields -->
  <xsl:template match="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author|tei:editor|tei:resp|tei:persName"/>
  <xsl:template match="//tei:teiHeader/tei:fileDesc/tei:editionStmt|tei:publicationStmt"/>
  <xsl:template match="//tei:teiHeader/tei:fileDesc/tei:sourceDesc"/>
  <xsl:template match="//tei:teiHeader/tei:encodingDesc|tei:profileDesc|tei:revisionDesc"/>

  <xsl:template match="tei:body//tei:p[not(ancestor::tei:note)]">
    <xsl:choose>
      <xsl:when test="@rend='Quote'">
        <xsl:text>\begin{quote}</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>\end{quote}</xsl:text>
      </xsl:when>
      <xsl:otherwise>
    <xsl:text>&#x000a;&#x000a;</xsl:text>
    <xsl:apply-templates />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="tei:body">
    <xsl:text>&#x000a;\begin{document}&#x000a;\input{frontmatter}&#x000a;%beginning of chapter&#x000a;</xsl:text>

    <xsl:apply-templates />
    <xsl:text>% end of chapter&#x000a;\end{document}&#x000a;</xsl:text>
  </xsl:template>
  <!--
      <xsl:template match="interview">
      <xsl:text>\section{Interview mit </xsl:text>
      <xsl:value-of select="@pseudonym"/>
      <xsl:text>}&#x000a;</xsl:text>
      <xsl:text>\begin{tabular}{l l}&#x000a;\textbf{Pseudonym:} &amp;</xsl:text>
      <xsl:value-of select="@pseudonym"/>
      <xsl:text>\\&#x000a;\textbf{ID:} &amp;</xsl:text>
      <xsl:value-of select="@code"/>
      <xsl:text>\\&#x000a;\textbf{Datum:} &amp;</xsl:text>
      <xsl:value-of select="@datum"/>
      <xsl:text>\\&#x000a;\textbf{Zeit:} &amp;</xsl:text>
      <xsl:value-of select="@anfang"/><xsl:text>&#x0020;&#x2013;&#x0020;</xsl:text><xsl:value-of select="@ende"/>
      <xsl:text>\\&#x000a;\textbf{Dauer:} &amp;</xsl:text>
      <xsl:value-of select="@dauer"/>
      <xsl:choose>
      <xsl:when test="@bemerkungen=''">
      <xsl:message>No Bemerkung</xsl:message>
      </xsl:when>
      <xsl:otherwise>
      <xsl:text>\\&#x000a;\textbf{Bemerkungen:} &amp;</xsl:text>
      <xsl:value-of select="@bemerkungen"/>
      </xsl:otherwise>
      </xsl:choose>
      <xsl:text>&#x000a;\end{tabular}&#x000a;\begin{center}&#x000a;\line(1,0){250}&#x000a;\end{center}&#x000a;</xsl:text>
      <xsl:text>\resetlinenumber&#x000a;\begin{linenumbers}</xsl:text>
      <xsl:apply-templates />
      <xsl:text>&#x000a;\end{linenumbers}</xsl:text>
      </xsl:template>
  -->

  <xsl:template match="//tei:cb"/>

  <xsl:template match="//tei:pb">
    <xsl:text>&#x000a;&#x000a;&#x000a;&#x000a;\noindent\fbox{{\ttfamily </xsl:text>
    <xsl:choose>
      <xsl:when test="@n">
        <xsl:text>Beginning of page </xsl:text>
        <xsl:value-of select="@n"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>Beginning of unnumbered page</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>}}&#x000a;</xsl:text>
  </xsl:template>

  <xsl:template match="//tei:lb[not(ancestor::tei:cell)]">
    <xsl:text>\newline
    </xsl:text>
  </xsl:template>

  <xsl:template match="//tei:gap">
    <xsl:text>\fbox{{\ttfamily </xsl:text>
    <xsl:text>??</xsl:text>
    <xsl:text>}}</xsl:text>
  </xsl:template>

  <xsl:template match="//tei:hi[@rend='emph']">
    <xsl:text>\emph{</xsl:text>
    <xsl:apply-templates />
    <xsl:text>}</xsl:text>
  </xsl:template>

    <xsl:template match="//tei:hi[@rend='sp']">
    <xsl:text>\emph{</xsl:text>
    <xsl:apply-templates />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="//tei:hi[@rend='bold']">
    <xsl:text>\textbf{</xsl:text>
    <xsl:apply-templates />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="//tei:div[@type='section']/tei:head">
        <xsl:text>&#x000a;&#x000a;\chapter*</xsl:text>
    <xsl:text>{</xsl:text>
    <xsl:apply-templates />
    <xsl:text>}</xsl:text>
    <xsl:text>&#x000a;</xsl:text>
  </xsl:template>

  <xsl:template match="//tei:bibl">
    <xsl:choose>
      <xsl:when test="./tei:ref[@type='inline']">
        <xsl:text>\EOAciteyear</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>\EOAciteauthoryear</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="./tei:citedRange[not(@*)]">
        <xsl:text>[</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>]</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="./tei:citedRange/@from">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="./tei:citedRange/@from"/>
            <xsl:choose>
              <xsl:when test="./tei:citedRange/@to">
                <xsl:text>–</xsl:text>
                <xsl:value-of select="./tei:citedRange/@to"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:message>INFO: citation has no to value</xsl:message>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:text>]</xsl:text>
          </xsl:when>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>{</xsl:text>
    <xsl:value-of select="substring-after(./tei:ref/@target, '#')"/>
    <xsl:text>}</xsl:text>
  </xsl:template>

  <!--
      <xsl:template match="//tei:note[@place='bottom']/tei:p[position() = last()]">
      <xsl:message>last </xsl:message>
      </xsl:template>
  -->
  <xsl:template match="//tei:note">
    <xsl:text>\marginpar{</xsl:text>
        <xsl:apply-templates/>
    <xsl:text>}</xsl:text>
  </xsl:template>



  <xsl:template match="//tei:note[@place='bottom']">
    <xsl:text>\EOAfn{</xsl:text>
    <xsl:choose>
      <xsl:when test="count(./tei:p)=1">
        <xsl:apply-templates/>
      </xsl:when>
      <xsl:when test="count(./tei:p)>1">
        <xsl:message>INFO: Number of paragraphs in larger than 1 </xsl:message>
        <xsl:for-each select="./tei:p">
          <xsl:choose>
            <xsl:when test="position() != last()">
              <xsl:apply-templates />
              <xsl:text>\EOAfnpar</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
      </xsl:when>
    </xsl:choose>
    <xsl:text>}</xsl:text>
  </xsl:template>

  <!-- <figure><graphic url="images/Fig.1CarteDuCielPotsdam.jpg"/><head>Glass photographic plate from the Carte du Ciel survey, Potsdam Observatory, Plate 5, taken January 11, 1894. The plate is approximately 16 cm x 16 cm; each plate covered two square degrees of the sky. Courtesy of the Leibniz-Institut für Astrophysik, Potsdam</head></figure>

\EOAfigure{images/1.jpg}{Ostafrikanische Arbeiter an einem der großen Knochengräben, die während der paläontologischen Expedition des \EOAemph{Berliner Naturkundemuseums} in die damalige Kolonie Deutsch-Ostafrika zwischen 1909 und 1913 angelegt wurden. (Koloriertes Glasdiapositiv, Museum für Naturkunde Berlin, Historische Bild- u. Schriftgutsammlungen, Bestand: Pal. Mus., Signatur: B V/177)}{sec2:image1a}{66}{H}
  -->

  <xsl:template match="//tei:body//tei:ref[starts-with(@type, 'number')]">
    <xsl:text>\ref{</xsl:text>
    <xsl:value-of select="substring-after(@target, '#')"/>
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="//tei:body//tei:ref[@type='url']">
    <xsl:text>\EOAurl{</xsl:text>
    <xsl:value-of select="@target"/>
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="//tei:add[@rend='handwritten']">
    <xsl:text>&#x000a;&#x000a;&#x000a;&#x000a;\noindent\fbox{{\ttfamily </xsl:text>
    <xsl:text>Handwritten text</xsl:text>
    <xsl:text>}}</xsl:text>
  </xsl:template>

  <xsl:template match="//tei:trailer">
    <xsl:text>&#x000a;&#x000a;&#x000a;&#x000a;\begin{center}{\large </xsl:text>
    <xsl:apply-templates/>
    <xsl:text>}\end{center}&#x000a;&#x000a;&#x000a;&#x000a;</xsl:text>
  </xsl:template>

  <xsl:template match="//tei:list">
    <xsl:text>\begin{itemize} </xsl:text>
    <xsl:apply-templates/>
    <xsl:text>\end{itemize}</xsl:text>
  </xsl:template>

  <xsl:template match="//tei:item">
    <xsl:text>\item </xsl:text>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="//tei:table">
    <xsl:variable name="number_cells" as="xs:integer*">
    <xsl:value-of select="count(./tei:row[1]/tei:cell)"/>
    </xsl:variable>
    <xsl:text>&#x000a;&#x000a;\noindent\begin{tabular}{ </xsl:text>
    <xsl:for-each select="1 to $number_cells"> l </xsl:for-each>
    <xsl:text>} </xsl:text>
    <xsl:apply-templates/>
    <xsl:text>&#x000a;\end{tabular}&#x000a;</xsl:text>
  </xsl:template>

<xsl:template match="//tei:row">
    <xsl:text>&#x000a; </xsl:text>
    <xsl:apply-templates/>
    <xsl:text>\\ </xsl:text>
</xsl:template>

<xsl:template match="//tei:cell/tei:lb">
  <xsl:text>   </xsl:text>
</xsl:template>

<xsl:template match="//tei:cell[preceding-sibling::tei:cell]">
    <xsl:text>&amp; </xsl:text>
    <xsl:apply-templates/>
</xsl:template>

  <xsl:template match="//tei:figure[@type='hionly']">
    <xsl:text>&#x000a;\refstepcounter{figure}%&#x000a;</xsl:text>
  </xsl:template>

  <xsl:template match="//tei:figure[not(@type='hionly')]">
    <xsl:text>&#x000a;&#x000a;&#x000a;&#x000a;\noindent\fbox{\parbox{\textwidth}{{\ttfamily </xsl:text>
    <xsl:choose>
      <xsl:when test="./tei:ab[@type='var']">
        <xsl:text>Figure not displayed, it contains the variables </xsl:text>
        <xsl:value-of select="./tei:ab[@type]"/>
      </xsl:when>
      <xsl:when test="./tei:ab[@type='desc']">
        <xsl:text>&#x000a;&#x000a;&#x000a;&#x000a; Figure not displayed, it carries the description </xsl:text>
        <xsl:value-of select="./tei:ab[@type]"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>&#x000a;&#x000a;&#x000a;&#x000a; Figure not displayed.</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>}}}}&#x000a;&#x000a;</xsl:text>
  </xsl:template>

  <xsl:template name="string-replace-all">
    <xsl:param name="text" />
    <xsl:param name="replace" />
    <xsl:param name="by" />
    <xsl:choose>
      <xsl:when test="contains($text, $replace)">
        <xsl:value-of select="substring-before($text,$replace)" />
        <xsl:value-of select="$by" />
        <xsl:call-template name="string-replace-all">
          <xsl:with-param name="text"
                          select="substring-after($text,$replace)" />
          <xsl:with-param name="replace" select="$replace" />
          <xsl:with-param name="by" select="$by" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="text()">

       <!--

         <xsl:call-template name="string-replace-all">
            <xsl:with-param name="text" select="." />
            <xsl:with-param name="replace" select="'@'" />
            <xsl:with-param name="by" select="'\fbox{{\ttfamily @}}'" />
            </xsl:call-template>
         -->
<!--
    <xsl:value-of select="replace(., '&#x0040;', '\\fbox{{\\ttfamily @}}')"/>
    <xsl:value-of select="replace(., '&#x0026;', '\\&amp;')"/>
-->
    <xsl:call-template name="string-replace-all">
      <xsl:with-param name="text" select="." />
      <xsl:with-param name="replace" select="'&amp;'" />
      <xsl:with-param name="by" select="'\&amp;'" />
    </xsl:call-template>

    <!--
        <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="." />
        <xsl:with-param name="replace" select="'&amp;'" />
        <xsl:with-param name="by" select="'\&amp;'" />
        </xsl:call-template>
    -->
    <xsl:apply-templates />
  </xsl:template>

<!--
    <xsl:template match="text()">
          <xsl:call-template name="string-replace-all">
          <xsl:with-param name="text" select="." />
          <xsl:with-param name="replace" select="'@'" />
          <xsl:with-param name="by" select="'\fbox{{\ttfamily @}}'" />
          </xsl:call-template>
      <xsl:apply-templates />
    </xsl:template>
-->

  <xsl:template match="processing-instruction('eoa')">
    <xsl:text>\EOAprintbibliography&#x000a;&#x000a;</xsl:text>
  </xsl:template>

</xsl:stylesheet>
