<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
            xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
            xmlns="http://schemas.microsoft.com/wix/2006/wi"
            xmlns:wix="http://schemas.microsoft.com/wix/2006/wi"
            xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">

  <xsl:output method="xml" indent="yes"/>


  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>


  <xsl:key name="network-search" match="wix:Component[not(contains(substring(wix:File/@Source,7), '.'))]" use="@Id"/>
  <xsl:key name="iobj-search" match="wix:Component[contains(wix:File/@Source, '.iobj')]" use="@Id"/>
  <xsl:key name="ipdb-search" match="wix:Component[contains(wix:File/@Source, '.ipdb')]" use="@Id"/>
  <xsl:key name="sgf-search" match="wix:Component[contains(wix:File/@Source, '.sgf')]" use="@Id"/>

  <xsl:template match="wix:Component[key('network-search', @Id)]"/>
  <xsl:template match="wix:ComponentRef[key('network-search', @Id)]"/>
  <xsl:template match="wix:Component[key('iobj-search', @Id)]"/>
  <xsl:template match="wix:ComponentRef[key('iobj-search', @Id)]"/>
  <xsl:template match="wix:Component[key('ipdb-search', @Id)]"/>
  <xsl:template match="wix:ComponentRef[key('ipdb-search', @Id)]"/>
  <xsl:template match="wix:Component[key('sgf-search', @Id)]"/>
  <xsl:template match="wix:ComponentRef[key('sgf-search', @Id)]"/>
  <xsl:template match="wix:Directory[count(wix:Component) 
                                     = count(wix:Component[key('sgf-search', @Id)])]" />

</xsl:stylesheet>