

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'sponsor.label', default:'Sponsor')}" />
        <title>${entityName} List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New ${entityName}</g:link></span>
        </div>
        <div class="body">
            <h1>${entityName} List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="${message(code:'sponsor.id.label', default:'Id')}" />
                        
                   	        <g:sortableColumn property="name" title="${message(code:'sponsor.name.label', default:'Name')}" />
                        
                   	        <g:sortableColumn property="url" title="${message(code:'sponsor.url.label', default:'Url')}" />
                        
                   	        <th><g:message code="sponsor.sponsorGroup.label" default="Sponsor Group" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${sponsorInstanceList}" status="i" var="sponsorInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${sponsorInstance.id}">${fieldValue(bean:sponsorInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:sponsorInstance, field:'name')}</td>
                        
                            <td>${fieldValue(bean:sponsorInstance, field:'url')}</td>
                        
                            <td>${fieldValue(bean:sponsorInstance, field:'sponsorGroup')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${sponsorInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
