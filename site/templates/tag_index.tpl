<?python from genshi import HTML ?>
<?python top = "../" ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:py="http://genshi.edgewall.org/">
    <head>
        <title>Tags</title>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <meta name="robots" content="index, follow" />
        <meta http-equiv="content-language" content="de" />
        <link rel="stylesheet" type="text/css" href="${top}css/all-min.css" />
        <link rel="start" href="${top}" />
    </head>
    <body>
        <div class="header">
            <h1><a href="${top}">HEADLINE</a></h1>
            <ul py:def="navigation()" class="nav">
                <li class="prev">
                    <span class="disabled">zurück</span>
                </li>
                <li class="next">
                    <span class="disabled">weiter</span>
                </li>
                <li class="up"><a href="${top}">Nach oben</a><br/><a href="${top}">Blog</a></li>
            </ul>
            ${navigation()}
        </div>
        <div class="article">
            <h2 class="title">Tags!</h2>
            <ul py:if="c">
                <li py:for="tag, articles in sorted(c.iteritems())">
                    <a href="../tags/${tag}.html">${tag}</a> (${len(articles)} Artikel)
                </li>
            </ul>
        </div>
        <div class="footer">
            ${navigation()}
        </div>
    </body>
</html>