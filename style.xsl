<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="no" omit-xml-declaration="yes"/>
	<xsl:template match="channel">
		<html>
			<head>
				<meta charset="utf-8"/>
				<title><xsl:value-of select="title"/></title>
				<style>
				<![CDATA[
					html {
						width: 100%;
						margin: 0;
						padding: 0;
						overflow-x: hidden;
					}
					body {
						font-size: 10pt;
						font-family: sans-serif;
						background: #eee;
						margin: 0;
						padding: 20px;
					}
					.channel {
						margin: 20px;
						border: 1px solid #aaa;
						background: #fff;
						padding: 20px;
					}
					.header {
						font-size: 12pt;
					}
					.header .title {
						padding-bottom: 5px;
						margin-bottom: 5px;
						display: block;
						border-bottom: 1px solid #ccc;
						font-size: 18pt;
					}
					.header .description {
						color: #666;
						margin-top: 0;
					}
					.title {
						font-size: 14pt;
						font-weight: bold;
					}
					.description {
						font-style: italic;
					}
					.header {
					}
					.channel>* {
						display: block;
					}
					.channel>*:before,
					.channel>*:after {
						content: ' ';
						line-height: 0;
						font-size: 0px;
						clear: both;
						visibility: hidden;
						display: table;
					}
					.header .image {
						display: block;
						float: right;
						margin: 0 0 10px 0;
					}
					.header .copyright {
						font-size: 10pt;
						color: #888;
					}
					.item {
						margin-top: 20px;
						margin-bottom: 20px;
						border-top: 1px solid #ccc;
					}
					.item .title {
						font-size: 10pt;
					}
					.pub-date {
						display: none;
					}
					.category {
						display: none;
					}
					.media {
						border: 1px solid #888;
						background: #eee;
						margin: 20px 0;
						padding: 10px;
					}
					.media-item {
						list-style-type: none;
					}
				]]>
				</style>
			</head>
			<body>
				<section class="channel">
					<header class="header">
						<xsl:apply-templates select="image"/>
						<xsl:apply-templates select="title"/>
						<xsl:apply-templates select="description"/>
						<xsl:apply-templates select="category"/>
						<xsl:apply-templates select="pubDate"/>
						<p class="copyright">&#x00a9; <xsl:value-of select="copyright"/></p>
					</header>
					<xsl:apply-templates select="item"/>
				</section>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="image">
		<span class="image">
			<a>
				<xsl:attribute name="title">
					<xsl:value-of select="title"/>
				</xsl:attribute>
				<xsl:attribute name="href">
					<xsl:value-of select="link"/>
				</xsl:attribute>
				<img>
					<xsl:attribute name="src">
						<xsl:value-of select="url"/>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="title"/>
					</xsl:attribute>
				</img>
			</a>
		</span>
	</xsl:template>
	<xsl:template match="title">
		<h1 class="title"><xsl:value-of select="text()"/></h1>
	</xsl:template>
	<xsl:template match="description">
		<p class="description"><xsl:value-of select="text()"/></p>
	</xsl:template>
	<xsl:template match="category">
		<p class="category"><xsl:value-of select="text()"/></p>
	</xsl:template>
	<xsl:template match="pubDate">
		<p class="pub-date"><xsl:value-of select="text()"/></p>
	</xsl:template>
	<xsl:template match="item">
		<article class="item">
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="link"/>
				</xsl:attribute>
				<xsl:apply-templates select="title"/>
			</a>
			<xsl:apply-templates select="description"/>
			<xsl:apply-templates select="category"/>
			<xsl:apply-templates select="pubDate"/>
			<ul class="media">
				<xsl:for-each select="enclosure">
					<li class="media-item">
						<a>
							<xsl:attribute name="href">
								<xsl:value-of select="@url"/>
							</xsl:attribute>
							<xsl:value-of select="@url"/>
						</a>
						&#x00a0;(<xsl:value-of select='format-number(number(@length div "1024000"),"0.0")'/>MB)
					</li>
				</xsl:for-each>
			</ul>
		</article>
	</xsl:template>
</xsl:stylesheet>
