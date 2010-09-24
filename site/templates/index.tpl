<?python from genshi import HTML ?>
<?python top = "./" ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:py="http://genshi.edgewall.org/">
    <head>
        <title>Frederik und Moritz Blog</title>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <meta name="date" py:if="c" content="${c[0].get_article().created.isoformat()}" />
        <meta name="robots" content="index, follow" />
        <meta http-equiv="content-language" content="de" />
        <link rel="stylesheet" type="text/css" href="${top}css/all-min.css" />
        <link rel="alternate" type="application/atom+xml" title="Frederik und Moritz Blog" href="${top}atom.xml" />
    </head>
    <body>
        <div class="header">
            <h1><a href="${top}">Frederik und Moritz Blog</a></h1>
	    <p class="claim">väterliche Betrachtungen</p>
            <ul py:def="navigation(node_list)" class="nav">
                <li class="prev">
                    <a py:if="node_list[-1].parent.prev" href="${top}${node_list[-1].parent.prev.get_deploy_path()}">${unicode(node_list[-1].parent.prev.get_date().strftime("%d. %B %Y"),"utf-8")}</a>
                    <span py:if="not node_list[-1].parent.prev" class="disabled">zurück</span>
                </li>
                <li class="next">
                    <span class="disabled">weiter</span>
                </li>
                <li class="up"><a href="${top}tags/">Tags</a></li>
            </ul>
            ${navigation(c)}
        </div>
        <div class="article" py:for="node in c">
            <?python article=node.get_article()?>
            <h2 class="title"><a href="${top}${node.get_deploy_path()}">${article.title}</a></h2>
            <div class="info">
                ${unicode(article.created.strftime("%A, %d. %B %Y"),"utf-8")}, Themen:
                <ul class="tags" py:if="article.tags">
                    <li py:for="i, tag in enumerate(article.tags)">
                        <a href="${top}tags/${tag.lower()}.html">${tag}</a><py:if test="i != len(article.tags)-1">,</py:if>
                    </li>
                </ul>
            </div>
            ${HTML(article.get_html_with_abs_links(node.parent.get_deploy_path()))}
        </div>
        <div class="footer">
            ${navigation(c)}
	    <p class="claim"><a href="mailto:mhellwig@in-ulm.de">Kontakt</a></p>
        </div>
    </body>
</html>
