<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code:'sponsor.label', default:'Sponsor')}"/>
  <title>Show ${entityName}</title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
  <span class="menuButton"><g:link class="list" action="list">${entityName} List</g:link></span>
  <span class="menuButton"><g:link class="create" action="create">New ${entityName}</g:link></span>
</div>
<div class="body">
  <h1>Show ${entityName}</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="dialog">
    <table>
      <tbody>

      <tr class="prop">
        <td valign="top" class="name">
          <g:message code="sponsor.id.label" default="Id"/>:
        </td>

        <td valign="top" class="value">${fieldValue(bean: sponsorInstance, field: 'id')}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">
          <g:message code="sponsor.name.label" default="Name"/>:
        </td>

        <td valign="top" class="value">${fieldValue(bean: sponsorInstance, field: 'name')}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">
          <g:message code="sponsor.url.label" default="Url"/>:
        </td>

        <td valign="top" class="value">${fieldValue(bean: sponsorInstance, field: 'url')}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">
          <g:message code="sponsor.sponsorGroup.label" default="Sponsor Group"/>:
        </td>

        <td valign="top" class="value"><g:link controller="sponsorGroup" action="show" id="${sponsorInstance?.sponsorGroup?.id}">${sponsorInstance?.sponsorGroup?.encodeAsHTML()}</g:link></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">
          <g:message code="sponsor.logo" default="Logo"/>:
        </td>

        <td valign="top" class="value">
          <g:if test="${sponsorInstance.logo}">
            <img src="${createLink(controller:'download',id:sponsorInstance.logo.id)}"/>
          </g:if>
          <g:else>
            No logo uploaded!
          </g:else>
        </td>

      </tr>

      </tbody>
    </table>
  </div>
  <div class="uploadLogo">
    <div class="slideUpload">
      <h2>Upload logo:</h2>
      <fileuploader:form upload="logos"
              successAction="updateLogo"
              successController="sponsor"
              successId="${sponsorInstance.id}"
              errorAction="show"
              errorController="sponsor"
              errorId="${sponsorInstance.id}"/>
    </div>
  </div>
  <div class="buttons">
    <g:form>
      <input type="hidden" name="id" value="${sponsorInstance?.id}"/>
      <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
      <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
    </g:form>
  </div>
</div>
</body>
</html>
