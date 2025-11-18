<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:template match="/">
        <html>
            <head>
                <title>releve bancaire</title>
                
            </head>
            <body>

                
                <table border="1" width="100%">
                    <tr>
                        <th>rib</th>
                        <th>solde</th>
                        <th>Date_Debut</th>
                        <th>Date_fin</th>

                    </tr>
                    <tr>
                        <td><xsl:value-of select="releve/@rib"/></td>
                        <td><xsl:value-of select="releve/solde"/></td>
                        <td><xsl:value-of select="releve/operations/@dateDebut"/></td>
                        <td><xsl:value-of select="releve/operations/@dateFin"/></td>
   
                    </tr>
                </table>
                
                
                    <table border="1" width="90%">
                        <tr>
                            <th>type</th>
                            <th>date</th>
                            <th>montant</th>
                            <th>description</th>
                        </tr>
                        <xsl:for-each select="releve/operations/operation">
                        <tr>
                            <td><xsl:value-of select="@type"/></td>
                            <td><xsl:value-of select="@date"/></td>
                            <td><xsl:value-of select="@montant"/></td>
                            <td><xsl:value-of select="@description"/></td>
                        </tr>
                        </xsl:for-each>
                    </table>
                <br/>
                
               
                <p>
                    <strong>Total Débit :</strong>
                    <xsl:value-of select="sum(releve/operations/operation[@type='DEBIT']/@montant)"/> DH
                </p>
                <p>
                    <strong>Total Crédit :</strong>
                    <xsl:value-of select="sum(releve/operations/operation[@type='CREDIT']/@montant)"/> DH
                </p>
            </body>
        </html>        
    </xsl:template>
    
    
    
    
    
    
    
    
</xsl:stylesheet>