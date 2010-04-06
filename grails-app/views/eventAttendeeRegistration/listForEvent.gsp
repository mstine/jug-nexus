<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title>Event Registrations for ${event.title}</title>
  <g:javascript library="prototype"/>
</head>
<body>

<div class="post">
  <div class="title">
    <h2>Event Registrations for ${event.title}</h2>
  </div>

  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="entry">
    <div class="secondaryMenu">
      <g:link controller="event" action="show" id="${event.id}">Back to Event</g:link>
    </div>
    <table>
      <thead>
      <th>&nbsp;</th>
      <th style="font-size: 1.5em; vertical-align: middle">Name</th>
      <g:ifAllGranted role="ROLE_ADMIN">
        <th style="font-size: 1.5em; vertical-align: middle">Attended?</th>
      </g:ifAllGranted>
      </thead>
      <tbody>
      <g:each in="${event.registrations}" status="i" var="eventAttendeeRegistrationInstance">
        <tr class="registrationRow ${(i % 2) == 0 ? 'odd' : 'even'}">

          <td style="width: 100px"><avatar:gravatar email="${eventAttendeeRegistrationInstance.user.email}" cssClass="showUserAvatar"/></td>

          <td style="font-size: 1.5em; vertical-align: middle">${eventAttendeeRegistrationInstance.user.firstName} ${eventAttendeeRegistrationInstance.user.lastName}</td>

          <g:ifAllGranted role="ROLE_ADMIN">
            <td style="font-size: 1.5em; vertical-align: middle">
              <div id="registrationButton${eventAttendeeRegistrationInstance.id}">
                <g:if test="${eventAttendeeRegistrationInstance.attended}">
                  <img src="${resource(dir: 'images', file: 'ok.png')}"/>
                </g:if>
                <g:else>
                  <input type="button" value="I'm here!" onclick="new Ajax.Updater('registrationButton${eventAttendeeRegistrationInstance.id}', '<g:createLink action="setAttendeeIsHere" id="${eventAttendeeRegistrationInstance.id}" />');"/>
                </g:else>
              </div>
            </td>
            <td style="font-size: 1.5em; vertical-align: middle">
              <g:link action="delete" params="${[userId:eventAttendeeRegistrationInstance.user.id, eventId:eventAttendeeRegistrationInstance.event.id]}"><img style="border: 0" src="${resource(dir: 'images', file: 'cancel.png')}"/></g:link>
            </td>
          </g:ifAllGranted>

        </tr>
      </g:each>
      </tbody>
    </table>
  </div>

</div>
</body>
</html>
