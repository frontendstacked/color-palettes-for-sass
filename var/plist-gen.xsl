<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

<xsl:output method="text" />

<xsl:template match="/">
<xsl:text>// </xsl:text>
<xsl:value-of select="plist/dict/key[text() = 'Library Name']/following-sibling::string" />
<xsl:text>
</xsl:text>
<xsl:apply-templates select="/plist/dict/dict" mode="color" />
</xsl:template>

<xsl:template match="dict" mode="color">
<xsl:for-each select="key">
<xsl:text>$</xsl:text>
<xsl:value-of select="translate(., ' ', '')" />
<xsl:text>: rgba(</xsl:text>
<xsl:value-of select="following-sibling::dict/key[text() = 'Red']/following-sibling::integer" />
<xsl:text>, </xsl:text>
<xsl:value-of select="following-sibling::dict/key[text() = 'Green']/following-sibling::integer" />
<xsl:text>, </xsl:text>
<xsl:value-of select="following-sibling::dict/key[text() = 'Blue']/following-sibling::integer" />
<xsl:text>, 1);
</xsl:text>
</xsl:for-each>
</xsl:template>

</xsl:stylesheet>
