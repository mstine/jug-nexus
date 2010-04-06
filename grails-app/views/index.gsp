<html>
<head>
  <title>Welcome!</title>
  <g:javascript library="prototype"/>

  <meta name="layout" content="main"/>
</head>
<body>
<h1>A group for Java developers from Memphis, TN, and the surrounding Mid-South</h1>
<g:if test="${flash.message}">
  <div class="message">${flash.message}</div>
</g:if>
<p style="text-align: center"><img src="${resource(dir: 'images', file: 'memphis0skyline-large.jpg')}"/></p>
<p>This site exists to support the Java User Group for the Memphis, TN and surrounding Mid-South (Western Tennessee, Eastern Arkansas, North Mississippi) area. Please <g:link controller="register">register</g:link> and enjoy the benefits of being a JUG member!</p>
<h2>Upcoming events:</h2>
<g:each var="event" in="${Event.findAllByOnHomePage(true,[sort:'startTime', order:'asc'])}">
  <div class="post">
    <div class="title">
      <h2><g:link controller="event" action="show" id="${event.id}">${event.title}</g:link></h2>
      %{--<p><g:formatDate format="MM.dd.yyyy" date="${event.startTime}"/></p>--}%
    </div>
    <div class="entry">
      <h2>
        <g:formatDate format="EEEE, MMMM dd, yyyy" date="${event.startTime}"/></h2>
      <div id="registration">
        <g:registerForEvent event="${event}"/>
      </div>
      <g:xwikiRender>${event.description}</g:xwikiRender></div>
    <div class="meta">
      <p class="credit">Posted on <g:formatDate format="MMMM dd, yyyy" date="${event.dateCreated}"/></p>
      <p class="links"><g:link controller="event" action="show" id="${event.id}" class="more">Read more</g:link></p>
    </div>
  </div>
</g:each>

</body>
</html>