<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:html="http://www.w3.org/1999/xhtml" exclude-result-prefixes="xs tei html" version="2.0">
    <xsl:output method="html"/>

    <!-- transform the root element (TEI) into an HTML template -->
    <xsl:template match="tei:TEI">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text><xsl:text>&#xa;</xsl:text>
        <html lang="en" xml:lang="en">
            <head>
                <title>
                    <!-- add the title from the metadata. This is what will be shown
                    on your browsers tab-->
                    <xsl:value-of select="//tei:titleStmt/tei:title"/>
                </title>
                <!-- load bootstrap css (requires internet!) so you can use their pre-defined css classes to style your html -->
                <link rel="stylesheet"
                    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
                    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
                    crossorigin="anonymous"/>
                <!-- load the stylesheets in the assets/css folder, where you can modify the styling of your website -->
                <link rel="stylesheet" href="assets/css/main.css"/>
                <link rel="stylesheet" href="assets/css/desktop.css"/>
            </head>
            <body>
                <header>
                    <h1 class="header">
                        <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
                    </h1>
                </header>
                <nav id="sitenav">
                    <a href="index.html">Home</a> |
                    <a href="diplomatic.html">Diplomatic Transcription</a> |
                    <a href="reading.html">Reading Text</a> |
                    <a href="toplayer.html">Top Layer</a> |
                </nav>
                <main id="book">
                    <!-- bootstrap "container" class makes the columns look pretty -->
                    <div class="container">
                    <!-- define a row layout with bootstrap's css classes (two columns) -->
                        <div class="row">
                            <!-- first column: load the image based on the IIIF link in the graphic above -->
                            <div class="col-sm">
                                <article id="collection">
                                    <!--<xsl:for-each select="//tei:surface">-->
                                    <xsl:for-each select="//tei:div[@n= 'bc_f_o']">
                                        <img class="thumbnail">
                                         <xsl:attribute name="src">
                                             <xsl:value-of select="@facs"/>
                                         </xsl:attribute>
                                         <xsl:attribute name="title">
                                             <xsl:value-of select="@n"/>
                                         </xsl:attribute>
                                         <xsl:attribute name="alt">
                                             <xsl:value-of select="@ana"/>
                                         </xsl:attribute>
                                     </img>                              
                                    </xsl:for-each>
                                </article>
                            </div>
                            <!-- second column: apply matching templates for anything nested underneath the tei:text element -->
                            <div class="col-sm">
                                <article id="description">
                                    <p class="without_indent">
                                        <strong>Goethe-Galerie</strong> is a book including 50 steel engravings of characters from the works by Johann Wolfgang von Goethe.
                                        The designs were made by Friedrich Pecht and Arthur von Ramberg. The accompanying text was written by Friedrich Pecht. 
                                        The book was first published in 1864 - the version digitised for this project is the second edition from 1877.
                                    </p>
                                    <p class="without_indent">
                                        The steel engravings were already digitised <a href="https://goethehaus.museum-digital.de/object/1287?navlang=de" target="_blank">once</a>. 
                                        As also the text will be of interest, the whole book was digitised at the <a href="https://ub.uni-graz.at/de/bibliotheken/sondersammlungen/digitalisierung/" target="_blank">Digitisation Department of the University Library Graz</a>. Thank you for the possibility and help.
                                    </p>
                                    <p class="without_indent">
                                        As a start eight chapters were chosen for OCR scanning, which was conducted with <a href="https://readcoop.eu/transkribus" target="_blank">Transcribus</a>.
                                        The chosen chapters included characters from "Faust" and "Die Leiden des jungen Werther" as these books are very well known and frequently read in school.
                                    </p>
                                    <p class="without_indent">All images of the digitisation process as well as the TEI can be found in the <a href="https://github.com/sadinger/Goethe-Galerie" target="_blank">repository</a>.</p>
                                </article>
                            </div>
                        </div>
                        <div class="row">
                                <div class="col-sm">
                                    <article id="details">
                                      <p>
                                        <strong>Author:</strong><br/>
                                        <xsl:apply-templates select="//tei:titleStmt/tei:author"/>
                                      </p>
                                      <p>
                                           <strong>Illustrator:</strong><br/>
                                          <xsl:apply-templates select="//tei:titleStmt/tei:editor[@role= 'illustrator'][1]"/> and <xsl:apply-templates select="//tei:titleStmt/tei:editor[@role= 'illustrator'][2]"/>
                                       </p>
                                       <p>
                                            <strong>Holding Library:</strong><br/>
                                           <a href="https://permalink.obvsg.at/UGR/AC08219013" target="blank">
                                               <xsl:apply-templates select="//tei:sourceDesc/tei:biblStruct/tei:relatedItem/tei:bibl/tei:distributor"/>
                                           </a>
                                       </p>
                                      <p>
                                        <strong>Digitisation/TEI:</strong><br/>
                                        <xsl:apply-templates select="//tei:titleStmt/tei:principal"/>
                                      </p>
                                    </article>
                                </div>
                        </div>
                    </div>
                </main>
                <footer>
                <div class="row" id="footer">
                    <div class="row" id="footer">
                        <div class="col-sm copyright">
                            <a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/">
                                <img alt="Creative Commons License" style="border-width:0"
                                    src="https://i.creativecommons.org/l/by-nc/4.0/88x31.png"/>
                            </a>
                            <div class="copyright_text"/>
                            <br/>This work is licensed under a <br/><a rel="license"
                                href="http://creativecommons.org/licenses/by-nc/4.0/"
                                target="_blank">Creative Commons Attribution-NonCommercial 4.0
                                International License</a>. <!--<div class="copyright_logos"><a href="https://creativecommons.org/licenses/by/4.0/legalcode"><img src="assets/img/logos/cc.svg" class="copyright_logo" alt="Creative Commons License"><img src="assets/img/logos/by.svg" class="copyright_logo" alt="Attribution 4.0 International"></a></div>-->
                            <br/> 2023 Sabine Weidinger </div>
                    </div>
                </div>
                </footer>
                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
