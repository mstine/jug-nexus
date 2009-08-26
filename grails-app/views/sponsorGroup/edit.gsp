

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'sponsorGroup.label', default:'SponsorGroup')}" />
        <title>Edit ${entityName}</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">${entityName} List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New ${entityName}</g:link></span>
        </div>
        <div class="body">
            <h1>Edit ${entityName}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${sponsorGroupInstance}">
            <div class="errors">
                <g:renderErrors bean="${sponsorGroupInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${sponsorGroupInstance?.id}" />
                <input type="hidden" name="version" value="${sponsorGroupInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name">
                                    <g:message code="sponsorGroup.name.label" default="Name" />
                                  </label>

                                </td>
                                <td valign="top" class="value ${hasErrors(bean:sponsorGroupInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:sponsorGroupInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="sponsors">
                                    <g:message code="sponsorGroup.sponsors.label" default="Sponsors" />
                                  </label>

                                </td>
                                <td valign="top" class="value ${hasErrors(bean:sponsorGroupInstance,field:'sponsors','errors')}">
                                    
<ul>
<g:each var="s" in="${sponsorGroupInstance?.sponsors?}">
    <li><g:link controller="sponsor" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="sponsor" params="['sponsorGroup.id':sponsorGroupInstance?.id]" action="create">Add Sponsor</g:link>

                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
