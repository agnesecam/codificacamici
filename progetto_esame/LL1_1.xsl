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
                <div id="contenitore_front">
                    <div>
                        <h2>Fronte della lettera</h2>
                        <div id="info_dest" >
                            <xsl:apply-templates select="//tei:div[@xml:id='info_dest']" />
                        </div>
                    </div>
                </div>             
                <div id="contenitore_body">
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
                    <ol><xsl:apply-templates select="//tei:div[@type='ann_notes']/tei:note" /></ol>
                </div>

                <!-- BIBLIOGRAFIA -->                    
                <div id="bibliografia">
                    <h2>Bibliografia</h2>
                    <ul><xsl:apply-templates select="//tei:div[@type='bibliography']/tei:listBibl/tei:bibl" /></ul>
                </div>

                <!-- FONTI -->
                <div id="bibliografia2">
                    <h2>Fonti</h2>
                    <ul><xsl:apply-templates select="//tei:div[@type='lists']/tei:listBibl" /></ul>
                </div>
                
                <!-- PERSONE -->                
                <div id="persone_citate">
                    <h2>Persone</h2>
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
                <div id="luoghi_citati">
                    <h2>Luoghi</h2>
                    <ul>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='CT']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='CT']" />
                            </xsl:element>
                        </li>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='NA']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='NA']" />
                            </xsl:element>
                        </li>                        
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='Put']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='Put']" />
                            </xsl:element>
                        </li>  
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='PA']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='PA']" />
                            </xsl:element>
                        </li>                                              
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='PortaCapuana']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='PortaCapuana']" />
                            </xsl:element>
                        </li>                        
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='MI']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='MI']" />
                            </xsl:element>
                        </li>                           
                    </ul>
                </div> 
                
                <!-- TERMINOLOGIA -->                
                <div>
                    <h2>Terminologia utilizzata</h2>
                    <xsl:apply-templates select="//tei:div[@type='lists']/tei:list[@type='terminology']"/>
                </div>                   
            </body>
        </html>
    </xsl:template>




