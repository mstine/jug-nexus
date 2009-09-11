<head>
  <meta name="layout" content="main"/>
  <title>Users</title>
</head>

<body>

<div class="nav">
  <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}">Home</a></span>
  <span class="menuButton"><g:link class="create" action="create">New User</g:link></span>
</div>

<div class="post">
  <div class="title">
    <h2>Users</h2>
  </div>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="entry">
    <table>
      <thead>
      <tr>
        <g:sortableColumn property="username" title="Username"/>
        <g:sortableColumn property="firstName" title="First Name"/>
        <g:sortableColumn property="lastName" title="Last Name"/>
        <g:sortableColumn property="location" title="Email"/>
      </tr>
      </thead>
      <tbody>
      <g:each in="${personList}" status="i" var="person">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          <td><g:link action="show" id="${person.id}">${fieldValue(bean: person, field: 'username')}</g:link></td>
          <td>${fieldValue(bean: person, field: 'firstName')}</td>

          <td>${fieldValue(bean: person, field: 'lastName')}</td>

          <td><a href="mailto:${fieldValue(bean: person, field: 'email')}">${fieldValue(bean: person, field: 'email')}</a></td>
        </tr>
      </g:each>
      </tbody>
    </table>
  </div>

  <div class="paginateButtons">
    <g:paginate total="${User.count()}"/>
  </div>

</div>
</body>
