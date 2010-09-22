<?python from genshi import HTML ?>
<?python top = "../" ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:py="http://genshi.edgewall.org/">
    <head>
        <title>Tag: ${c.tag}</title>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <meta name="robots" content="index, follow" />
        <meta http-equiv="content-language" content="de" />
        <link rel="stylesheet" type="text/css" href="${top}css/all-min.css" />
        <link rel="start" href="${top}" />
    </head>
    <body>
        <div class="header">
            <h1><a href="${top}">Frederik und Moritz Blog</a></h1>
            <ul py:def="navigation()" class="nav">
                <li class="prev">
                    <span class="disabled">zurück</span>
                </li>
                <li class="next">
                    <span class="disabled">weiter</span>
                </li>
                <li class="up"><a href="${top}tags/">Nach oben</a><br/><a href="${top}">Blog</a> / <a href="${top}tags/">Tags</a></li>
            </ul>
            ${navigation()}
        </div>
        <div class="article">
            <h2 class="title">Tag: ${c.tag} </h2>
            <ul py:if="c.dict">
                <li py:for="path in reversed(sorted(c.dict.keys()))">
                    <a href="../${path}">${c.dict[path]}</a>
                </li>
            </ul>
        </div>
        <div class="footer">
            ${navigation()}
        </div>
    </body>
</html>
