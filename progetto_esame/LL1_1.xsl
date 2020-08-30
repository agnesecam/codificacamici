<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:tei="http://www.tei-c.org/ns/1.0" 
    xmlns="http://www.w3.org/1999/xhtml" >

    <xsl:output method="html" indent="yes"/>
    <xsl:strip-space elements="*"/>


    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="LL1_1.css" media="screen" />
                <script src="LL1_1.js"></script>
                <title><xsl:value-of select="//tei:titleStmt/tei:title"/></title> 
            </head>
            <body>
                <!-- TITOLO PAGINA -->
                <div id="div_titolo_principale">
                    <h1  id="titolo_principale">
                        <xsl:value-of select="//tei:titleStmt/tei:title"/>
                    </h1>
                </div>

                <!--fileDesc-->               
                <div id="fileDesc">

                    <!--titleStmt-->
                    <div class="dropdown">
                        <h2 class="dropbtn">Informazioni generali</h2>
                        <div class="dropdown-content">
                            <xsl:apply-templates select="//tei:titleStmt" />
                        </div>
                    </div>

                    <!--editionStmt-->
                    <div class="dropdown">
                        <h2 class="dropbtn">Edizione digitale</h2>
                        <div class="dropdown-content">
                            <xsl:apply-templates select="//tei:editionStmt" />
                        </div>
                    </div>

                    <!--publicationStmt-->
                    <div class="dropdown">
                        <h2 class="dropbtn">Pubblicazione</h2>
                        <div class="dropdown-content">
                            <xsl:apply-templates select="//tei:publicationStmt" />
                        </div>
                    </div>

                    <!--sourceDesc-->
                    <div class="dropdown">
                        <h2 class="dropbtn">Dettagli manoscritto</h2>
                        <div class="dropdown-content">
                            <xsl:apply-templates select="//tei:sourceDesc" />
                        </div>
                    </div>
                </div>
                <br/>

                <!--fileDesc:sourceDesc:msDesc:physDesc:support-->
                <span style="display: block; float: left; margin-top: 12px;">
                    <h2>Descrizione del manoscritto:</h2>
                    <div>
                        <xsl:apply-templates select="//tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:support"/>
                    </div>
                </span>

                <!-- MANI -->
                <div id="mani">
                    <h2>Scrittura a 5 mani:</h2>
                    <xsl:apply-templates select="//tei:handDesc"/>
                </div>

                <!-- SCAN -->
                <div id="immagini_lettera">
                    <h2>Immagini del manoscritto originale:</h2>
                    <xsl:apply-templates select="//tei:facsimile"/>
                </div>
                
                <!-- LETTERA -->                
                <div id="contenitore_fronte_e_body">
                    <div>
                        <h2>Fronte verso</h2>                        
                        <xsl:apply-templates select="//tei:front" />
                    </div>
                    <div>
                        <h2>Corpo della lettera</h2>
                        <div id="opener_lettera" style="text-align:right;">
                            <xsl:apply-templates select="//tei:opener" />
                        </div>
                        <div id="body_lettera">
                            <xsl:apply-templates select="//tei:div[@xml:id='body_lettera']"/>
                        </div>
                        <div id="closer_lettera">
                            <xsl:apply-templates select="//tei:div[@xml:id='closer_lettera']"/>
                        </div>
                    </div>
                </div>

                <!-- NOTE -->            
                <div id="contenitore_note">
                    <h2>Note:</h2>
                    <ol>
                        <xsl:apply-templates select="//tei:div[@type='ann_notes']/tei:note" />
                    </ol>
                </div>

                <!-- BIBLIOGRAFIA -->                    
                <div id="bibliografia">
                    <h2>Bibliografia</h2>
                    <ul>
                        <xsl:apply-templates select="//tei:div[@type='bibliography']/tei:listBibl/tei:bibl" />
                    </ul>
                </div>

                <!-- FONTI -->
                <div id="bibliografia2">
                    <h2>Fonti</h2>
                    <ul>
                        <xsl:apply-templates select="//tei:div[@type='lists']/tei:listBibl" />
                    </ul>
                </div>
                
                <!-- PERSONE -->                
                <div id="Persone citate">
                    <h4>Persone</h4>
                    <ul>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='VB']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='VB']" />
                            </xsl:element>
                        </li>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='SN']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='SN']" />               
                             </xsl:element>       
                        </li>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='VTB']/@xml:id"/>
                                </xsl:attribute>
                        
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='VTB']" />
                            </xsl:element>
                        </li>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='AF']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='AF']" />
                            </xsl:element>
                        </li>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='IPC']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='IPC']" />
                            </xsl:element>
                        </li>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='AC']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='AC']" />
                            </xsl:element>
                        </li>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='AMDG']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='AMDG']" />
                            </xsl:element>
                        </li>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='DS']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='DS']" />
                            </xsl:element>
                        </li>  
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='EC']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='EC']" />
                            </xsl:element>
                        </li>  
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='GS']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='GS']" />
                            </xsl:element>
                        </li>  
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='RB']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='RB']" />
                            </xsl:element>
                        </li>   
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='LC']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='LC']" />
                            </xsl:element>
                        </li>   
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='CN']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='CN']" />
                            </xsl:element>
                        </li>   
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='CB']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='CB']" />
                            </xsl:element>
                        </li>                                                
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='FB']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='FB']" />
                            </xsl:element>
                        </li>   
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='MiB']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='MiB']" />
                            </xsl:element>
                        </li>   
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='GB']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='GB']" />
                            </xsl:element>
                        </li>   
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='MaB']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='MaB']" />
                            </xsl:element>
                        </li>   
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='MoB']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='MoB']" />
                            </xsl:element>
                        </li>   
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='CC']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='CC']" />
                            </xsl:element>
                        </li>   
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='GD']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='GD']" />
                            </xsl:element>
                        </li>  
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='MBu']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='MBu']" />
                            </xsl:element>
                        </li>    

                    </ul>
                </div> 

                <!-- LUOGHI -->                
                <div>
                    <h2>Luoghi</h2>
                    <ul>
                        <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPlace/tei:place" />
                    </ul>
                </div>
                
                <!-- TERMINOLOGIA -->                
                <div>
                    <h2>Termini</h2>
                    <ul>
                        <xsl:apply-templates select="//tei:div[@type='lists']/tei:list[@type='terminology']" />
                    </ul>
                </div>                   
            </body>
        </html>
    </xsl:template>






