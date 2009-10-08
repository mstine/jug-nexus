<html>
<head>
  <title>Speakers</title>
  <meta name="layout" content="main"/>
</head>
<body>
<h1>Speakers</h1>
<g:each var="user" in="${users}">
  <div class="post">
    <div class="title">
      <h2><g:link controller="user" action="show" id="${user.id}">${user.firstName} ${user.lastName}</g:link> <g:if test="${user.twitterNickname}"><a href="http://twitter.com/${user.twitterNickname}"><img class="twitterIcon" src="${resource(dir: 'images', file: 'twitter.png')}" alt="Follow me on Twitter!" title="Follow me on Twitter!"/></a></g:if></h2>
    </div>
    <div class="entry"><avatar:gravatar email="${user.email}" cssClass="showUserAvatar"/><g:xwikiRender>${user.bio}</g:xwikiRender></div>
    <div class="meta">
      <p class="links"><g:link controller="user" action="show" id="${user.id}" class="more">Read more</g:link></p>
    </div>
  </div>
</g:each>
</body>
</html>                      