<!-- TEMPLATES VARI USATI SOPRA -->
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

    <!-- sourceDesc msDesc -->
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
                    <xsl:value-of select="concat('#map',$position)"/>
                </xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:value-of select="concat('imglettera' , $position) "/>
                </xsl:attribute> 
                <xsl:attribute name="src">
                    <xsl:value-of select="current()/@url "/>
                </xsl:attribute>
           
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

    <!-- corrisp. facsimile -->
    <xsl:template match="//tei:body/tei:div[@type='fronte-recto']">        
        <div>
            <p style="line-height: 95%; width: 1328px;">
                <xsl:call-template name="facs_template_body"> </xsl:call-template>     
            </p>
        </div>
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

    <!-- Riferimento note nel testo -->
    <xsl:template name="notes_template" match="//tei:ptr">
        <xsl:apply-templates/><xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="concat(@target, '')"/>
            </xsl:attribute>
            <sup>&#9834;</sup>
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
            <sub><xsl:text>&#8505;</xsl:text></sub>
        </xsl:element>     
    </xsl:template>

    <!-- Luoghi -->

    <!--Catania-->
    <xsl:template match="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='CT']">        
        <xsl:variable name="ref_luogo" select="tei:placeName/@ref"/>        
        <xsl:variable name="citta">
            <xsl:value-of select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='CT']/tei:placeName"/> 
            
        </xsl:variable> 
        <xsl:variable name="paese">
            <xsl:value-of select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='CT']/tei:country"/>
            <xsl:element name="a">                        
                <xsl:attribute name="href">
                    <xsl:value-of select="substring-before( $ref_luogo, ' ' )"/>
                </xsl:attribute>
                <sub>geonames</sub>
            </xsl:element> 
            <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
            <xsl:element name="a">                     
                <xsl:attribute name="href">
                    <xsl:value-of select="substring-after( $ref_luogo, ' ' )"/>
                </xsl:attribute>
                <sub>Treccani</sub>
            </xsl:element>
        </xsl:variable> 
        <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
        <xsl:copy-of select="$citta"/><xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>,
        in <xsl:copy-of select="$paese"/>.
        <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>
    </xsl:template> 
    <!--Palermo-->
    <xsl:template match="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='PA']">
        <xsl:variable name="ref_luogo" select="tei:placeName/@ref"/>        
        <xsl:variable name="citta">
            <xsl:value-of select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='PA']/tei:placeName"/> 
            <xsl:element name="a">                        
                <xsl:attribute name="href">
                    <xsl:value-of select="substring-before( $ref_luogo, ' ' )"/>
                </xsl:attribute>
                <sub>geonames</sub>
            </xsl:element> 
            <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
            <xsl:element name="a">                     
                <xsl:attribute name="href">
                    <xsl:value-of select="substring-after( $ref_luogo, ' ' )"/>
                </xsl:attribute>
                <sub>Treccani</sub>
            </xsl:element>
        </xsl:variable> 
        <xsl:variable name="paese">
            <xsl:value-of select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='PA']/tei:country"/>
        </xsl:variable> 
        <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
        <xsl:copy-of select="$citta"/><xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>,
        in <xsl:copy-of select="$paese"/>.
        <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>
    </xsl:template>
    <!--Napoli-->
    <xsl:template match="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='NA']">
        <xsl:variable name="ref_luogo" select="tei:placeName/@ref"/>        
        <xsl:variable name="citta">
            <xsl:value-of select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='NA']/tei:placeName"/> 
            <xsl:element name="a">                        
                <xsl:attribute name="href">
                    <xsl:value-of select="substring-before( $ref_luogo, ' ' )"/>
                </xsl:attribute>
                <sub>geonames</sub>
            </xsl:element> 
            <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
            <xsl:element name="a">                     
                <xsl:attribute name="href">
                    <xsl:value-of select="substring-after( $ref_luogo, ' ' )"/>
                </xsl:attribute>
                <sub>Treccani</sub>
            </xsl:element> 
        </xsl:variable> 
        <xsl:variable name="paese">
            <xsl:value-of select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='NA']/tei:country"/>
        </xsl:variable> 
        <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
        <xsl:copy-of select="$citta"/><xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>,
        in <xsl:copy-of select="$paese"/>.
        <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>
    </xsl:template> 
    <!--Puteaux-->
    <xsl:template match="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='Put']">
        <xsl:variable name="ref_luogo" select="tei:placeName/@ref"/>        
        <xsl:variable name="citta">
            <xsl:value-of select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='Put']/tei:placeName"/>
            <xsl:element name="a">                        
                <xsl:attribute name="href">
                    <xsl:value-of select="substring-before( $ref_luogo, ' ' )"/>
                </xsl:attribute>
                <sub>geonames</sub>
            </xsl:element> 
            <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
            <xsl:element name="a">                     
                <xsl:attribute name="href">
                    <xsl:value-of select="substring-after( $ref_luogo, ' ' )"/>
                </xsl:attribute>
                <sub>Treccani</sub>
            </xsl:element>             
        </xsl:variable> 
        <xsl:variable name="paese">
            <xsl:value-of select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='Put']/tei:country"/>
        </xsl:variable> 
        <xsl:variable name="note">
            <xsl:value-of select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='Put']/tei:note/tei:p"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        </xsl:variable>
        <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
        <xsl:copy-of select="$citta"/><xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>,
        in <xsl:copy-of select="$paese"/>.
        <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        <xsl:text disable-output-escaping="yes"><![CDATA[<i>]]></xsl:text>
        <xsl:copy-of select="$note"/>
        <xsl:text disable-output-escaping="yes"><![CDATA[</i>]]></xsl:text>
    </xsl:template> 
    <!--Porta Capuana-->
    <xsl:template match="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='PortaCapuana']">
        <xsl:variable name="ref_luogo" select="tei:placeName/@ref"/>    
        <xsl:variable name="citta">
            <xsl:value-of select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='PortaCapuana']/tei:placeName"/> 
            <xsl:element name="a">                        
                <xsl:attribute name="href">
                    <xsl:value-of select="$ref_luogo"/>
                </xsl:attribute>
                <sub>geonames</sub>
            </xsl:element> 
            <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>         
        </xsl:variable> 
        <xsl:variable name="paese">
            <xsl:value-of select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='PortaCapuana']/tei:country"/>
        </xsl:variable> 
        <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
        <xsl:copy-of select="$citta"/><xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>,
        in <xsl:copy-of select="$paese"/>.
        <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
    </xsl:template>             
    <!--Milano-->
    <xsl:template match="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='MI']">
        <xsl:variable name="ref_luogo" select="tei:placeName/@ref"/>
        <xsl:variable name="citta">
            <xsl:value-of select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='MI']/tei:placeName"/>
            <xsl:element name="a">                        
                <xsl:attribute name="href">
                    <xsl:value-of select="substring-before( $ref_luogo, ' ' )"/>
                </xsl:attribute>
                <sub>geonames</sub>
            </xsl:element> 
            <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
            <xsl:element name="a">                     
                <xsl:attribute name="href">
                    <xsl:value-of select="substring-after( $ref_luogo, ' ' )"/>
                </xsl:attribute>
                <sub>Treccani</sub>
            </xsl:element>
        </xsl:variable>
        <xsl:variable name="paese">
            <xsl:value-of select="//tei:div[@type='lists']/tei:listPlace/tei:place[@xml:id='MI']/tei:country"/>
        </xsl:variable>

        <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
        <xsl:copy-of select="$citta"/><xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>,
        in <xsl:copy-of select="$paese"/>.
        <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>
    </xsl:template>  

    <!-- Personaggi singoli formattazione e aggiunta note ulteriori-->

    <!-- Vincenzo Bellini -->
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='VB']">
        <xsl:variable name="nome1">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
            <xsl:value-of select="//tei:person/tei:persName/tei:forename"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>
        </xsl:variable> 
        <xsl:variable name="nome2">
            <xsl:value-of select="//tei:person/tei:persName/tei:forename[2]"/>
        </xsl:variable> 
            <xsl:variable name="nome3">
            <xsl:value-of select="//tei:person/tei:persName/tei:forename[3]"/>
        </xsl:variable>  
        <xsl:variable name="nome4">
            <xsl:value-of select="//tei:person/tei:persName/tei:forename[4]"/>
        </xsl:variable>     
        <xsl:variable name="surname">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
            <xsl:value-of select="//tei:person/tei:persName/tei:surname"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>    </xsl:variable> 
        <xsl:variable name="alias">
            <xsl:value-of select="//tei:person/tei:persName/tei:addName"/>
        </xsl:variable>     
            <xsl:variable name="rolename">
            <xsl:value-of select="//tei:person/tei:persName/tei:roleName"/>
        </xsl:variable>
        <xsl:variable name="sesso">
            <xsl:value-of select="//tei:person/tei:sex"/>
        </xsl:variable> 
        <xsl:variable name="dataN">
            <xsl:value-of select="//tei:person/tei:birth/tei:date"/>
        </xsl:variable> 
        <xsl:variable name="cittaN">
            <xsl:value-of select="//tei:person/tei:birth/tei:placeName/tei:settlement"/>
        </xsl:variable> 
        <xsl:variable name="provinciaN">
            <xsl:value-of select="//tei:person/tei:birth/tei:placeName/tei:settlement[2]"/>
        </xsl:variable>
        <xsl:variable name="dataM">
            <xsl:value-of select="//tei:person/tei:death/tei:date"/>
        </xsl:variable> 
        <xsl:variable name="cittaM">
            <xsl:value-of select="//tei:person/tei:death/tei:placeName/tei:settlement"/>
        </xsl:variable>
        <xsl:variable name="provinciaM">
            <xsl:value-of select="//tei:person/tei:death/tei:placeName/tei:settlement[2]"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        </xsl:variable> 
        <!--Variabili per ottenere i link VIAF e Treccani-->
        <xsl:variable name="Treccani">
            <xsl:value-of select="tei:persName[@role='composer']/tei:ref/@target"/>  
        </xsl:variable>
        <xsl:variable name="VIAF">
            <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='VB']/@sameAs"/>
        </xsl:variable>
        Nome: <xsl:copy-of select="$nome1"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Secondo nome: <xsl:copy-of select="$nome2"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Altri nomi: <xsl:copy-of select="$nome3"/>, <xsl:copy-of select="$nome4"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:copy-of select="$surname"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Soprannominato: <xsl:copy-of select="$alias"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Ruolo: <xsl:copy-of select="$rolename"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Sesso: <xsl:copy-of select="$sesso"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di nascita: <xsl:copy-of select="$dataN"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Luogo di nascita: <xsl:copy-of select="$cittaN"/>, in provincia di <xsl:copy-of select="$provinciaN"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di morte: <xsl:copy-of select="$dataM"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Luogo di morte: <xsl:copy-of select="$cittaM"/>, in provincia di <xsl:copy-of select="$provinciaM"/>
        Identità: 
        <xsl:element name="a">                        
            <xsl:attribute name="href">
                <xsl:value-of select="$VIAF"/>
            </xsl:attribute>VIAF</xsl:element> 
        <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
        <xsl:element name="a">                     
            <xsl:attribute name="href">
                <xsl:value-of select="$Treccani"/>
            </xsl:attribute>Treccani</xsl:element>
        <xsl:text disable-output-escaping="yes"><![CDATA[<br><br>]]></xsl:text>
    </xsl:template>

    <!-- Stefano Notarbartolo -->
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='SN']">
        <xsl:variable name="nome1">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
                <xsl:value-of select="//tei:person[@xml:id='SN']/tei:persName/tei:forename"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>        
        </xsl:variable> 
        <xsl:variable name="nome2">
            <xsl:value-of select="//tei:person[@xml:id='SN']/tei:persName/tei:forename[2]"/>
        </xsl:variable> 
            <xsl:variable name="nome3">
            <xsl:value-of select="//tei:person[@xml:id='SN']/tei:persName/tei:forename[3]"/>
        </xsl:variable>  
        <xsl:variable name="nome4">
            <xsl:value-of select="//tei:person[@xml:id='SN']/tei:persName/tei:forename[4]"/>
        </xsl:variable>     
        <xsl:variable name="surname">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
            <xsl:value-of select="//tei:person[@xml:id='SN']/tei:persName/tei:surname"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>    </xsl:variable> 
        <xsl:variable name="alias">
            <xsl:value-of select="//tei:person[@xml:id='SN']/tei:persName/tei:addName"/>
        </xsl:variable>     
            <xsl:variable name="rolename">
            <xsl:value-of select="//tei:person[@xml:id='SN']/tei:persName/tei:roleName"/>
        </xsl:variable>
        <xsl:variable name="sesso">
            <xsl:value-of select="//tei:person[@xml:id='SN']/tei:sex"/>
        </xsl:variable> 
        <xsl:variable name="dataN">
            <xsl:value-of select="//tei:person[@xml:id='SN']/tei:birth/tei:date"/>
        </xsl:variable> 
        <xsl:variable name="cittaN">
            <xsl:value-of select="//tei:person[@xml:id='SN']/tei:birth/tei:placeName/tei:settlement"/>
        </xsl:variable> 
        <xsl:variable name="provinciaN">
            <xsl:value-of select="//tei:person[@xml:id='SN']/tei:birth/tei:placeName/tei:settlement[2]"/>
        </xsl:variable>
        <xsl:variable name="dataM">
            <xsl:value-of select="//tei:person[@xml:id='SN']/tei:death/tei:date"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        </xsl:variable> 
        Nome: <xsl:copy-of select="$nome1"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:copy-of select="$surname"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Ruolo: <xsl:copy-of select="$rolename"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Sesso: <xsl:copy-of select="$sesso"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di nascita: <xsl:copy-of select="$dataN"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Luogo di nascita: <xsl:copy-of select="$cittaN"/>, in provincia di <xsl:copy-of select="$provinciaN"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di morte: <xsl:copy-of select="$dataM"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
    </xsl:template>

    <!--Vincenzo Tobia Bellini-->
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='VTB']">
        <xsl:variable name="nome1">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
            <xsl:value-of select="//tei:person[@xml:id='VTB']/tei:persName/tei:forename"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>        
        </xsl:variable> 
        <xsl:variable name="nome2">
            <xsl:value-of select="//tei:person[@xml:id='VTB']/tei:persName/tei:forename[2]"/>
        </xsl:variable> 
        <xsl:variable name="surname">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
            <xsl:value-of select="//tei:person[@xml:id='VTB']/tei:persName/tei:surname"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>
        </xsl:variable>      
        <xsl:variable name="rolename">
            <xsl:value-of select="//tei:person[@xml:id='VTB']/tei:persName/tei:roleName"/>
        </xsl:variable>
        <xsl:variable name="sesso">
            <xsl:value-of select="//tei:person[@xml:id='VTB']/tei:sex"/>
        </xsl:variable> 
        <xsl:variable name="dataN">
            <xsl:value-of select="//tei:person[@xml:id='VTB']/tei:birth/tei:date"/>
        </xsl:variable> 
        <xsl:variable name="cittaN">
            <xsl:value-of select="//tei:person[@xml:id='VTB']/tei:birth/tei:placeName/tei:settlement"/>
        </xsl:variable> 
        <xsl:variable name="provinciaN">
            <xsl:value-of select="//tei:person[@xml:id='VTB']/tei:birth/tei:placeName/tei:settlement[2]"/>
        </xsl:variable>
        <xsl:variable name="dataM">
            <xsl:value-of select="//tei:person[@xml:id='VTB']/tei:death/tei:date"/>
        </xsl:variable> 
        <xsl:variable name="cittaM">
            <xsl:value-of select="//tei:person[@xml:id='VTB']/tei:death/tei:placeName/tei:settlement"/>
        </xsl:variable>
        <xsl:variable name="provinciaM">
            <xsl:value-of select="//tei:person/tei:death/tei:placeName/tei:settlement[2]"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        </xsl:variable>
        <!--Variabili per ottenere i link VIAF e Treccani-->
        <xsl:variable name="Treccani">
            <xsl:value-of select="tei:persName[@role='composer']/tei:ref/@target"/>  
        </xsl:variable>
        <xsl:variable name="VIAF">
            <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='VTB']/@sameAs"/>
        </xsl:variable>        
        Nome: <xsl:copy-of select="$nome1"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Secondo nome: <xsl:copy-of select="$nome2"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:copy-of select="$surname"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Sesso: <xsl:copy-of select="$sesso"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di nascita: <xsl:copy-of select="$dataN"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Luogo di nascita: <xsl:copy-of select="$cittaN"/>, in provincia di <xsl:copy-of select="$provinciaN"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di morte: <xsl:copy-of select="$dataM"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Luogo di morte: <xsl:copy-of select="$cittaM"/>, in provincia di <xsl:copy-of select="$provinciaM"/>
        Identità: 
        <xsl:element name="a">                        
            <xsl:attribute name="href">
                <xsl:value-of select="$VIAF"/>
            </xsl:attribute>VIAF</xsl:element> 
        <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
        <xsl:element name="a">                     
            <xsl:attribute name="href">
                <xsl:value-of select="$Treccani"/>
            </xsl:attribute>Treccani</xsl:element>
        <xsl:text disable-output-escaping="yes"><![CDATA[<br><br>]]></xsl:text>        
    </xsl:template>

    <!-- Agata Ferlito -->
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='AF']">
        <xsl:variable name="nome1">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
            <xsl:value-of select="//tei:person[@xml:id='AF']/tei:persName/tei:forename"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>
        </xsl:variable> 
        <xsl:variable name="surname">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
            <xsl:value-of select="//tei:person[@xml:id='AF']/tei:persName/tei:surname"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>
        </xsl:variable>
        <xsl:variable name="sesso">
            <xsl:value-of select="//tei:person[@xml:id='AF']/tei:sex"/>
        </xsl:variable> 
        <xsl:variable name="dataN">
            <xsl:value-of select="//tei:person[@xml:id='AF']/tei:birth/tei:date"/>
        </xsl:variable> 
        <xsl:variable name="cittaN">
            <xsl:value-of select="//tei:person[@xml:id='AF']/tei:birth/tei:placeName/tei:settlement"/>
        </xsl:variable> 
        <xsl:variable name="provinciaN">
            <xsl:value-of select="//tei:person[@xml:id='AF']/tei:birth/tei:placeName/tei:settlement[2]"/>
        </xsl:variable>
        <xsl:variable name="dataM">
            <xsl:value-of select="//tei:person[@xml:id='AF']/tei:death/tei:date"/>
        </xsl:variable> 
        <xsl:variable name="cittaM">
            <xsl:value-of select="//tei:person[@xml:id='AF']/tei:death/tei:placeName/tei:settlement"/>
        </xsl:variable>
        <xsl:variable name="provinciaM">
            <xsl:value-of select="//tei:person[@xml:id='AF']/tei:death/tei:placeName/tei:settlement[2]"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        </xsl:variable> 
        <xsl:variable name="note_pers">
            <xsl:value-of select="//tei:person[@xml:id='AF']/tei:note/tei:p"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[<br><br>]]></xsl:text>
        </xsl:variable>         
        Nome: <xsl:copy-of select="$nome1"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:copy-of select="$surname"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Sesso: <xsl:copy-of select="$sesso"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di nascita: <xsl:copy-of select="$dataN"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Luogo di nascita: <xsl:copy-of select="$cittaN"/>, in provincia di <xsl:copy-of select="$provinciaN"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di morte: <xsl:copy-of select="$dataM"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Luogo di morte: <xsl:copy-of select="$cittaM"/>, in provincia di <xsl:copy-of select="$provinciaM"/>
        <xsl:text disable-output-escaping="yes"><![CDATA[<i>]]></xsl:text>
        <xsl:copy-of select="$note_pers"/><xsl:text disable-output-escaping="yes"><![CDATA[</i>]]></xsl:text>
    </xsl:template>

    <!-- Ignazio Paternò Castello, V principe di Biscari -->
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='IPC']">
        <xsl:variable name="nome1">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
            <xsl:value-of select="//tei:person[@xml:id='IPC']/tei:persName/tei:forename"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>
        </xsl:variable> 
        <xsl:variable name="nome3">
            <xsl:value-of select="//tei:person[@xml:id='IPC']/tei:persName/tei:forename[3]"/>
        </xsl:variable>  
        <xsl:variable name="nome4">
            <xsl:value-of select="//tei:person[@xml:id='IPC']/tei:persName/tei:forename[4]"/>
        </xsl:variable>     
        <xsl:variable name="surname">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
            <xsl:value-of select="//tei:person[@xml:id='IPC']/tei:persName/tei:surname"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>    </xsl:variable> 
        <xsl:variable name="surname2">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
            <xsl:value-of select="//tei:person[@xml:id='IPC']/tei:persName/tei:surname[2]"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>    </xsl:variable>      
            <xsl:variable name="rolename">
            <xsl:value-of select="//tei:person[@xml:id='IPC']/tei:persName/tei:roleName"/>
        </xsl:variable>
        <xsl:variable name="sesso">
            <xsl:value-of select="//tei:person[@xml:id='IPC']/tei:sex"/>
        </xsl:variable> 
        <xsl:variable name="dataN">
            <xsl:value-of select="//tei:person[@xml:id='IPC']/tei:birth/tei:date"/>
        </xsl:variable> 
        <xsl:variable name="cittaN">
            <xsl:value-of select="//tei:person[@xml:id='IPC']/tei:birth/tei:placeName/tei:settlement"/>
        </xsl:variable> 
        <xsl:variable name="provinciaN">
            <xsl:value-of select="//tei:person[@xml:id='IPC']/tei:birth/tei:placeName/tei:settlement[2]"/>
        </xsl:variable>
        <xsl:variable name="note_pers">
            <xsl:value-of select="//tei:person[@xml:id='IPC']/tei:note/tei:p"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        </xsl:variable>         
        <!--Variabili per ottenere i link VIAF e Treccani-->
        <xsl:variable name="Treccani">
            <xsl:value-of select="tei:person[@xml:id='IPC']/tei:persName/tei:ref/@target"/>  
        </xsl:variable>
        <xsl:variable name="VIAF">
            <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='IPC']/@sameAs"/>
        </xsl:variable>
        Nome: <xsl:copy-of select="$nome1"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:copy-of select="$surname"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Famiglia: <xsl:copy-of select="$surname2"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Ruolo: <xsl:copy-of select="$rolename"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Sesso: <xsl:copy-of select="$sesso"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di nascita: <xsl:copy-of select="$dataN"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Luogo di nascita: <xsl:copy-of select="$cittaN"/>, in provincia di <xsl:copy-of select="$provinciaN"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        <xsl:text disable-output-escaping="yes"><![CDATA[<i>]]></xsl:text>
        <xsl:copy-of select="$note_pers"/><xsl:text disable-output-escaping="yes"><![CDATA[</i>]]></xsl:text>
        Identità: 
        <xsl:element name="a">                        
            <xsl:attribute name="href">
                <xsl:value-of select="$VIAF"/>
            </xsl:attribute>VIAF</xsl:element> 
        <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
        <xsl:element name="a">                     
            <xsl:attribute name="href">
                <xsl:value-of select="$Treccani"/>
            </xsl:attribute>Treccani</xsl:element>
        <xsl:text disable-output-escaping="yes"><![CDATA[<br><br>]]></xsl:text>        
    </xsl:template>

    <!-- Agnese Camici -->
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='AC']">
        <xsl:variable name="nome1">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
                <xsl:value-of select="//tei:person[@xml:id='AC']/tei:persName/tei:forename"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>        
        </xsl:variable> 
        <xsl:variable name="surname">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
            <xsl:value-of select="//tei:person[@xml:id='AC']/tei:persName/tei:surname"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>    </xsl:variable> 
        <xsl:variable name="sesso">
            <xsl:value-of select="//tei:person[@xml:id='AC']/tei:sex"/>
        </xsl:variable> 
        <xsl:variable name="dataN">
            <xsl:value-of select="//tei:person[@xml:id='AC']/tei:birth/tei:date"/>
        </xsl:variable> 
        <xsl:variable name="cittaN">
            <xsl:value-of select="//tei:person[@xml:id='AC']/tei:birth/tei:placeName/tei:settlement"/>
        </xsl:variable> 
        <xsl:variable name="provinciaN">
            <xsl:value-of select="//tei:person[@xml:id='AC']/tei:birth/tei:placeName/tei:settlement[2]"/>
        </xsl:variable>
        Nome: <xsl:copy-of select="$nome1"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:copy-of select="$surname"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Sesso: <xsl:copy-of select="$sesso"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di nascita: <xsl:copy-of select="$dataN"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Luogo di nascita: <xsl:copy-of select="$cittaN"/>, in provincia di <xsl:copy-of select="$provinciaN"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br><br>]]></xsl:text>
    </xsl:template>

    <!--Angelo Mario Del Grosso-->    
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='AMDG']">
        <xsl:variable name="nome1">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
                <xsl:value-of select="//tei:person[@xml:id='AMDG']/tei:persName/tei:forename"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>        
        </xsl:variable> 
        <xsl:variable name="nome2">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
                <xsl:value-of select="//tei:person[@xml:id='AMDG']/tei:persName/tei:forename[2]"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>        
        </xsl:variable>         
        <xsl:variable name="surname">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
            <xsl:value-of select="//tei:person[@xml:id='AMDG']/tei:persName/tei:surname"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>    </xsl:variable> 
        <xsl:variable name="sesso">
            <xsl:value-of select="//tei:person[@xml:id='AMDG']/tei:sex"/>
        </xsl:variable> 
        <xsl:variable name="dataN">
            <xsl:value-of select="//tei:person[@xml:id='AMDG']/tei:birth/tei:date"/>
        </xsl:variable> 
        <xsl:variable name="cittaN">
            <xsl:value-of select="//tei:person[@xml:id='AMDG']/tei:birth/tei:placeName/tei:settlement"/>
        </xsl:variable> 
        <xsl:variable name="provinciaN">
            <xsl:value-of select="//tei:person[@xml:id='AMDG']/tei:birth/tei:placeName/tei:settlement[2]"/>
        </xsl:variable>
        <xsl:variable name="dataM">
            <xsl:value-of select="//tei:person[@xml:id='AMDG']/tei:death/tei:date"/>
        </xsl:variable> 
        <xsl:variable name="VIAF">
            <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='AMDG']/@sameAs"/>
        </xsl:variable>
        Nome: <xsl:copy-of select="$nome1"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Secondo nome: <xsl:copy-of select="$nome2"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:copy-of select="$surname"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Sesso: <xsl:copy-of select="$sesso"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di nascita: <xsl:copy-of select="$dataN"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Luogo di nascita: <xsl:copy-of select="$cittaN"/>, in provincia di <xsl:copy-of select="$provinciaN"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Identità: 
        <xsl:element name="a">                        
            <xsl:attribute name="href">
                <xsl:value-of select="$VIAF"/>
            </xsl:attribute>VIAF</xsl:element> 
        <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;<br><br>]]></xsl:text>       
    </xsl:template>

    <!-- Daria Spampinato -->
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='DS']">
        <xsl:variable name="nome1">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
                <xsl:value-of select="//tei:person[@xml:id='DS']/tei:persName/tei:forename"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>        
        </xsl:variable> 
        <xsl:variable name="surname">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
            <xsl:value-of select="//tei:person[@xml:id='DS']/tei:persName/tei:surname"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>    </xsl:variable> 
        <xsl:variable name="sesso">
            <xsl:value-of select="//tei:person[@xml:id='DS']/tei:sex"/>
        </xsl:variable> 
        <xsl:variable name="dataN">
            <xsl:value-of select="//tei:person[@xml:id='DS']/tei:birth/tei:date"/>
        </xsl:variable> 
        <xsl:variable name="cittaN">
            <xsl:value-of select="//tei:person[@xml:id='DS']/tei:birth/tei:placeName/tei:settlement"/>
        </xsl:variable> 
        <xsl:variable name="provinciaN">
            <xsl:value-of select="//tei:person[@xml:id='DS']/tei:birth/tei:placeName/tei:settlement[2]"/>
        </xsl:variable>
        Nome: <xsl:copy-of select="$nome1"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:copy-of select="$surname"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Sesso: <xsl:copy-of select="$sesso"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br><br>]]></xsl:text>
    </xsl:template>    

    <!-- Erica Capizzi -->
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='EC']">
        <xsl:variable name="nome1">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
                <xsl:value-of select="//tei:person[@xml:id='EC']/tei:persName/tei:forename"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>        
        </xsl:variable> 
        <xsl:variable name="surname">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
            <xsl:value-of select="//tei:person[@xml:id='EC']/tei:persName/tei:surname"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>    </xsl:variable> 
        <xsl:variable name="sesso">
            <xsl:value-of select="//tei:person[@xml:id='EC']/tei:sex"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br><br>]]></xsl:text>
        </xsl:variable> 
        Nome: <xsl:copy-of select="$nome1"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:copy-of select="$surname"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Sesso: <xsl:copy-of select="$sesso"/>
    </xsl:template> 

    <!-- Graziella Seminara -->
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='GS']">
        <xsl:variable name="nome1">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
                <xsl:value-of select="//tei:person[@xml:id='GS']/tei:persName/tei:forename"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>        
        </xsl:variable> 
        <xsl:variable name="surname">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
            <xsl:value-of select="//tei:person[@xml:id='GS']/tei:persName/tei:surname"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>    </xsl:variable> 
        <xsl:variable name="sesso">
            <xsl:value-of select="//tei:person[@xml:id='GS']/tei:sex"/>
        </xsl:variable> 
        <xsl:variable name="dataN">
            <xsl:value-of select="//tei:person[@xml:id='GS']/tei:birth/tei:date"/>
        </xsl:variable> 
        <xsl:variable name="cittaN">
            <xsl:value-of select="//tei:person[@xml:id='GS']/tei:birth/tei:placeName/tei:settlement"/>
        </xsl:variable> 
        <xsl:variable name="provinciaN">
            <xsl:value-of select="//tei:person[@xml:id='GS']/tei:birth/tei:placeName/tei:settlement[2]"/>
        </xsl:variable>
        <xsl:variable name="dataM">
            <xsl:value-of select="//tei:person[@xml:id='GS']/tei:death/tei:date"/>
        </xsl:variable> 
        <xsl:variable name="VIAF">
            <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='AMDG']/@sameAs"/>
        </xsl:variable>        
        Nome: <xsl:copy-of select="$nome1"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:copy-of select="$surname"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Sesso: <xsl:copy-of select="$sesso"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di nascita: <xsl:copy-of select="$dataN"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Luogo di nascita: <xsl:copy-of select="$cittaN"/>, in provincia di <xsl:copy-of select="$provinciaN"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Identità: 
        <xsl:element name="a">                        
            <xsl:attribute name="href">
                <xsl:value-of select="$VIAF"/>
            </xsl:attribute>VIAF</xsl:element> 
        <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;<br><br>]]></xsl:text>  
    </xsl:template>    

    <!-- Rosario Bellini -->
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='RB']">
        <xsl:variable name="nome1">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
                <xsl:value-of select="//tei:person[@xml:id='RB']/tei:persName/tei:forename"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>        
        </xsl:variable>   
        <xsl:variable name="surname">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
            <xsl:value-of select="//tei:person[@xml:id='RB']/tei:persName/tei:surname"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>    </xsl:variable>  
        <xsl:variable name="sesso">
            <xsl:value-of select="//tei:person[@xml:id='RB']/tei:sex"/>
        </xsl:variable> 
        <xsl:variable name="dataN">
            <xsl:value-of select="//tei:person[@xml:id='RB']/tei:birth/tei:date"/>
        </xsl:variable> 
        <xsl:variable name="cittaN">
            <xsl:value-of select="//tei:person[@xml:id='RB']/tei:birth/tei:placeName/tei:settlement"/>
        </xsl:variable> 
        <xsl:variable name="provinciaN">
            <xsl:value-of select="//tei:person[@xml:id='RB']/tei:birth/tei:placeName/tei:settlement[2]"/>
        </xsl:variable>
        <xsl:variable name="dataM">
            <xsl:value-of select="//tei:person[@xml:id='RB']/tei:death/tei:date"/>
        </xsl:variable> 
       <xsl:variable name="cittaM">
            <xsl:value-of select="//tei:person[@xml:id='RB']/tei:death/tei:placeName/tei:settlement"/>
        </xsl:variable>
        <xsl:variable name="provinciaM">
            <xsl:value-of select="//tei:person[@xml:id='RB']/tei:death/tei:placeName/tei:settlement[2]"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</br>]]></xsl:text> 
        </xsl:variable>                 
        Nome: <xsl:copy-of select="$nome1"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:copy-of select="$surname"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Sesso: <xsl:copy-of select="$sesso"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di nascita: <xsl:copy-of select="$dataN"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Luogo di nascita: <xsl:copy-of select="$cittaN"/>, in provincia di <xsl:copy-of select="$provinciaN"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di morte: <xsl:copy-of select="$dataM"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Luogo di morte: <xsl:copy-of select="$cittaM"/>, in provincia di <xsl:copy-of select="$provinciaM"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>        
    </xsl:template>

    <!-- Luisa Cambi -->
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='LC']">
        <xsl:variable name="nome1">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
                <xsl:value-of select="//tei:person[@xml:id='LC']/tei:persName/tei:forename"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>        
        </xsl:variable> 
        <xsl:variable name="surname">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
            <xsl:value-of select="//tei:person[@xml:id='LC']/tei:persName/tei:surname"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>    </xsl:variable> 
        <xsl:variable name="sesso">
            <xsl:value-of select="//tei:person[@xml:id='LC']/tei:sex"/>
        </xsl:variable> 
        <xsl:variable name="VIAF">
            <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='LC']/@sameAs"/>
        </xsl:variable>        
        Nome: <xsl:copy-of select="$nome1"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:copy-of select="$surname"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Sesso: <xsl:copy-of select="$sesso"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Identità: 
        <xsl:element name="a">                        
            <xsl:attribute name="href">
                <xsl:value-of select="$VIAF"/>
            </xsl:attribute>VIAF</xsl:element> 
        <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;<br><br>]]></xsl:text>  
    </xsl:template> 

    <!-- Carmelo Neri -->
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='CN']">
        <xsl:variable name="nome1">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
                <xsl:value-of select="//tei:person[@xml:id='CN']/tei:persName/tei:forename"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>        
        </xsl:variable> 
        <xsl:variable name="surname">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
            <xsl:value-of select="//tei:person[@xml:id='CN']/tei:persName/tei:surname"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>    </xsl:variable> 
        <xsl:variable name="sesso">
            <xsl:value-of select="//tei:person[@xml:id='CN']/tei:sex"/>
        </xsl:variable> 
        <xsl:variable name="dataN">
            <xsl:value-of select="//tei:person[@xml:id='CN']/tei:birth/tei:date"/></xsl:variable> 
        <xsl:variable name="VIAF">
            <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='CN']/@sameAs"/>
        </xsl:variable>        
        Nome: <xsl:copy-of select="$nome1"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:copy-of select="$surname"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Sesso: <xsl:copy-of select="$sesso"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di nascita: <xsl:copy-of select="$dataN"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Identità: 
        <xsl:element name="a">                        
            <xsl:attribute name="href">
                <xsl:value-of select="$VIAF"/>
            </xsl:attribute>VIAF</xsl:element> 
        <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;<br><br>]]></xsl:text>  
    </xsl:template>

    <!-- Carmelo Bellini -->
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='CB']">
        <xsl:variable name="nome1">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
                <xsl:value-of select="//tei:person[@xml:id='CB']/tei:persName/tei:forename"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>        
        </xsl:variable> 
        <xsl:variable name="surname">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
            <xsl:value-of select="//tei:person[@xml:id='CB']/tei:persName/tei:surname"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>    
        </xsl:variable> 
        <xsl:variable name="sesso">
            <xsl:value-of select="//tei:person[@xml:id='CB']/tei:sex"/>
        </xsl:variable> 
        <xsl:variable name="dataN">
            <xsl:value-of select="//tei:person[@xml:id='CB']/tei:birth/tei:date"/>
        </xsl:variable> 
        <xsl:variable name="dataM">
            <xsl:value-of select="//tei:person[@xml:id='CB']/tei:death/tei:date"/>
        </xsl:variable> 
        <xsl:variable name="VIAF">
            <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='CB']/@sameAs"/>
        </xsl:variable>        
        Nome: <xsl:copy-of select="$nome1"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:copy-of select="$surname"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Sesso: <xsl:copy-of select="$sesso"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di nascita: <xsl:copy-of select="$dataN"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di morte: <xsl:copy-of select="$dataM"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Identità: 
        <xsl:element name="a">                        
            <xsl:attribute name="href">
                <xsl:value-of select="$VIAF"/>
            </xsl:attribute>VIAF</xsl:element> 
        <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;<br><br>]]></xsl:text>  
    </xsl:template> 

    <!-- Francesco Bellini -->
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='FB']">
        <xsl:variable name="nome1">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
                <xsl:value-of select="//tei:person[@xml:id='FB']/tei:persName/tei:forename"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>        
        </xsl:variable> 
        <xsl:variable name="surname">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
            <xsl:value-of select="//tei:person[@xml:id='FB']/tei:persName/tei:surname"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>    </xsl:variable> 
        <xsl:variable name="sesso">
            <xsl:value-of select="//tei:person[@xml:id='FB']/tei:sex"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br><br>]]></xsl:text>
        </xsl:variable> 
        Nome: <xsl:copy-of select="$nome1"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:copy-of select="$surname"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Sesso: <xsl:copy-of select="$sesso"/>
    </xsl:template>  

    <!-- Michela Bellini -->
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='MiB']">
        <xsl:variable name="nome1">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
                <xsl:value-of select="//tei:person[@xml:id='MiB']/tei:persName/tei:forename"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>        
        </xsl:variable> 
        <xsl:variable name="surname">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
            <xsl:value-of select="//tei:person[@xml:id='MiB']/tei:persName/tei:surname"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>    </xsl:variable> 
        <xsl:variable name="sesso">
            <xsl:value-of select="//tei:person[@xml:id='MiB']/tei:sex"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br><br>]]></xsl:text>
        </xsl:variable> 
        Nome: <xsl:copy-of select="$nome1"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:copy-of select="$surname"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Sesso: <xsl:copy-of select="$sesso"/>
    </xsl:template>         
    
    <!-- Giuseppa Bellini -->
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='GB']">
        <xsl:variable name="nome1">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
                <xsl:value-of select="//tei:person[@xml:id='GB']/tei:persName/tei:forename"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>        
        </xsl:variable> 
        <xsl:variable name="surname">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
            <xsl:value-of select="//tei:person[@xml:id='GB']/tei:persName/tei:surname"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>    </xsl:variable> 
        <xsl:variable name="sesso">
            <xsl:value-of select="//tei:person[@xml:id='GB']/tei:sex"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br><br>]]></xsl:text>
        </xsl:variable> 
        Nome: <xsl:copy-of select="$nome1"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:copy-of select="$surname"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Sesso: <xsl:copy-of select="$sesso"/>
    </xsl:template>   

    <!-- Mario Bellini -->
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='MoB']">
        <xsl:variable name="nome1">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
                <xsl:value-of select="//tei:person[@xml:id='MoB']/tei:persName/tei:forename"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>        
        </xsl:variable> 
        <xsl:variable name="surname">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
            <xsl:value-of select="//tei:person[@xml:id='MoB']/tei:persName/tei:surname"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>    </xsl:variable> 
        <xsl:variable name="sesso">
            <xsl:value-of select="//tei:person[@xml:id='MoB']/tei:sex"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br><br>]]></xsl:text>
        </xsl:variable> 
        Nome: <xsl:copy-of select="$nome1"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:copy-of select="$surname"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Sesso: <xsl:copy-of select="$sesso"/>
    </xsl:template> 

    <!-- Maria Bellini -->
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='MaB']">
        <xsl:variable name="nome1">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
                <xsl:value-of select="//tei:person[@xml:id='MaB']/tei:persName/tei:forename"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>        
        </xsl:variable> 
        <xsl:variable name="surname">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
            <xsl:value-of select="//tei:person[@xml:id='MaB']/tei:persName/tei:surname"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>    </xsl:variable> 
        <xsl:variable name="sesso">
            <xsl:value-of select="//tei:person[@xml:id='MaB']/tei:sex"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br><br>]]></xsl:text>
        </xsl:variable> 
        Nome: <xsl:copy-of select="$nome1"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:copy-of select="$surname"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Sesso: <xsl:copy-of select="$sesso"/>
    </xsl:template>     

    <!-- Carlo Cotumacci -->
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='CC']">
        <xsl:variable name="nome1">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
                <xsl:value-of select="//tei:person[@xml:id='CC']/tei:persName/tei:forename"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>        
        </xsl:variable>   
        <xsl:variable name="surname">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
            <xsl:value-of select="//tei:person[@xml:id='CC']/tei:persName/tei:surname"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>    </xsl:variable>  
        <xsl:variable name="sesso">
            <xsl:value-of select="//tei:person[@xml:id='CC']/tei:sex"/>
        </xsl:variable> 
        <xsl:variable name="dataN">
            <xsl:value-of select="//tei:person[@xml:id='CC']/tei:birth/tei:date"/>
        </xsl:variable> 
        <xsl:variable name="cittaN">
            <xsl:value-of select="//tei:person[@xml:id='CC']/tei:birth/tei:placeName/tei:settlement"/>
        </xsl:variable> 
        <xsl:variable name="provinciaN">
            <xsl:value-of select="//tei:person[@xml:id='CC']/tei:birth/tei:placeName/tei:settlement[2]"/>
        </xsl:variable>
        <xsl:variable name="dataM">
            <xsl:value-of select="//tei:person[@xml:id='CC']/tei:death/tei:date"/>
        </xsl:variable> 
       <xsl:variable name="cittaM">
            <xsl:value-of select="//tei:person[@xml:id='CC']/tei:death/tei:placeName/tei:settlement"/>
        </xsl:variable>
        <xsl:variable name="provinciaM">
            <xsl:value-of select="//tei:person[@xml:id='CC']/tei:death/tei:placeName/tei:settlement[2]"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</br>]]></xsl:text> 
        </xsl:variable>   
        <xsl:variable name="VIAF">
            <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='CC']/@sameAs"/>
        </xsl:variable>               
        Nome: <xsl:copy-of select="$nome1"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:copy-of select="$surname"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Sesso: <xsl:copy-of select="$sesso"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di nascita: <xsl:copy-of select="$dataN"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Luogo di nascita: <xsl:copy-of select="$cittaN"/>, in provincia di <xsl:copy-of select="$provinciaN"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di morte: <xsl:copy-of select="$dataM"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Luogo di morte: <xsl:copy-of select="$cittaM"/>, in provincia di <xsl:copy-of select="$provinciaM"/>   
        Identità: 
        <xsl:element name="a">                        
            <xsl:attribute name="href">
                <xsl:value-of select="$VIAF"/>
            </xsl:attribute>VIAF</xsl:element> 
        <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;<br><br>]]></xsl:text>  
    </xsl:template> 

    <!-- Giuseppe Dol -->
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='GD']">
        <xsl:variable name="nome1">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
                <xsl:value-of select="//tei:person[@xml:id='GD']/tei:persName/tei:forename"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>        
        </xsl:variable>   
        <xsl:variable name="surname">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
            <xsl:value-of select="//tei:person[@xml:id='GD']/tei:persName/tei:surname"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>    </xsl:variable>  
        <xsl:variable name="sesso">
            <xsl:value-of select="//tei:person[@xml:id='GD']/tei:sex"/>
        </xsl:variable> 
        <xsl:variable name="dataM">
            <xsl:value-of select="//tei:person[@xml:id='GD']/tei:death/tei:date"/>
        </xsl:variable> 
       <xsl:variable name="cittaM">
            <xsl:value-of select="//tei:person[@xml:id='GD']/tei:death/tei:placeName/tei:settlement"/>
        </xsl:variable>
        <xsl:variable name="provinciaM">
            <xsl:value-of select="//tei:person[@xml:id='GD']/tei:death/tei:placeName/tei:settlement[2]"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</br>]]></xsl:text> 
        </xsl:variable> 
        <xsl:variable name="VIAF">
            <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='GD']/@sameAs"/>
        </xsl:variable>                         
        Nome: <xsl:copy-of select="$nome1"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:copy-of select="$surname"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Sesso: <xsl:copy-of select="$sesso"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Data di morte: <xsl:copy-of select="$dataM"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Luogo di morte: <xsl:copy-of select="$cittaM"/>, in provincia di <xsl:copy-of select="$provinciaM"/>       
        Identità: 
        <xsl:element name="a">                        
            <xsl:attribute name="href">
                <xsl:value-of select="$VIAF"/>
            </xsl:attribute>VIAF</xsl:element> 
        <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;<br><br>]]></xsl:text>  
    </xsl:template>      
    
    <!-- Michela Burzì -->
    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='MBu']">
        <xsl:variable name="nome1">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
                <xsl:value-of select="//tei:person[@xml:id='MBu']/tei:persName/tei:forename"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>        
        </xsl:variable>   
        <xsl:variable name="surname">
            <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
            <xsl:value-of select="//tei:person[@xml:id='MBu']/tei:persName/tei:surname"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>    </xsl:variable>  
        <xsl:variable name="sesso">
            <xsl:value-of select="//tei:person[@xml:id='MBu']/tei:sex"/>
        </xsl:variable>                
        Nome: <xsl:copy-of select="$nome1"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Cognome: <xsl:copy-of select="$surname"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
        Sesso: <xsl:copy-of select="$sesso"/> <xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
    </xsl:template>   

    <!-- Terminologia -->
    <xsl:template match="//tei:div[@type='lists']/tei:list[@type='terminology']">
        <xsl:for-each select="*">
            <xsl:if test="(position()mod2)!=0">
                <xsl:element name="a">
                    <xsl:attribute name="id">
                        <xsl:value-of select="tei:term/@xml:id"/>
                    </xsl:attribute>
                    <xsl:text disable-output-escaping="yes"><![CDATA[<b>]]></xsl:text>
                    <xsl:apply-templates select="current()"/>
                    <xsl:text disable-output-escaping="yes"><![CDATA[</b>]]></xsl:text>
                </xsl:element>
            <xsl:text>:</xsl:text>
            </xsl:if>
            <xsl:if test="(position()mod2)=0 and position()!=1">
                <xsl:apply-templates select="current()"/><xsl:text disable-output-escaping="yes"><![CDATA[<br>]]></xsl:text>
            </xsl:if>
        </xsl:for-each>    
    </xsl:template>

    

    <!-- ansioso sic cor -->
    <xsl:template name="ansioso" match="//tei:choice[@xml:id='choice12']">
        <select class="choice_class">
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:sic, '')"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:sic, '')"/>
            </xsl:element>
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:corr, '')"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:corr, '')"/>
            </xsl:element>
        </select>
    </xsl:template>        
    <!-- tantoche sic cor -->
    <xsl:template name="tantoche" match="//tei:choice[@xml:id='choice7']">
        <select class="choice_class">
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:sic, '')"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:sic, '')"/>
            </xsl:element>
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:corr, '')"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:corr, '')"/>
            </xsl:element>
        </select>
    </xsl:template> 
    <!-- autorita -->
    <xsl:template name="autorita" match="//tei:choice[@xml:id='choice8']">
        <select class="choice_class">
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:sic, '')"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:sic, '')"/>
            </xsl:element>
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:corr, '')"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:corr, '')"/>
            </xsl:element>
        </select>
    </xsl:template>     
    <!-- praticare -->
    <xsl:template name="praticare" match="//tei:choice[@xml:id='choice11']">
        <select class="choice_class">
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:sic, '')"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:sic, '')"/>
            </xsl:element>
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:corr, '')"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:corr, '')"/>
            </xsl:element>
        </select>
    </xsl:template> 
    <!-- supplicante -->
    <xsl:template name="supplicante" match="//tei:choice[@xml:id='choice13']">
        <select class="choice_class">
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:abbr, '')"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:abbr, '')"/>
            </xsl:element>
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:expan, '')"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:expan, '')"/>
            </xsl:element>
        </select>
    </xsl:template>       
    <!-- Sig:r -->
    <xsl:template name="sig.r" match="//tei:choice[@xml:id='choice9']">
        <select class="choice_class">
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:abbr, '')"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:abbr, '')"/>
            </xsl:element>
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:expan, '')"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:expan, '')"/>
            </xsl:element>
        </select>
    </xsl:template> 
    <!-- Sig. -->
    <xsl:template name="sig." match="//tei:choice[@xml:id='choice6']">
        <xsl:variable name="sig.">
            <xsl:value-of select="//tei:choice[@xml:id='choice2']/tei:abbr"/>
        </xsl:variable>
        <xsl:variable name="signor">
            <xsl:value-of select="//tei:choice[@xml:id='choice2']/tei:expan"/>
        </xsl:variable>    
        <select class="choice_class">
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="$sig."/>
                </xsl:attribute>
                <xsl:value-of select="$sig."/>
            </xsl:element>
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="$signor"/>
                </xsl:attribute>
                <xsl:value-of select="$signor"/>
            </xsl:element>
        </select>
    </xsl:template>
    <!-- Sig.-->
    <xsl:template name="sig.2" match="//tei:choice[@xml:id='choice5']">
        <select class="choice_class">
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:abbr, '')"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:abbr, '')"/>
            </xsl:element>
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:expan, '')"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:expan, '')"/>
            </xsl:element>
        </select>
    </xsl:template>
    <!-- Prov.a-->
    <xsl:template name="prov.a" match="//tei:choice[@xml:id='choice4']">
        <select class="choice_class">
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:abbr, '')"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:abbr, '')"/>
            </xsl:element>
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:expan, '')"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:expan, '')"/>
            </xsl:element>
        </select>
    </xsl:template>    

    <!--Annotazione 189, la nascondo perché è nel body e ne ho già parlato nella descrizione -->
    <xsl:template name="annotaz189" match="//tei:add[@xml:id='LL1.1_hs_rr-01']">
        <xsl:text></xsl:text>
    </xsl:template>        
    
</xsl:stylesheet>
    