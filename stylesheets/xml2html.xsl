<?xml version="1.0" encoding="utf-8"?>

<!-- artmemis xml transformer -->

<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  version="1.0" 
  xmlns:my="http://www.people.cornell.edu/pages/jt96/" 
  xmlns="http://www.w3.org/1999/xhtml" 
  xmlns:html="http://www.w3.org/1999/xhtml" 
  xmlns:msxsl="urn:schemas-microsoft-com:xslt"
  xmlns:xalan="http://xml.apache.org/xalan"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:dcq="http://purl.org/dc/qualifiers/1.0/"
  exclude-result-prefixes="html msxsl xalan rdf">

  <xsl:output 
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" 
    doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
    cdata-section-elements="script" 
    method="xml" />

  <!-- Provide "nice" looking html output -->
  <xsl:output
    indent="yes"
    xalan:indent-amount="2" />
  
  <!-- Some versions of IE6 see XHTML as XML if you include the XML declaration, 
  | this omission is ok since we are using UTF-8/UTF-16 encoding -->
  <xsl:output omit-xml-declaration="yes" /> 

  <!-- Global Variables -->
  <!-- alt: file://C:\Documents and Settings\justin\My Documents\My Webs\Artemis
            http://www.people.cornell.edu/pages/jt96
  -->
  <xsl:variable name="root">https://justintungonline.github.io</xsl:variable>
  <xsl:variable name="metadata" select="/*/rdf:RDF" />
  <xsl:variable name="htmlfilename"
                select="$metadata/rdf:Description[1]/dc:description/@about" />
  <xsl:variable name="xmlfilename"
                select="$metadata/rdf:Description[1]/@about" />
  <xsl:variable name="pagedescription"
                select="$metadata/rdf:Description[1]/dc:description" />


  <!-- XSLT FAQ: Create copies of most nodes (essentially in CONTENT section, - 'copy me, 
  | but pay attention to my contents. "These templates are very general - they don't give
  | names to match on or use predicates - so they're given low priority. Any template that 
  | you have that *does* use a name or a predicate will be applied in preference."
  -->

  <xsl:template match="*">
    <xsl:copy>
      <xsl:apply-templates select="@*" />
      <xsl:apply-templates />
    </xsl:copy>
  </xsl:template>
    
  <xsl:template match="@*">
    <xsl:copy-of select="." />
  </xsl:template>

  <xsl:template match="/DOC/rdf:RDF">
    <!-- Do nothing -->
  </xsl:template>

  <xsl:template match="/DOC/HTMLPAGE">
    <xsl:comment>Document created via transformation from xml to html</xsl:comment>
    <html>
      <head>
	<title><xsl:value-of select="$metadata/rdf:Description[1]/dc:title"/></title>
	
	<link rel="stylesheet" 
	      type="text/css" 
	      href="{$root}/stylesheets/artemis.css" />
	    
	<link rel="alternate" type="text/xml" href="/{$xmlfilename}" />
	<link rel="schema.DC" href="http://purl.org/dc/elements/1.1/"/>
	
	<xsl:comment>META Information for searching and page description</xsl:comment>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<meta name="DC.description" content="{$pagedescription}"/>
	<meta name="DC.creator" content="Justin Tung"/>
	<meta name="Keywords" content="justin tung, interval analysis, computer science,
	  xml, xslt, java, upper canada college, cornell, personal website, math, mathematics
	  numerical analysis, behavioural ecology, internet searching, resume, International
	  Baccalaureate, programming, xhtml, css, information technology, internet,
	  computer games"/>

      </head>
      
      <xsl:comment>Top Panel (artemis header column)</xsl:comment>
      
      <div id="toppanel">
	<!-- Get link to index location, page path Information -->
	<div id="artemisHeader">
	  <a class="art" href="{$root}/index.html">
	    artemis v 1.1</a><br/>
	</div>
	<div id="pagepath">
	  <div class="flowleft">
	    for alternative compatibility, try the 
	    <a class="supt" href="{$xmlfilename}">XML version</a>
	    <br/>if you have problems consult the 
	    <a class="supt" href="{$root}/siteinfo/support.html">support page</a>
	  </div>
	  justin's homesite
	  <br/>
	  /<xsl:value-of select="/DOC/HTMLPAGE/BODY/CONTENT/FOOTER/PATH"/>
	  <xsl:value-of select="$htmlfilename"/>
	</div>
      </div>

      <xsl:apply-templates/>
    </html>
  </xsl:template>


  <!-- Match BODY and fill in panel information -->
  <xsl:template match="BODY">

    <body>
      <!--
      <xsl:if test="CONTENT/FOOTER/PATH='' and  $htmlfilename='index.html'">
	<xsl:comment>BEGIN WebSTAT Activation Code</xsl:comment>
	<script 
	  type="text/javascript"
	  language="JavaScript"
	  src="http://hits.webstat.com/cgi-bin/wsv2.cgi?21412"/>
	<noscript>
	  <a href="http://hits.webstat.com">
	    <img 
	      SRC="http://hits.webstat.com/scripts/wsb.php?ac=21412"
	      border="0" 
	      alt="WebSTAT - Free Web Statistics"/>
  	  </a>
        </noscript>
	<xsl:comment>END WebSTAT Activation Code</xsl:comment>
      </xsl:if>
      -->

      <xsl:apply-templates/>
      <!-- Fixed information in left panel -->
      <xsl:comment>Filler column, possible for images (left column)</xsl:comment>
      
      <div id="leftpanel">
	<img src="{$root}/images/artemis_tower.jpg"
             id="artemis_left"
	     alt="artemis on tower"/>
      </div>
    </body>

  </xsl:template>

  <xsl:template match="CONTENT">
    <xsl:comment>Content (middle column)</xsl:comment>

    <div id="content"> 
      
      <!-- Process all the content -->
      <xsl:apply-templates/>

    </div>
  </xsl:template>    

  <xsl:template match="FOOTER">
    <!-- Generates the footer at the end of the content div -->
    <xsl:comment>Standard content column footer</xsl:comment>
    <hr/>
    <p>
      <a href="{$root}/index.html">ARTEMIS</a> | <xsl:value-of select="PATH"/><a 
	href="{$htmlfilename}"><xsl:value-of select="$htmlfilename"/></a> by <a
	href="mailto:kalreichi@hotmail.com">justin tung</a> generated using 
      
      <xsl:variable name="vendorlocator">
	<xsl:value-of select="system-property('xsl:vendor-url')"/>
      </xsl:variable>

      <a href="{$vendorlocator}"><xsl:value-of select="system-property('xsl:vendor')"/></a>

      <!-- Testing for IE MSXML or my default generation -->
      <xsl:choose>
	<xsl:when test="system-property('xsl:vendor')='Microsoft'">
	  <xsl:text>'s MSXML version </xsl:text> 
	  <xsl:value-of select="system-property('msxsl:version')" /> 
	</xsl:when>
	<xsl:when test="system-property('xsl:vendor')='Apache Software Foundation'">
	  <xsl:text>'s Xalan-J version 2.6.0</xsl:text>
	</xsl:when>
	<xsl:otherwise>
	  <!-- Do nothing and accept supplied vendor -->
	</xsl:otherwise>
      </xsl:choose>

    </p>
  </xsl:template>

  <xsl:template match="SPACE">
    <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text> 
  </xsl:template>


  <xsl:template match="RIGHTPANEL">
    
    <xsl:comment>Right Navigation Column</xsl:comment>
    <div id="rightpanel">
      <div class="navbar_list">
	<b><span class="navbar_section"><a href="{$root}/aboutme/index.html">
	      all</a> about me</span></b>
	<ul class="none">
	  <li class="linknode"><a href="{$root}/aboutme/bio.html">bio</a></li>
	  <li class="linknode"><a href="{$root}/aboutme/interests.html">interests</a></li>
	  <li class="linknode"><a href="{$root}/aboutme/resume.html">resume</a></li>
	</ul>
	
	<span class="dot">. . . . . . . . . . . . . . . . . . .</span>
	
	<br/><b><span class="navbar_section"><a 
	      href="{$root}/siteinfo/index.html">site info</a></span></b>
	<ul class="none">
	  <li class="linknode"><a href="{$root}/siteinfo/sitemap.html">sitemap</a></li>
	  <li class="linknode"><a 
	      href="{$root}/siteinfo/support.html">support</a></li>
	</ul>

	<span class="dot">. . . . . . . . . . . . . . . . . . .</span>
	
	<br/><b><span class="navbar_section"><a href="{$root}/resources/index.html">
	      resources</a>
	  </span></b>
	  <ul class="none">
	    <li class="linknode"><a href="{$root}/resources/articles.html">
		brief documents</a></li>
	    <li class="linknode"><a href="{$root}/resources/academic.html">
		essays/project</a></li>
	  </ul>
	      
	  <span class="dot">. . . . . . . . . . . . . . . . . . .</span>
	  
	  <br/><b><span class="navbar_section">eXplore with me</span></b>	

	  <ul class="none">
	    <li class="linknode"><a href="{$root}/explore/writeme.html">
		contact / write me</a></li>
	    <li class="linknode"><a href="{$root}/explore/links.html">
		web gateway</a></li>
	</ul>
      </div>

      <!-- For extra information in right panel -->
      <xsl:apply-templates/>

    </div>
  </xsl:template>

</xsl:stylesheet>
