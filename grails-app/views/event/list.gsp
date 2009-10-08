<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title>Events</title>
</head>
<body>
<h1>Events</h1>
<g:ifAllGranted role="ROLE_ADMIN">
  <div class="nav">
    <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
    <span class="menuButton"><g:link class="create" action="create">New Event</g:link></span>
  </div>
</g:ifAllGranted>
<g:each var="event" in="${eventInstanceList}">
  <div class="post">
    <div class="title">
      <h2><g:link controller="event" action="show" id="${event.id}">${event.title}</g:link></h2>
      <p><g:formatDate format="MM.dd.yyyy" date="${event.startTime}"/></p>
    </div>
    <div class="entry"><g:xwikiRender>${event.description}</g:xwikiRender></div>
    <div class="meta">
      <p class="credit">Posted on <g:formatDate format="MMMM dd, yyyy" date="${event.dateCreated}"/></p>
      <p class="links"><g:link controller="event" action="show" id="${event.id}" class="more">Read more</g:link></p>
    </div>
  </div>
</g:each>
</body>
</html>
