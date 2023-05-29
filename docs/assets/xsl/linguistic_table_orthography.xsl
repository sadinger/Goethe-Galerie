<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:html="http://www.w3.org/1999/xhtml" exclude-result-prefixes="xs tei html" version="2.0">
    <xsl:output method="html"/>

    <!-- transform the root element (TEI) into an HTML template -->
    <xsl:template match="tei:TEI">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <xsl:text>&#xa;</xsl:text>
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
                    <a href="diplomatic_carousel.html">Diplomatic Transcription</a> | 
                    <a href="linguistic.html">Linguistic Transcription</a> |
                    <a href="documents.html">Documents</a>
                </nav>
                <main id="book">
                    <!-- Back to top button -->
                    <button
                        type="button"
                        class="btn btn-danger btn-floating btn-lg"
                        id="btn-back-to-top"
                        style="background-color:#561010; border:none;"
                        >
                        <i class="fas fa-arrow-up">&#8593;</i>
                    </button>

                   <div class="container">
                        <!-- define a row layout with bootstrap's css classes (two columns with content, and an empty column in between) -->
                        <div class="row">
                            <div class="col-sm">
                                <h1>Old Orthography</h1>
                            </div>
                            <div class="col-sm">
                                <h1>Modern Orthography</h1>
                            </div>
                        </div>
                        <!-- set up an image-text pair for each page in your document, and start a new 'row' for each pair -->
                        <div class="row">
                            <!-- fill the column with orig -->
                            <div class="col-sm">
                                <xsl:for-each select="//tei:orig">
                                    <p>
                                        <xsl:apply-templates/>
                                    </p>                              
                                </xsl:for-each>
                            </div>
                            <!-- fill the column with reg -->
                            <div class="col-sm" style="white-space: nowrap;">
                                <xsl:for-each select="//tei:reg">
                                    <p>
                                        <xsl:apply-templates/>
                                    </p>                              
                                </xsl:for-each>
                            </div>
                        </div>
                   </div>
                </main>
                <footer>
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
                </footer>
                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"/>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"/>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"/>
                <script>
                    //Get the button
                    let mybutton = document.getElementById("btn-back-to-top");
                    
                    // When the user scrolls down 20px from the top of the document, show the button
                    window.onscroll = function () {
                    scrollFunction();
                    };
                    
                    function scrollFunction() {
                    if (
                    document.body.scrollTop > 20 ||
                    document.documentElement.scrollTop > 20
                    ) {
                    mybutton.style.display = "block";
                    } else {
                    mybutton.style.display = "none";
                    }
                    }
                    // When the user clicks on the button, scroll to the top of the document
                    mybutton.addEventListener("click", backToTop);
                    
                    function backToTop() {
                    document.body.scrollTop = 0;
                    document.documentElement.scrollTop = 0;
                    }
                </script>
            </body>
        </html>
    </xsl:template>

    <!-- by default all text nodes are printed out, unless something else is defined.
    We don't want to show the metadata. So we write a template for the teiHeader that
    stops the text nodes underneath (=nested in) teiHeader from being printed into our
    html-->
    <xsl:template match="tei:teiHeader"/>

    <!-- to exclude the hyphenation-->
    <xsl:template match="tei:pc"/>
    
    <!-- excluding the line break when html is made so that there is no space where line breaks where-->
    <xsl:strip-space elements="*" />
    
</xsl:stylesheet>
