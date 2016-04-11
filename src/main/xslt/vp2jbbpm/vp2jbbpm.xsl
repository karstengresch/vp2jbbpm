<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
                xmlns:bpmn2="http://www.omg.org/spec/BPMN/20100524/MODEL"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xsi:schemaLocation="http://www.omg.org/spec/BPMN/20100524/MODEL ">

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

  <xsl:template match="//definitions">
    <bpmn2:definitions>
      <tag>erer</tag>
          <xsl:apply-templates select="/definitions/process" />
    </bpmn2:definitions>
  </xsl:template>

  <xsl:template match="//process">

    <xsl:copy>
      <xsl:copy-of select="@*"/>
    </xsl:copy>
    <here>here</here>
  </xsl:template>

</xsl:stylesheet>