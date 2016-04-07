<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

  <!--
      Purpose of this stylesheet:
      Convert the BPMN2 export from Visual Paradigm so it can be imported into JBoss BPM.

      Version:  0.01

      Date:     07.04.2016

      Authors: Red Hat, Karsten Gresch /KG

      Last edited by: Karsten Gresch

      === Version History ===
      0.01: Initial version /KG 07.04.2016

-->


  <xsl:output method="xml" indent="yes" encoding="UTF-8" media-type="text/xml"/>
  <xsl:strip-space elements="*"/>

  <xsl:template match="trallalaXML">
    <trallalaXML xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              xsi:noNamespaceSchemaLocation="http://www.trallalasoft.com/trallalaXML.xsd">
      <xsl:apply-templates select="/trallalaXML/recordList"/>
    </trallalaXML>
  </xsl:template>

  <xsl:template match="recordList">
    <recordList>
      <xsl:apply-templates mode="records"/>
    </recordList>
    <xsl:apply-templates select="//diagnostic"/>
  </xsl:template>

  <xsl:template match="record" mode="records">
    <xsl:copy>
      <xsl:copy-of select="priref"/>
      <xsl:apply-templates select="equivalent_term"/>
      <xsl:apply-templates select="term"/>
      <xsl:copy-of select="term.number"/>
      <xsl:copy-of select="term.type"/>
      <xsl:apply-templates select="use"/>
      <xsl:apply-templates select="used_for"/>
      <xsl:apply-templates select="narrower_term"/>
      <xsl:apply-templates select="broader_term"/>
      <xsl:apply-templates select="related_term"/>
      <xsl:copy-of select="source"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="equivalent_term">
    <equivalent_term>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates select="term"/>
    </equivalent_term>
  </xsl:template>

  <xsl:template match="use">
    <use>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates select="term"/>
    </use>
  </xsl:template>

  <xsl:template match="used_for">
    <used_for>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates select="term"/>
    </used_for>
  </xsl:template>

  <xsl:template match="broader_term">
    <broader_term>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates select="term"/>
    </broader_term>
  </xsl:template>

  <xsl:template match="narrower_term">
    <narrower_term>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates select="term"/>
      <xsl:copy-of select="term.number"/>
      <xsl:copy-of select="term.type"/>
      <xsl:apply-templates select="broader_term"/>
      <xsl:copy-of select="source"/>
    </narrower_term>
  </xsl:template>

  <xsl:template match="related_term">
    <related_term>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates select="term"/>
    </related_term>
  </xsl:template>

  <xsl:template match="term">
    <term>
      <xsl:value-of select="normalize-space(text())"/>
    </term>
  </xsl:template>

  <xsl:template match="//diagnostic">
    <xsl:copy>
      <xsl:copy-of select="node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>