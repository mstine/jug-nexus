<g:each var="user" in="${users}">
  <div class="post">
    <div class="title">
      <h2><g:link controller="user" action="show" id="${user.id}">${user.firstName} ${user.lastName}</g:link></h2>
    </div>
    <div class="entry"><avatar:gravatar email="${user.email}" cssClass="showUserAvatar"/>${user.bio}</div>
    <div class="meta">
      <p class="links"><g:link controller="user" action="show" id="${user.id}" class="more">Read more</g:link></p>
    </div>
  </div>
</g:each>