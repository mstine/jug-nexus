<head>
  <meta name="layout" content="main"/>
  <title>Show User</title>
</head>

<body>
<g:ifAllGranted role="ROLE_ADMIN">
  <div class="nav">
    <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}">Home</a></span>
    <span class="menuButton"><g:link class="list" action="list">User List</g:link></span>
    <span class="menuButton"><g:link class="create" action="create">New User</g:link></span>
  </div>
</g:ifAllGranted>
<g:if test="${flash.message}">
  <div class="message">${flash.message}</div>
</g:if>
<div class="post">
  <div class="title">
    <h2>${fieldValue(bean: person, field: 'firstName')} ${fieldValue(bean: person, field: 'lastName')} <g:if test="${person.twitterNickname}"><a href="http://twitter.com/${person.twitterNickname}"><img class="twitterIcon" src="${resource(dir: 'images', file: 'twitter.png')}" alt="Follow me on Twitter!" title="Follow me on Twitter!"/></a></g:if></h2>
  </div>

  <div class="entry">

    <p>
      <avatar:gravatar email="${person.email}" cssClass="showUserAvatar"/>${fieldValue(bean: person, field: 'bio')}
    </p>

    <ul class="userInfo">
      <g:if test="${person.location}"><li><strong>Location:</strong> ${fieldValue(bean: person, field: 'location')}</li></g:if>
      <g:if test="${person.company}"><li><strong>Company:</strong> ${fieldValue(bean: person, field: 'company')}</li></g:if>
      <g:if test="${person.email}"><li><strong>Email:</strong> <a href="mailto:${fieldValue(bean: person, field: 'email')}">${fieldValue(bean: person, field: 'email')}</a></li></g:if>
      <g:if test="${person.website}"><li><strong>Website/Blog:</strong> <a href="${fieldValue(bean: person, field: 'website')}">${fieldValue(bean: person, field: 'website')}</a></li></g:if>
    </ul>

    <g:if test="${person.eventsSpeaking}">
    <h2>Topics:</h2>
      <ul class="speakerTopics">
      <g:each var="topic" in="${person.eventsSpeaking}">
        <li><g:link controller="eventSpeakerAssignment" action="show" id="${topic.id}">${topic.topic}</g:link> <g:if test="${topic.lightningTalk}"><img src="${resource(dir:'images', file:'lightning_16.png')}" alt="Lightning Talk" title="Lightning Talk" class="lightningTalk"></g:if></li>
      </g:each>
      </ul>
    </g:if>

    <g:if test="${person.blogFeed}">
      <h2>Blog Feed:</h2>
      
      <g:renderBlogFeed url="${person.blogFeed}"/>
    </g:if>
    <g:ifAllGranted role="ROLE_ADMIN">
    <table>
      <tbody>

      

      <tr class="prop">
        <td valign="top" class="name">Why I Want To Join:</td>

        <td valign="top" class="value">${fieldValue(bean: person, field: 'whyIWantToJoin')}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Events Attending:</td>

        <td valign="top" style="text-align:left;" class="value">
          <ul>
            <g:each var="e" in="${person.eventsAttending}">
              <li><g:link controller="eventAttendeeRegistration" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
            </g:each>
          </ul>
        </td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Events Speaking:</td>

        <td valign="top" style="text-align:left;" class="value">
          <ul>
            <g:each var="e" in="${person.eventsSpeaking}">
              <li><g:link controller="eventSpeakerAssignment" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
            </g:each>
          </ul>
        </td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Moderated:</td>

        <td valign="top" class="value">${fieldValue(bean: person, field: 'moderated')}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Roles:</td>
        <td valign="top" class="value">
          <ul>
            <g:each in="${roleNames}" var='name'>
              <li>${name}</li>
            </g:each>
          </ul>
        </td>
      </tr>

      </tbody>
    </table>

      </g:ifAllGranted>
    </div>
  <g:ifAllGranted role="ROLE_ADMIN">
  <div class="buttons">
    <g:form>
      <input type="hidden" name="id" value="${person.id}"/>
      <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
      <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
    </g:form>
  </div>
  </g:ifAllGranted>
</div>
</body>
