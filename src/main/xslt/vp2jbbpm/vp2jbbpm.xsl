<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
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

  <xsl:template match="/*">
    <xsl:copy inherit-namespaces="yes">
      <xsl:namespace name="bpmn2" select="string('http://www.omg.org/spec/BPMN/20100524/MODEL')"/>
      <xsl:copy-of select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>