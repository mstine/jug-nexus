<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title>EventAttendeeRegistration List</title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
  <span class="menuButton"><g:link class="create" action="create">New EventAttendeeRegistration</g:link></span>
</div>
<div class="post">
  <div class="title">
    <h2>Event Registrations</h2>
  </div>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="entry">
    <table>
      <thead>
      <tr>

        <g:sortableColumn property="id" title="Id"/>

        <th>Event</th>

        <th>User</th>

        <g:sortableColumn property="attended" title="Attended"/>

        <g:sortableColumn property="raffleWinner" title="Raffle Winner"/>

      </tr>
      </thead>
      <tbody>
      <g:each in="${eventAttendeeRegistrationInstanceList}" status="i" var="eventAttendeeRegistrationInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          <td><g:link action="show" id="${eventAttendeeRegistrationInstance.id}">${fieldValue(bean: eventAttendeeRegistrationInstance, field: 'id')}</g:link></td>

          <td>${fieldValue(bean: eventAttendeeRegistrationInstance, field: 'event')}</td>

          <td>${fieldValue(bean: eventAttendeeRegistrationInstance, field: 'user')}</td>

          <td>${fieldValue(bean: eventAttendeeRegistrationInstance, field: 'attended')}</td>

          <td>${fieldValue(bean: eventAttendeeRegistrationInstance, field: 'raffleWinner')}</td>

        </tr>
      </g:each>
      </tbody>
    </table>
  </div>
  <div class="paginateButtons">
    <g:paginate total="${eventAttendeeRegistrationInstanceTotal}"/>
  </div>
</div>
</body>
</html>
