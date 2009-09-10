<div class="post">
  <div class="title">
    <h2>${fieldValue(bean: person, field: 'firstName')} ${fieldValue(bean: person, field: 'lastName')} <g:if test="${person.twitterNickname}"><a href="http://twitter.com/${person.twitterNickname}"><img class="twitterIcon" src="${resource(dir: 'images', file: 'twitter.png')}" alt="Follow me on Twitter!" title="Follow me on Twitter!"/></a></g:if></h2>
  </div>

  <div class="entry">
    <div class="userBio">
      <avatar:gravatar email="${person.email}" cssClass="showUserAvatar"/><g:xwikiRender>${fieldValue(bean: person, field: 'bio')}</g:xwikiRender>
    </div>

    <ul class="userInfo">
      <g:if test="${person.location}"><li><strong>Location:</strong> ${fieldValue(bean: person, field: 'location')}</li></g:if>
      <g:if test="${person.company}"><li><strong>Company:</strong> ${fieldValue(bean: person, field: 'company')}</li></g:if>
      <g:if test="${person.showEmail}"><li><strong>Email:</strong> <a href="mailto:${fieldValue(bean: person, field: 'email')}">${fieldValue(bean: person, field: 'email')}</a></li></g:if>
      <g:if test="${person.website}"><li><strong>Website/Blog:</strong> <a href="${fieldValue(bean: person, field: 'website')}">${fieldValue(bean: person, field: 'website')}</a></li></g:if>
    </ul>

    <g:if test="${person.eventsSpeaking}">
      <h2>Topics:</h2>
      <ul class="speakerTopics">
        <g:each var="topic" in="${person.eventsSpeaking}">
          <li><g:link controller="eventSpeakerAssignment" action="show" id="${topic.id}">${topic.topic}</g:link> <g:if test="${topic.lightningTalk}"><img src="${resource(dir: 'images', file: 'lightning_16.png')}" alt="Lightning Talk" title="Lightning Talk" class="lightningTalk"></g:if></li>
        </g:each>
      </ul>
    </g:if>

    <g:if test="${person.blogFeed}">
      <h2>Blog Feed:</h2>

      <g:renderBlogFeed url="${person.blogFeed}"/>
    </g:if>
  </div>
</div>