<!-- TEMPLATES -->
    <!-- titleStmt -->
    <xsl:template match="//tei:titleStmt">
        <h2><xsl:value-of select="tei:title"/></h2>
        <div><xsl:apply-templates select="tei:respStmt"/></div>
    </xsl:template>
    
    <!-- respStmt -->
    <xsl:template match="//tei:respStmt">
        <h3><xsl:value-of select="tei:resp"/></h3>
        <ul>
            <xsl:for-each select="tei:name">
                <li><xsl:value-of select="."/></li>     
            </xsl:for-each>
        </ul>
    </xsl:template>

    <!-- editionStmt -->
    <xsl:template match="//tei:editionStmt">
        <h2><xsl:value-of select="tei:edition"/></h2>
        <h3><xsl:value-of select="tei:edition/date"/></h3>
        <div><xsl:apply-templates select="tei:respStmt"/></div>
    </xsl:template>

    <!-- publicationStmt -->
    <xsl:template match="//tei:publicationStmt">
        <h2><xsl:value-of select="tei:publisher"/></h2>
        Licenza: <a href="https://creativecommons.org/licenses/by/4.0/"><xsl:value-of select="tei:availability/tei:licence"/></a>
    </xsl:template>    

    <!-- sourceDesc -->
    <xsl:template match="//tei:sourceDesc">
        <div>
            <h2>Collocazione del manoscritto</h2>
            <p>
               <xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:country"/>, <xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:settlement"/>; <xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:altIdentifier/tei:idno"/>.
               <xsl:value-of select="//tei:adminInfo/tei:note"/>
            </p>           
        </div>
    </xsl:template>

    <!--sourceDesc msDesc-->
    <xsl:template match="//tei:support">
        <ul>
            <!--Descrizione del materiale-->
            <li><a>Descrizione del materiale: <xsl:value-of select="tei:material"/> </a></li>

            <!-- Filigrana -->
            <xsl:element name="li">
                <xsl:element name="a">
                    <xsl:attribute name="name">
                        <xsl:value-of select="concat('ID',//tei:watermark/tei:hi/@facs)"/>
                    </xsl:attribute>
                </xsl:element>
                <xsl:element name="a">
                    <xsl:attribute name="name">
                        <xsl:value-of select="concat('ID', //tei:watermark/tei:hi[2]/@facs )"/>
                    </xsl:attribute>
                </xsl:element>
                <xsl:element name="a">
                    <xsl:attribute name="name">
                        <xsl:value-of select="concat('ID', //tei:watermark/tei:hi[3]/@facs )"/>
                    </xsl:attribute>
                </xsl:element>
                <xsl:value-of select="concat('Filigrana: ',tei:watermark)"/> 
            </xsl:element>

            <!-- Sigilli e timbri -->
            <xsl:element name="li">
                <xsl:element name="a">
                    <xsl:attribute name="name">
                        <xsl:value-of select="concat('ID',//tei:stamp/tei:hi/@facs)"/>
                    </xsl:attribute>
                </xsl:element>
                <xsl:element name="a">
                    <xsl:attribute name="name">
                    <xsl:value-of select="concat('ID',//tei:stamp/tei:hi[2]/@facs)"/>
                    </xsl:attribute>
                </xsl:element>
                <xsl:element name="a">
                    <xsl:attribute name="name">
                        <xsl:value-of select="concat('ID',//tei:stamp/tei:hi[3]/@facs)"/>
                    </xsl:attribute>
                </xsl:element>
              <xsl:value-of select="concat('Sigilli e timbri: ',tei:stamp)"/>
            </xsl:element>

            <!-- Condizioni: -->
            <xsl:element name="li">
              <xsl:element name="a">
                <xsl:attribute name="name">
                  <xsl:value-of select="concat('ID',//tei:support/tei:p[1]/tei:hi/@facs)"/>
                </xsl:attribute>
              </xsl:element>
              <xsl:element name="a">
                <xsl:attribute name="name">
                  <xsl:value-of select="concat('ID',//tei:support/tei:p[1]/tei:hi[2]/@facs)"/>
                </xsl:attribute>
              </xsl:element>
              <xsl:value-of select="concat('Condizioni: ',//tei:support/tei:p[1])"/>
            </xsl:element>

            <!-- Segni particolari: -->
            <xsl:element name="li">
              <xsl:element name="a">
                <xsl:attribute name="name">
                  <xsl:value-of select="concat('ID',//tei:support/tei:p[2]/tei:hi/@facs)"/>
                </xsl:attribute>
              </xsl:element>
              <xsl:value-of select="concat('Segni particolari: ',//tei:support/tei:p[2])"/>
            </xsl:element>

            <!--Dimensioni-->
            <li>Dimensioni: <xsl:value-of select="//tei:extent/tei:dimensions/tei:height"/> x <xsl:value-of select="//tei:extent/tei:dimensions/tei:width"/> </li>
            <li>Piegatura: <xsl:value-of select="//tei:foliation"/> </li>
            
            <!-- Annotazioni: -->
            <xsl:element name="li">
              <xsl:element name="a">
                <xsl:attribute name="name">
                  <xsl:value-of select="concat('ID',//tei:handNote/@facs)"/>
                </xsl:attribute>                
              </xsl:element>
              <xsl:value-of select="concat('Annotazioni: ',//tei:handNote/tei:p)"/>
            </xsl:element>
                   
        </ul>
    </xsl:template>

    <!-- Immagini delle lettere scannerizzate -->
    <xsl:template match="//tei:facsimile">
        <xsl:for-each select="tei:surface/tei:graphic"> 
            <xsl:variable name="position" select="position()"/>
            <xsl:element name="img">
                <xsl:attribute name="usemap">
                    <xsl:value-of select="concat('#map',$position)"/> <!--le cose con la mappa rifalle perché servono al click sulla riga che riporta al testo-->
                </xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:value-of select="concat('imglettera' , $position) "/>
                </xsl:attribute> 
                <xsl:attribute name="src">
                    <xsl:value-of select="current()/@url "/>
                </xsl:attribute>
                <xsl:attribute name="width">25%</xsl:attribute>     
                <xsl:attribute name="hspace">5px</xsl:attribute>            
                <xsl:element name="map">
                    <xsl:attribute name="name">
                        <xsl:value-of select="concat('map',$position)"/>
                    </xsl:attribute>

                    <xsl:for-each select="parent::tei:surface/tei:zone">
                        <xsl:element name="area">   
                            <xsl:attribute name="class">
                                <xsl:value-of select="concat(parent::tei:surface/@xml:id, '_class')"/>       
                            </xsl:attribute>   
                            <xsl:attribute name="id">
                                <xsl:value-of select="@xml:id"/>       
                            </xsl:attribute>
                            <xsl:attribute name="shape">
                                <xsl:value-of select="concat('rect','')"/>
                            </xsl:attribute>
                            <xsl:attribute name="coords">
                                <xsl:value-of select="@ulx"/>,<xsl:value-of select="@uly"/>,<xsl:value-of select="@lrx"/>,<xsl:value-of select="@lry"/>
                            </xsl:attribute>
                            <xsl:attribute name="href"> 
                                <xsl:value-of select="concat('#ID#', @xml:id)"/>
                            </xsl:attribute>
                            <xsl:attribute name="onclick">
                                <xsl:value-of select="concat( 'resetLine(&quot;ID#', @xml:id, '&quot;)' )"/>
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <!-- Front della lettera -->
    <xsl:template match="//tei:front">
        <p>La lettera non presenta una busta sulla quale sia scritto l'indirizzo del destinatario, né sono presenti timbri, come detto in precedenza.
        <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
            Il fronte presenta solamente il nome del destinatario e la città: 
            <i>
                <xsl:call-template name="abbr_template1"/>
                <xsl:call-template name="abbr_template2"/>
                <xsl:call-template name="abbr_template3"/>
            </i>
            <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
            La data in cui è stata scritta la supplica è deducibile dall'annotazione presente sul folio fronte recto che cita:
            <i>
                <xsl:value-of select="//tei:front/tei:div/tei:ab/tei:mentioned"/>
            </i>
        </p>
    </xsl:template>

    <!-- Note -->
    <xsl:template match="//tei:div[@type='ann_notes']/tei:note">    
        <xsl:element name="li">
            <xsl:attribute name="id"> 
                <xsl:value-of select="concat(@xml:id, '')"/>
            </xsl:attribute>   
            
            <xsl:choose>
                <xsl:when test="@source">
                    <xsl:value-of select="tei:p"/>
                    <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
                    [Fonte: 
                    <xsl:element name="a">
                        <xsl:attribute name="href"> 
                            <xsl:value-of select="concat(@source, '')"/>
                        </xsl:attribute>
                        Seminara 2017</xsl:element>),
                    
                    pagina <xsl:value-of select="tei:bibl/tei:citedRange"/>]
                </xsl:when>
                <xsl:otherwise><xsl:value-of select="tei:p"/> Nota della codifica</xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>   

    <!-- Bibliografia -->
    <xsl:template match="//tei:div[@type='bibliography']/tei:listBibl/tei:bibl">
        <li>
            <xsl:element name="a">
                <xsl:attribute name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
                <xsl:value-of select="tei:ref/tei:bibl/tei:author" />, anno <xsl:value-of select="tei:ref/tei:bibl/tei:date" />, pagina <xsl:value-of select="tei:ref/tei:bibl/tei:citedRange" />
            </xsl:element>
        </li>
    </xsl:template>

    <!-- Fonti -->
    <xsl:template match="//tei:div[@type='lists']/tei:listBibl">
        <xsl:for-each select="tei:bibl">
            
            <li>
                <xsl:element name="a">
                    <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>

                    <xsl:for-each select="*">
                        <xsl:value-of select="current()"/>
                        <xsl:text>. </xsl:text>              
                    </xsl:for-each>
                </xsl:element>
            </li>
                    
        </xsl:for-each>
    </xsl:template>  

    <!-- Reference -->
    <xsl:template match="*[@ref]">
        <xsl:apply-templates />
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@ref"/>
            </xsl:attribute>
            <sub>(about)</sub>
        </xsl:element>     
    </xsl:template>

    <!-- Luoghi-->
    <xsl:template match="//tei:div[@type='lists']/tei:listPlace/tei:place">
        <li>
            <xsl:variable name="list_place" select="tei:placeName/@ref"/>
            <xsl:element name="a">
                <xsl:attribute name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
                <xsl:for-each select="*">
                    <xsl:choose>
                        <xsl:when test="tei:bibl">
                            pagina <xsl:value-of select="tei:bibl"/>: <xsl:value-of select="tei:p"/>
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="@source"/>
                                </xsl:attribute>                               
                                <sup>[nota]</sup>
                            </xsl:element>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="."/> 
                            <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                </xsl:for-each>
                <xsl:element name="a">
                        
                    <xsl:attribute name="href">
                        <xsl:value-of select="substring-before( $list_place, ' ' )"/>
                    </xsl:attribute>
                    <sub>I fonte</sub>

                </xsl:element>, 
                <xsl:element name="a">
                        
                    <xsl:attribute name="href">
                        <xsl:value-of select="substring-after( $list_place, ' ' )"/>
                    </xsl:attribute>
                    <sub>II fonte</sub>

                </xsl:element>
            </xsl:element>
        </li>
    </xsl:template>    

    <!-- Personaggi singoli formattazione e aggiunta note ulteriori-->
    <!--Vincenzo Bellini -->
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='VB']">
        <xsl:variable name="Treccani">
            <xsl:value-of select="tei:persName[@role='composer']/tei:ref/@target"/>  
        </xsl:variable>
        <xsl:variable name="VIAF">
            <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='VB']/@sameAs"/>
        </xsl:variable>
        <xsl:for-each select="tei:persName">
            <xsl:for-each select="*">
                <xsl:value-of select="."/>
                <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
            </xsl:for-each>
        </xsl:for-each>
        compositore
        <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
        <xsl:element name="a">            
            <xsl:attribute name="href">
                <xsl:copy-of select="$Treccani" />
            </xsl:attribute>
            <sub>Treccani</sub>
        </xsl:element>
         <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
        <xsl:element name="a">            
            <xsl:attribute name="href">
                <xsl:copy-of select="$VIAF" />
            </xsl:attribute>
            <sub>VIAF</sub>
        </xsl:element>
        <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
        <xsl:for-each select="tei:birth">
            <xsl:for-each select="*">
                <xsl:for-each select="*">
                    <xsl:value-of select="."/>
                    <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
                </xsl:for-each>
                <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
            </xsl:for-each>
        </xsl:for-each>
        <xsl:for-each select="tei:death">
            <xsl:for-each select="*">
                <xsl:for-each select="*">
                    <xsl:value-of select="."/>
                    <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
                </xsl:for-each>
                <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
            </xsl:for-each>
        </xsl:for-each>

        , amante di Giuditta Turina   
                        
 

    </xsl:template>

    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='GCT']">
        <xsl:variable name="list2" select="tei:persName/tei:ref/@target"/>
        <xsl:for-each select="tei:persName">
            <xsl:for-each select="*">
                <xsl:value-of select="."/>
                <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
            </xsl:for-each>
        </xsl:for-each>
        
        <xsl:element name="a">
            
            <xsl:attribute name="href">
                <xsl:value-of select="substring-before( $list2, ' ' )"/>
            </xsl:attribute>
            <sub>I fonte</sub>

        </xsl:element>, 
        <xsl:element name="a">
            
            <xsl:attribute name="href">
                <xsl:value-of select="substring-after( $list2, ' ' )"/>
            </xsl:attribute>
            <sub>Treccani</sub>

        </xsl:element>
        <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
       
        <xsl:for-each select="tei:birth">
            <xsl:for-each select="*">
                <xsl:value-of select="."/>
                <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
            </xsl:for-each>
        </xsl:for-each>
        <xsl:for-each select="tei:death">
            <xsl:for-each select="*">
                <xsl:value-of select="."/>
                <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
            </xsl:for-each>
        </xsl:for-each>
        moglie di Ferdinando Turina, amante di Vincenzo Bellini e cognata di Bartolomeo Turina e Rosa Bossi
    </xsl:template>


    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='C']">       
        <xsl:value-of select="tei:note/tei:p"/> 
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="tei:note/@source"/>
            </xsl:attribute>
            <sup>[nota]</sup>
        </xsl:element>
    </xsl:template>

    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='FT']">
        <xsl:for-each select="tei:persName">
            <xsl:for-each select="*">
                <xsl:value-of select="."/>
                <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
            </xsl:for-each>
        </xsl:for-each>
        possidente e produttore di seta
        <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
        <xsl:element name="a">
            
            <xsl:attribute name="href">
                <xsl:value-of select="tei:persName/tei:ref/@target"/>
            </xsl:attribute>
            <sub>fonte</sub>
        </xsl:element>.
        <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
        Marito di Giuditta Turina, fratello di Bartolomeo Turina e cognato di Rosa Bossi
    </xsl:template>

    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='RBo']">
        <xsl:value-of select="tei:note/tei:p"/> 
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="tei:note/@source"/>
            </xsl:attribute>
            <sup>[nota]</sup>
        </xsl:element>
    </xsl:template>

    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='BT']">
        <xsl:for-each select="tei:persName">
            <xsl:for-each select="*">
                <xsl:value-of select="."/>
                <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
            </xsl:for-each>
        </xsl:for-each>
        , marito di Rosa Bossi, fratello di Ferdinando Turina e cognato di Giuditta Turina
    </xsl:template>    




    <!-- CHOICE tra S.E. e Sua Eccellenza-->
    <xsl:template name="abbr_template1" match="//tei:choice">
        <xsl:variable name="SE">
            <xsl:value-of select="//tei:front/tei:div/tei:ab/tei:address/tei:addrLine/tei:persName/tei:roleName/tei:choice/tei:abbr"/>
        </xsl:variable>
        <xsl:variable name="SuaEccellenza">
            <xsl:value-of select="//tei:front/tei:div/tei:ab/tei:address/tei:addrLine/tei:persName/tei:roleName/tei:choice/tei:expan"/>
        </xsl:variable>
        <select class="expan_class">
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:copy-of select="$SE" />
                </xsl:attribute>
                <xsl:copy-of select="$SE" />
            </xsl:element>
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:copy-of select="$SuaEccellenza" />
                </xsl:attribute>
                <xsl:copy-of select="$SuaEccellenza" />
            </xsl:element>       
        </select>
    </xsl:template>

    <!--CHOICE tra Sig. e Signor -->
    <xsl:template name="abbr_template2" match="//tei:choice">
        <xsl:variable name="Sig.">
            <xsl:value-of select="//tei:front/tei:div/tei:ab/tei:address/tei:addrLine/tei:persName/tei:choice[1]/tei:abbr"/>
        </xsl:variable>
        <xsl:variable name="Signor">
            <xsl:value-of select="//tei:front/tei:div/tei:ab/tei:address/tei:addrLine/tei:persName/tei:choice[1]/tei:expan"/>
        </xsl:variable>
        <select class="expan_class">
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:copy-of select="$Sig." />
                </xsl:attribute>
                <xsl:copy-of select="$Sig." />
            </xsl:element>
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:copy-of select="$Signor" />
                </xsl:attribute>
                <xsl:copy-of select="$Signor" />
            </xsl:element>       
        </select>
    </xsl:template>

    <!--CHOICE tra Prov.a e Provincia -->
    <xsl:template name="abbr_template3" match="//tei:choice[2]">
        <xsl:value-of select="//tei:front/tei:div/tei:ab/tei:address/tei:addrLine/tei:persName/tei:roleName[@xml:id='rolename1']"/>
        della
        <xsl:variable name="Prov.a">
            <xsl:value-of select="//tei:front/tei:div/tei:ab/tei:address/tei:addrLine/tei:persName/tei:choice[2]/tei:abbr"/>
        </xsl:variable>
        <xsl:variable name="Provincia">
            <xsl:value-of select="//tei:front/tei:div/tei:ab/tei:address/tei:addrLine/tei:persName/tei:choice[2]/tei:expan"/>
        </xsl:variable>
        <select class="expan_class">
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:copy-of select="$Prov.a" />
                </xsl:attribute>
                <xsl:copy-of select="$Prov.a" />
            </xsl:element>
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:copy-of select="$Provincia" />
                </xsl:attribute>
                <xsl:copy-of select="$Provincia" />
            </xsl:element>       
        </select>

    </xsl:template>
        
    
</xsl:stylesheet>