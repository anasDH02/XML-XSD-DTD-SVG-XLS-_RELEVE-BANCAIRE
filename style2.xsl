<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Opérations Crédit</title>

            </head>
            <body>
                <h2>Opérations de type CREDIT</h2>
                
      
                <table>
                    <tr>
                        <th>Date</th>
                        <th>Montant</th>
                        <th>Description</th>
                    </tr>
                    
                 
                    <xsl:for-each select="releve/operations/operation[@type='CREDIT']">
                        <tr>
                            <td><xsl:value-of select="@date"/></td>
                            <td><xsl:value-of select="@montant"/></td>
                            <td><xsl:value-of select="@description"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
                
     
                <p>
                    <strong>Total Crédit :</strong>
                    <xsl:value-of select="sum(releve/operations/operation[@type='CREDIT']/@montant)"/> DH
                </p>
                
            </body>
        </html>
    </xsl:template>
    
    
</xsl:stylesheet>