<head>
  <meta name="layout" content="main"/>
  <title>Edit User</title>
</head>

<body>

<div class="nav">
  <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}">Home</a></span>
  <span class="menuButton"><g:link class="list" action="list">User List</g:link></span>
  <span class="menuButton"><g:link class="create" action="create">New User</g:link></span>
</div>

<div class="body">
  <h1>Edit User</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${person}">
    <div class="errors">
      <g:renderErrors bean="${person}" as="list"/>
    </div>
  </g:hasErrors>

  <div class="prop">
    <span class="name">ID:</span>
    <span class="value">${person.id}</span>
  </div>

  <g:form>
    <input type="hidden" name="id" value="${person.id}"/>
    <input type="hidden" name="version" value="${person.version}"/>
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name"><label for="username">Login Name:</label></td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'username', 'errors')}">
            <input type="text" id="username" name="username" value="${person.username?.encodeAsHTML()}"/>
          </td>
        </tr>

        <tr class='prop'>
          <td valign='top' class='name'><label for='passwd'>Password:</label></td>
          <td valign='top' class='value ${hasErrors(bean: person, field: 'passwd', 'errors')}'>
            <input type="password" name='passwd' value=""/>
          </td>
        </tr>

        <tr class='prop'>
          <td valign='top' class='name'><label for='repasswd'>Confirm Password:</label></td>
          <td valign='top' class='value ${hasErrors(bean: person, field: 'passwd', 'errors')}'>
            <input type="password" name='repasswd'/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="firstName">First Name:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'firstName', 'errors')}">
            <input type="text" id="firstName" name="firstName" value="${fieldValue(bean: person, field: 'firstName')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="lastName">Last Name:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'lastName', 'errors')}">
            <input type="text" id="lastName" name="lastName" value="${fieldValue(bean: person, field: 'lastName')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="location">Location:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'location', 'errors')}">
            <input type="text" id="location" name="location" value="${fieldValue(bean: person, field: 'location')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="company">Company:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'company', 'errors')}">
            <input type="text" id="company" name="company" value="${fieldValue(bean: person, field: 'company')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="email">Email:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'email', 'errors')}">
            <input type="text" id="email" name="email" value="${fieldValue(bean: person, field: 'email')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="bio">Bio:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'bio', 'errors')}">
            <textarea rows="5" cols="40" name="bio">${fieldValue(bean: person, field: 'bio')}</textarea>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="website">Website:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'website', 'errors')}">
            <input type="text" id="website" name="website" value="${fieldValue(bean: person, field: 'website')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="blogFeed">Blog Feed:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'blogFeed', 'errors')}">
            <input type="text" id="blogFeed" name="blogFeed" value="${fieldValue(bean: person, field: 'blogFeed')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="twitterNickname">Twitter Nickname:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'twitterNickname', 'errors')}">
            <input type="text" id="twitterNickname" name="twitterNickname" value="${fieldValue(bean: person, field: 'twitterNickname')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="whyIWantToJoin">Why IW ant To Join:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'whyIWantToJoin', 'errors')}">
            <textarea rows="5" cols="40" name="whyIWantToJoin">${fieldValue(bean: person, field: 'whyIWantToJoin')}</textarea>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="eventsAttending">Events Attending:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'eventsAttending', 'errors')}">

            <ul>
              <g:each var="e" in="${person?.eventsAttending?}">
                <li><g:link controller="eventAttendeeRegistration" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
              </g:each>
            </ul>
            <g:link controller="eventAttendeeRegistration" params="['user.id':person?.id]" action="create">Add EventAttendeeRegistration</g:link>

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="eventsSpeaking">Events Speaking:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'eventsSpeaking', 'errors')}">

            <ul>
              <g:each var="e" in="${person?.eventsSpeaking?}">
                <li><g:link controller="eventSpeakerAssignment" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
              </g:each>
            </ul>
            <g:link controller="eventSpeakerAssignment" params="['user.id':person?.id]" action="create">Add EventSpeakerAssignment</g:link>

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="moderated">Moderated:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'moderated', 'errors')}">
            <g:checkBox name="moderated" value="${person?.moderated}"></g:checkBox>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name"><label for="authorities">Roles:</label></td>
          <td valign="top" class="value ${hasErrors(bean: person, field: 'authorities', 'errors')}">
            <ul>
              <g:each var="entry" in="${roleMap}">
                <li>${entry.key.authority.encodeAsHTML()}
                <g:checkBox name="${entry.key.authority}" value="${entry.value}"/>
                </li>
              </g:each>
            </ul>
          </td>
        </tr>

        </tbody>
      </table>
    </div>

    <div class="buttons">
      <span class="button"><g:actionSubmit class="save" value="Update"/></span>
      <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
    </div>

  </g:form>

</div>
</body>
