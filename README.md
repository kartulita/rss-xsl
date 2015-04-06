# XSL Stylesheet for ERR's RSS Podcast feeds

Now they will show nicely in browsers that don't have a default RSS stylesheet
(e.g. Chrome).

Simply add:

    <?xml-stylesheet type="text/xsl" href="style.xsl"?>

to your RSS feed, between the `<?xml ... ?>` directive and the `<rss ...>` root
element, ensuring that the value `style.xsl` points to wherever you saved the
XSL stylesheet in relation to the RSS feed's URL.
