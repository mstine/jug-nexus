<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title>Event List</title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
  <span class="menuButton"><g:link class="create" action="create">New Event</g:link></span>
</div>
<div class="post">
  <div class="title">
    <h2>Events</h2>
  </div>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="entry">
    <table>
      <thead>
      <tr>
        <g:sortableColumn property="startTime" title="Date"/>
        <g:sortableColumn property="title" title="Title"/>
        %{--<g:sortableColumn property="onHomePage" title="Home?"/>--}%
        %{--<g:sortableColumn property="archived" title="Archived?"/>--}%
        <g:sortableColumn property="registrationOpen" title="Open?"/>
        <g:sortableColumn property="maxAttendees" title="Max"/>
        <th>Registered</th>
      </tr>
      </thead>
      <tbody>
      <g:each in="${eventInstanceList}" status="i" var="eventInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
          <td><g:link action="show" id="${eventInstance.id}"><g:formatDate format="MM/dd/yyyy" date="${eventInstance.startTime}"/></g:link></td>
          <td>${fieldValue(bean: eventInstance, field: 'title')}</td>
          %{--<td>${fieldValue(bean: eventInstance, field: 'onHomePage')}</td>--}%
          %{--<td>${fieldValue(bean: eventInstance, field: 'archived')}</td>--}%
          <td>${fieldValue(bean: eventInstance, field: 'registrationOpen')}</td>          
          <td>${fieldValue(bean: eventInstance, field: 'maxAttendees')}</td>
          <td>${eventInstance.registrations.size()}</td>
        </tr>
      </g:each>
      </tbody>
    </table>
  </div>
  <div class="paginateButtons">
    <g:paginate total="${eventInstanceTotal}"/>
  </div>
</div>
</body>
</html>
