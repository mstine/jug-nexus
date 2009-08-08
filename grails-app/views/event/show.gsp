<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title>Show Event</title>
  <rateable:resources/>
</head>
<body>
<g:ifAllGranted role="ROLE_ADMIN">
  <div class="nav">
    <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
    <span class="menuButton"><g:link class="list" action="list">Event List</g:link></span>
    <span class="menuButton"><g:link class="create" action="create">New Event</g:link></span>
  </div>
</g:ifAllGranted>
<g:if test="${flash.message}">
  <div class="message">${flash.message}</div>
</g:if>

<div class="post">
   
  <div class="title">
    <h2>${fieldValue(bean: eventInstance, field: 'title')}</h2>
  </div>
  <div class="rating">
    <rateable:ratings bean='${eventInstance}'/>
  </div>
  <div class="entry">
    <div class="dialog">
      <div class="eventTime">
        <h2>
          <g:formatDate format="EEEE, MMMM dd, yyyy" date="${eventInstance.startTime}"/><br/>
          <g:formatDate format="h:mm a" date="${eventInstance.startTime}"/>-<g:formatDate format="h:mm a" date="${eventInstance.endTime}"/><br/>
          ${fieldValue(bean: eventInstance, field: 'location')}</h2>
      </div>
      <p>${fieldValue(bean: eventInstance, field: 'description')}</p>
      <h2>Speakers:</h2>
      <ul class="speakerList">
        <g:each var="speaker" in="${eventInstance.speakers}">
          <li>
            <h2><g:link controller="acegiUser" action="show" id="${speaker.user.id}">${speaker.user.firstName} ${speaker.user.lastName}</g:link> <g:if test="${speaker.user.twitterNickname}"><a href="http://twitter.com/${speaker.user.twitterNickname}"><img class="twitterIcon" src="${resource(dir:'images', file:'twitter.png')}" alt="Follow me on Twitter!" title="Follow me on Twitter!"/></a></g:if></h2>
            <p><avatar:gravatar email="${speaker.user.email}" cssClass="speakerAvatar"/>${speaker.user.bio}</p>                                                                                                      
            <h2><g:link controller="eventSpeakerAssignment" action="show" id="${speaker.id}">Topic: ${speaker.topic}</g:link> <g:if test="${speaker.lightningTalk}"><img class="lightningTalk" src="${resource(dir:'images', file:'lightning_48.png')}" alt="Lightning Talk" title="Lightning Talk"></g:if></h2>
            <div class="topicAbstract"><g:xwikiRender>${speaker.topicAbstract}</g:xwikiRender></div>
          </li>
          <hr style="width:465px; margin-left: 15px; margin-bottom: 25px"/>
        </g:each>
      </ul>
    </div>
  </div>
  <g:ifAllGranted role="ROLE_ADMIN">
  <div class="meta">
    <table>
      <tbody>
      <tr class="prop">
        <td valign="top" class="name">Max Attendees:</td>

        <td valign="top" class="value">${fieldValue(bean: eventInstance, field: 'maxAttendees')}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Registration Open:</td>

        <td valign="top" class="value">${fieldValue(bean: eventInstance, field: 'registrationOpen')}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">On Home Page:</td>

        <td valign="top" class="value">${fieldValue(bean: eventInstance, field: 'onHomePage')}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Archived:</td>

        <td valign="top" class="value">${fieldValue(bean: eventInstance, field: 'archived')}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Registrations:</td>

        <td valign="top" style="text-align:left;" class="value">
          <ul>
            <g:each var="r" in="${eventInstance.registrations}">
              <li><g:link controller="eventAttendeeRegistration" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
            </g:each>
          </ul>
        </td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Speakers:</td>

        <td valign="top" style="text-align:left;" class="value">
          <ul>
            <g:each var="s" in="${eventInstance.speakers}">
              <li><g:link controller="eventSpeakerAssignment" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
            </g:each>
          </ul>
        </td>

      </tr>
      </tbody>
    </table>
  </div>
  </g:ifAllGranted>
  <div class="comments">
    <h2>Comments:</h2>
    <comments:render bean="${eventInstance}"/>
  </div>
  <g:ifAllGranted role="ROLE_ADMIN">
  <div id="entityEditDelete" class="buttons">
    <g:form>
      <input type="hidden" name="id" value="${eventInstance?.id}"/>
      <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
      <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
    </g:form>
  </div>
  </g:ifAllGranted>
</div>
</body>
</html>
