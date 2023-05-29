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
                    <a href="diplomatic.html">Diplomatic Transcription</a> |
                    <a href="linguistic.html">Linguistic Transcription</a> |
                    <a href="documents.html">Documents</a> |
                </nav>
                
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <!-- Dropdown for chapters -->
                            <div class="btn-group">
                                <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="background-color:#561010; border:none;">
                                    Chapters
                                </button>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" data-target="#carouselExampleControls" data-slide-to="9" style="color: #561010;">Goethe.</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" data-target="#carouselExampleControls" data-slide-to="13" style="color: #561010;">Lotte.</a>
                                    <a class="dropdown-item" data-target="#carouselExampleControls" data-slide-to="19" style="color: #561010;">Werther.</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" data-target="#carouselExampleControls" data-slide-to="25" style="color: #561010;">Faust.</a>
                                    <a class="dropdown-item" data-target="#carouselExampleControls" data-slide-to="31" style="color: #561010;">Gretchen.</a>
                                    <a class="dropdown-item" data-target="#carouselExampleControls" data-slide-to="37" style="color: #561010;">Mephistopheles.</a>
                                    <a class="dropdown-item" data-target="#carouselExampleControls" data-slide-to="43" style="color: #561010;">Wagner.</a>
                                    <a class="dropdown-item" data-target="#carouselExampleControls" data-slide-to="49" style="color: #561010;">Helena.</a>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <!-- Button to change the view -->
                            <a href="diplomatic.html" class="btn btn-secondary btn active" role="button" aria-pressed="true" data-toggle="tooltip" data-placement="bottom" title="Change the view to continuing reading." style="background-color:#561010; border:none; float:right;">Change View</a>
                        </div>
                    </div>
                </div>
                
                <main id="book">
                    
                    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" data-interval="false">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= 'bc_f_o']">
                                                    <img class="img-full">
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
                                    <div class="col-sm">
                                        <article class="transcription">
                                            <xsl:for-each select="//tei:div[@n= 'bc_f_o']">
                                                <!--showing the folio number-->
                                                <p class="folio">
                                                    <xsl:value-of select="@n"/>
                                                </p>
                                                <xsl:apply-templates/>
                                            </xsl:for-each>
                                        </article>
                                    </div>
                                </div>
                            </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= 'bc_f_i']">
                                                    <img class="img-full">
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
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= 'bc_f_i']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '000r']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
      s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '000r']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '001r']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '001r']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '001v']">
                                                    <img class="img-full">
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
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '001v']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '002r']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '002r']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '002v']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '002v']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '003r']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '003r']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '003v']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '003v']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '004r']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '004r']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '004v']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '004v']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '005r']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '005r']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '005v']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '005v']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '039r']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '039r']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '039v']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '039v']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '040r']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '040r']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '040v']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '040v']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '041r']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '041r']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '041v']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '041v']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '042r']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '042r']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '042v']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '042v']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '043r']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '043r']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '043v']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '043v']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '044r']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '044r']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '044v']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '044v']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '099r']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '099r']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '099v']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '099v']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '100r']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '100r']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '100v']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '100v']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '101r']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '101r']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '101v']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '101v']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '102r']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '102r']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '102v']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '102v']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '103r']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '103r']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '103v']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '103v']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '104r']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '104r']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '104v']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '104v']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '105r']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '105r']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '105v']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '105v']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '106r']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '106r']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '106v']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '106v']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '107r']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '107r']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '107v']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '107v']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '108r']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '108r']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '108v']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '108v']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '109r']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '109r']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '109v']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '109v']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '110r']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '110r']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '110v']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '110v']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '111r']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '111r']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '111v']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '111v']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '112r']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '112r']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '112v']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '112v']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '113r']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '113r']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= '113v']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= '113v']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= 'es_b_r']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= 'es_b_r']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= 'es_b_v']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= 'es_b_v']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= 'bc_b_i']">
                                                    <img class="img-full">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="@facs"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="title">
                                                            s                                                      <xsl:value-of select="@n"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="@ana"/>
                                                        </xsl:attribute>
                                                    </img>                              
                                                </xsl:for-each>
                                            </article>  
                                        </div>
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= 'bc_b_i']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= 'bc_b_o']">
                                                    <img class="img-full">
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
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= 'bc_b_o']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="container">
                                    <div class="row">
                                        <!-- fill the first column with this page's image -->
                                        <div class="col-sm">
                                            <article>
                                                <xsl:for-each select="//tei:div[@n= 'bb']">
                                                    <img class="img-full">
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
                                        <div class="col-sm">
                                            <article class="transcription">
                                                <xsl:for-each select="//tei:div[@n= 'bb']">
                                                    <!--showing the folio number-->
                                                    <p class="folio">
                                                        <xsl:value-of select="@n"/>
                                                    </p>
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           <!--inner Ende-->
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="no"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="no"></span>
                            <span class="sr-only">Next</span>
                        </a>
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
            </body>
        </html>
    </xsl:template>

    <!-- by default all text nodes are printed out, unless something else is defined.
    We don't want to show the metadata. So we write a template for the teiHeader that
    stops the text nodes underneath (=nested in) teiHeader from being printed into our
    html-->
    <xsl:template match="tei:teiHeader"/>
    
    <!-- to show just the original text - the tei reg is exluded-->
    <xsl:template match="tei:reg"/>
    
    <!-- to show just the original text - the tei corr is exluded-->
    <xsl:template match="tei:corr"/>
    
    <!-- to not show the alternative text of the images always-->
    <xsl:template match="tei:figDesc"/>

    <!-- turn tei linebreaks (lb) into html linebreaks (br) -->
    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>
    <!-- not: in the previous template there is no <xsl:apply-templates/>. This is because there is nothing to
    process underneath (nested in) tei lb's. Therefore the XSLT processor does not need to look for templates to
    apply to the nodes nested within it.-->

    <!-- we turn the tei head element (headline) into an html h1 element-->
    <xsl:template match="tei:head">
        <h1>
            <xsl:apply-templates/>
        </h1>
    </xsl:template>
    
    <!-- we turn the tei head element (headline) with the type 'main' into an html h2 element-->
    <xsl:template match="tei:head[@type = 'main']">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    
    <!-- we turn the tei head element (headline) with the type 'sub' into an html h3 element-->
    <xsl:template match="tei:head[@type = 'sub']">
        <h3>
            <xsl:apply-templates/>
        </h3>
    </xsl:template>

    <!-- we turn the tei head element (headline) with the class 'library_stamp' into an html p element-->
    <xsl:template match="tei:head[@type = 'library_stamp']">
        <p class="library_stamp">
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <!-- transform tei paragraphs with the type 'caption' into html paragraphs with class "caption"-->
    <xsl:template match="tei:p[@rend = 'caption']">
        <p class="caption">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <!-- transform tei paragraphs with the class 'heading' into html h2-->
    <xsl:template match="tei:p[@rend = 'heading']">
        <h2 class="chapter_image">
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    
    <!-- transform tei paragraphs with the type 'publishing_info' into html p with class 'publishing_info-->
    <xsl:template match="tei:p[@rend = 'publishing_info']">
        <p class="publishing_info">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <!-- transform tei paragraphs with the type 'center' into html paragraphs with class "center"-->
    <xsl:template match="tei:p[@rend = 'center']">
        <p class="center">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <!-- transform tei paragraphs into html paragraphs -->
    <xsl:template match="tei:p">
        <p>
            <!-- apply matching templates for anything that was nested in tei:p -->
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <!-- transform tei byline into html p with class 'byline'-->
    <xsl:template match="tei:byline">
        <p class="byline">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <!-- transform tei p with the rend 'page_header into html p with class 'page_header'-->
    <xsl:template match="tei:p[@rend = 'page_header']">
        <p class="page_header">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <!-- transform tei note with the type 'library_shelfmark' into html p with class 'library_shelfmark'-->
    <xsl:template match="tei:note[@type = 'library_shelfmark']">
        <p class="library_shelfmark">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <!-- transform tei p with the rend 'barcode' into html p with class 'barcode'-->
    <xsl:template match="tei:p[@rend = 'barcode']">
        <p class="barcode">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    
    <!-- transform tei p with rend 'handwritten' handwritten html p with class 'handwritten' -->
    <xsl:template match="tei:p[@rend = 'handwritten']">
        <p class="handwritten">
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <!-- transform tei note with the type 'handwritten' into html span with class 'handwritten'-->
    <xsl:template match="tei:note[@type = 'handwritten']">
        <span class="handwritten">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <!-- transform tei del into html del -->
    <xsl:template match="tei:del">
        <del>
            <xsl:apply-templates/>
        </del>
    </xsl:template>

    <!-- transform tei add into html sup -->
    <xsl:template match="tei:add">
        <sup>
            <xsl:apply-templates/>
        </sup>
    </xsl:template>

    <!-- transform tei hi (highlighting) with the attribute @rend="u" into html u elements -->
    <!-- how to read the match? "For all tei:hi elements that have a rend attribute with the value "u", do the following" -->
    <xsl:template match="tei:hi[@rend = 'u']">
        <u>
            <xsl:apply-templates/>
        </u>
    </xsl:template>
    
    <!-- transform tei hi (highlighting) with the attribute @rend="initial" into html span elements with class 'initial' -->
    <xsl:template match="tei:hi[@rend = 'initial']">
        <span class="initial">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <!-- transform tei table into html table-->
    <xsl:template match="tei:table">
        <table>
            <xsl:apply-templates/>
        </table>
    </xsl:template>
    
    <!-- transform tei row into html tr-->
    <xsl:template match="tei:row">
        <tr>
            <xsl:apply-templates/>
        </tr>
    </xsl:template>
    
    <!-- transform tei cell with attribute 'first' into html th with class 'first' -->
    <xsl:template match="tei:cell[@rend = 'first']">
        <th class="first">
            <xsl:apply-templates/>
        </th>
    </xsl:template>
    
    <!-- transform tei cell into html th-->
    <xsl:template match="tei:cell">
        <th>
            <xsl:apply-templates/>
        </th>
    </xsl:template>
    
    <!-- transform tei quote with type 'long' into html span with class 'quote_long'-->
    <xsl:template match="tei:quote[@type= 'long']">
        <p class="quote_long">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <!-- transform tei speaker into html p with class 'speaker'-->
    <xsl:template match="tei:sp">
        <p class="speaker">
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <!-- transform tei p with rend 'speech' into html p with class 'speech'-->
    <xsl:template match="tei:p[@rend= 'speech']">
        <p class="speech">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <!-- transform the head in the loose page of Goethe in h1 and make the xml:id into an anchor-->
    <xsl:template match="tei:head[@xml:id= 'ch1']">
        <a>
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <h1><xsl:apply-templates/></h1>
        </a>
    </xsl:template>
    
    <!-- transform the xml:id in figure into an anchor and show the image on the first page of the chapter-->
    <xsl:template match="tei:figure">
        <a>
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <xsl:apply-templates/>
            <img class="img-in-text">
                <xsl:attribute name="src">
                    <xsl:value-of select="tei:graphic/@url"/>
                </xsl:attribute>
                <xsl:attribute name="title">
                    <xsl:value-of select="tei:figDesc"/>
                </xsl:attribute>
                <xsl:attribute name="alt">
                    <xsl:value-of select="tei:figDesc"/>
                </xsl:attribute>
            </img>
        </a>
    </xsl:template>
    
    <!-- transform links from table of images-->
    <xsl:template match="tei:ref">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="@target"/>
            </xsl:attribute>
            <xsl:attribute name="class">
                <p>inside_diplomatic</p>
            </xsl:attribute>
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    
    <!-- transform tei name with rend 'ref' into html a with class 'inside_diplomatic'-->
    <xsl:template match="tei:name[@ref]">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="@ref"/>
            </xsl:attribute>
            <xsl:attribute name="class">
                <p>inside_diplomatic</p>
            </xsl:attribute>
            <xsl:attribute name="target">
                <p>blank</p>
            </xsl:attribute>
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    
    <!-- transform tei placeName with rend 'ref' into html a with class 'inside_diplomatic'-->
    <xsl:template match="tei:placeName[@ref]">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="@ref"/>
            </xsl:attribute>
            <xsl:attribute name="class">
                <p>inside_diplomatic</p>
            </xsl:attribute>
            <xsl:attribute name="target">
                <p>blank</p>
            </xsl:attribute>
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    
    <!-- transform tei persName with rend 'ref' into html a with class 'inside_diplomatic'-->
    <xsl:template match="tei:persName[@ref]">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="@ref"/>
            </xsl:attribute>
            <xsl:attribute name="class">
                <p>inside_diplomatic</p>
            </xsl:attribute>
            <xsl:attribute name="target">
                <p>blank</p>
            </xsl:attribute>
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    
    <!--showing the images on the first pages of the chapters | further up with anchors-->
    <!--<xsl:template match="tei:figure">
        <img class="img-in-text">
            <xsl:attribute name="src">
                <xsl:value-of select="tei:graphic/@url"/>
            </xsl:attribute>
            <xsl:attribute name="title">
                <xsl:value-of select="tei:figDesc"/>
            </xsl:attribute>
            <xsl:attribute name="alt">
                <xsl:value-of select="tei:figDesc"/>
            </xsl:attribute>
        </img>
    </xsl:template>-->
    
    <!--showing smaller images on the pages-->
    <xsl:template match="tei:figure[@type= 'small']">
        <img class="img-small">
            <xsl:attribute name="src">
                <xsl:value-of select="tei:graphic/@url"/>
            </xsl:attribute>
            <xsl:attribute name="title">
                <xsl:value-of select="tei:figDesc"/>
            </xsl:attribute>
            <xsl:attribute name="alt">
                <xsl:value-of select="tei:figDesc"/>
            </xsl:attribute>
        </img>
    </xsl:template>

</xsl:stylesheet>


