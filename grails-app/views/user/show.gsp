<head>
  <meta name="layout" content="main"/>
  <title>${fieldValue(bean: person, field: 'firstName')} ${fieldValue(bean: person, field: 'lastName')}</title>
</head>

<body>
<g:ifAllGranted role="ROLE_ADMIN">
  <div class="nav">
    <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}">Home</a></span>
    <span class="menuButton"><g:link class="list" action="list">User List</g:link></span>
    <span class="menuButton"><g:link class="create" action="create">New User</g:link></span>
  </div>
</g:ifAllGranted>
<g:if test="${flash.message}">
  <div class="message">${flash.message}</div>
</g:if>
<g:render template="/userProfile" model="${[person: person]}"/>
<g:ifAllGranted role="ROLE_ADMIN">
  Last Password Reset Token: ${person.lastPasswordResetToken}
  <div class="buttons">
    <g:form>
      <input type="hidden" name="id" value="${person.id}"/>
      <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
      <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
    </g:form>
  </div>
</g:ifAllGranted>
</body>
