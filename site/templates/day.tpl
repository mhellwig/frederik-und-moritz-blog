<?python from genshi import HTML ?>
<?python top = "../../../" ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:py="http://genshi.edgewall.org/">
    <head>
        <title>${unicode(c.get_date().strftime("%A, %d. %B %Y"),"utf-8")}</title>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <meta name="date" py:if="c.children" content="${c.children[-1].get_article().created.isoformat()}" />
        <meta name="robots" content="index, follow" />
        <meta http-equiv="content-language" content="de" />
        <link rel="stylesheet" type="text/css" href="${top}css/all-min.css" />
        <link py:if="c.next" rel="next" href="${top}${c.next.get_deploy_path()}" />
        <link py:if="c.prev" rel="prev" href="${top}${c.prev.get_deploy_path()}" />
        <link rel="start" href="${top}" />
    </head>
    <body>
        <div class="header">
            <h1><a href="${top}">Frederik und Moritz Blog</a></h1>
            <ul py:def="navigation(node)" class="nav">
                <li class="prev">
                    <a py:if="c.prev" href="${top}${c.prev.get_deploy_path()}">${unicode(c.prev.get_date().strftime("%d. %B %Y"),"utf-8")}</a>
                    <span py:if="not c.prev" class="disabled">zurück</span>
                </li>
                <li class="next">
                    <a py:if="c.next" href="${top}${c.next.get_deploy_path()}">${unicode(c.next.get_date().strftime("%d. %B %Y"),"utf-8")}</a>
                    <span py:if="not c.next" class="disabled">weiter</span>
                </li>
                <li class="up"><a href="${top}${c.parent.get_deploy_path()}">Nach oben</a><br/>
                    <a href="${top}${c.parent.parent.get_deploy_path()}">${c.parent.parent.get_base_name()}</a> / 
                    <a href="${top}${c.parent.get_deploy_path()}">${c.parent.get_base_name()}</a>
                </li>
            </ul>
            ${navigation(c)}
        </div>
        <div class="article" py:for="node in reversed(c.children)">
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
            ${HTML(article.get_html())}
        </div>
        <div class="footer">
            ${navigation(c)}
        </div>
    </body>
</html>
