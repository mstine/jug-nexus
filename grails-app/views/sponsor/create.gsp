

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code:'sponsor.label', default:'Sponsor')}" />
        <title>Create ${entityName}</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">${entityName} List</g:link></span>
        </div>
        <div class="body">
            <h1>Create ${entityName}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${sponsorInstance}">
            <div class="errors">
                <g:renderErrors bean="${sponsorInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">
                                      <g:message code="sponsor.name.label" default="Name" />
                                    </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:sponsorInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:sponsorInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="url">
                                      <g:message code="sponsor.url.label" default="Url" />
                                    </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:sponsorInstance,field:'url','errors')}">
                                    <input type="text" id="url" name="url" value="${fieldValue(bean:sponsorInstance,field:'url')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sponsorGroup">
                                      <g:message code="sponsor.sponsorGroup.label" default="Sponsor Group" />
                                    </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:sponsorInstance,field:'sponsorGroup','errors')}">
                                    <g:select optionKey="id" from="${SponsorGroup.list()}" name="sponsorGroup.id" value="${sponsorInstance?.sponsorGroup?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
