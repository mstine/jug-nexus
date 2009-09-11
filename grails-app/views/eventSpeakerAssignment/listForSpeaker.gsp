<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title>Topics for ${user.firstName} ${user.lastName}</title>
</head>
<body>
<h1>Topics for ${user.firstName} ${user.lastName}</h1>
<g:ifAllGranted role="ROLE_ADMIN">
  <div class="nav">
    <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
    <span class="menuButton"><g:link class="create" action="create">New Topic</g:link></span>
  </div>
</g:ifAllGranted>
<g:each var="topic" in="${eventSpeakerAssignmentInstanceList}">
  <div class="post">
    <div class="title">
      <h2><g:link controller="eventSpeakerAssignment" action="show" id="${topic.id}">${topic.topic}</g:link></h2>
    </div>
    <div class="entry">${topic.topicAbstract}</div>
    <div class="meta">
      <p class="links"><g:link controller="eventSpeakerAssignment" action="show" id="${topic.id}" class="more">Read more</g:link></p>
    </div>
  </div>
</g:each>
</body>
</html>
