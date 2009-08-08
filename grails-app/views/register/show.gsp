<head>
  <meta name="layout" content="main"/>
  <title>User Profile</title>
</head>

<body>
<div class="nav">
  <span class="menuButton"><a class='home' href="${createLinkTo(dir: '')}">Home</a></span>
</div>

<div class="body">
  <h1>User Profile</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="dialog">
    <table>
      <tbody>

      <tr class="prop">
        <td valign="top" class="name">Username:</td>
        <td valign="top" class="value">${person.username?.encodeAsHTML()}</td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name">First Name:</td>

        <td valign="top" class="value">${fieldValue(bean: person, field: 'firstName')}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Last Name:</td>

        <td valign="top" class="value">${fieldValue(bean: person, field: 'lastName')}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Location:</td>

        <td valign="top" class="value">${fieldValue(bean: person, field: 'location')}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Company:</td>

        <td valign="top" class="value">${fieldValue(bean: person, field: 'company')}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Email:</td>

        <td valign="top" class="value">${fieldValue(bean: person, field: 'email')}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Bio:</td>

        <td valign="top" class="value">${fieldValue(bean: person, field: 'bio')}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Website:</td>

        <td valign="top" class="value">${fieldValue(bean: person, field: 'website')}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Blog Feed:</td>

        <td valign="top" class="value">${fieldValue(bean: person, field: 'blogFeed')}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Twitter Nickname:</td>

        <td valign="top" class="value">${fieldValue(bean: person, field: 'twitterNickname')}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Roles:</td>
        <td valign="top" class="value">
          <ul>
            <g:each var='authority' in="${person.authorities}">
              <li>${authority.authority}</li>
            </g:each>
          </ul>
        </td>
      </tr>

      </tbody>
    </table>
  </div>

  <div class="buttons">
    <g:form>
      <input type="hidden" name="id" value="${person.id}"/>
      <span class="button"><g:actionSubmit class='edit' value="Edit"/></span>
    </g:form>
  </div>

</div>
</body>
