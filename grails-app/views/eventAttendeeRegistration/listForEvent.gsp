<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title>EventAttendeeRegistration List</title>
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
    <table>
      <thead>
      <th>&nbsp;</th>
      <th style="font-size: 1.5em; vertical-align: middle">Name</th>
      <th style="font-size: 1.5em; vertical-align: middle">Attended?</th>
      </thead>
      <tbody>
      <g:each in="${event.registrations}" status="i" var="eventAttendeeRegistrationInstance">
        <tr class="registrationRow ${(i % 2) == 0 ? 'odd' : 'even'}">

          <td style="width: 100px"><avatar:gravatar email="${eventAttendeeRegistrationInstance.user.email}" cssClass="showUserAvatar"/></td>

          <td style="font-size: 1.5em; vertical-align: middle">${eventAttendeeRegistrationInstance.user.firstName} ${eventAttendeeRegistrationInstance.user.lastName}</td>

          <td style="font-size: 1.5em; vertical-align: middle">
            <div id="registrationButton${eventAttendeeRegistrationInstance.id}">
              <g:if test="${eventAttendeeRegistrationInstance.attended}">
                <img src="${resource(dir:'images', file: 'ok.png')}"/>
              </g:if>
              <g:else>
                <input type="button" value="I'm here!" onclick="new Ajax.Updater('registrationButton${eventAttendeeRegistrationInstance.id}', '<g:createLink action="setAttendeeIsHere" id="${eventAttendeeRegistrationInstance.id}" />');"/>
              </g:else>
            </div>
          </td>

        </tr>
      </g:each>
      </tbody>
    </table>
  </div>

</div>
</body>
</html>
