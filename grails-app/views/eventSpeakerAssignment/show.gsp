<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title>${eventSpeakerAssignmentInstance.topic}</title>
  <rateable:resources/>
</head>
<body>
<g:ifAllGranted role="ROLE_ADMIN">
  <div class="nav">
    <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
    <span class="menuButton"><g:link class="list" action="list">EventSpeakerAssignment List</g:link></span>
    <span class="menuButton"><g:link class="create" action="create">New EventSpeakerAssignment</g:link></span>
  </div>
</g:ifAllGranted>
<div class="post">
  <div class="title">
    <h2>${fieldValue(bean: eventSpeakerAssignmentInstance, field: 'topic')} <g:if test="${eventSpeakerAssignmentInstance.lightningTalk}"><img class="lightningTalk" src="${resource(dir: 'images', file: 'lightning_32.png')}" alt="Lightning Talk" title="Lightning Talk"></g:if></h2>
  </div>
  <div class="rating">
    <rateable:ratings bean='${eventSpeakerAssignmentInstance}'/>
  </div>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="entry">
    <p>
    <ul class="speakerTopics">
      <li><strong>Speaker:</strong> <g:link controller="user" action="show" id="${eventSpeakerAssignmentInstance?.user?.id}">${eventSpeakerAssignmentInstance?.user?.encodeAsHTML()}</g:link></li>
      <li><strong>Event:</strong> <g:link controller="event" action="show" id="${eventSpeakerAssignmentInstance?.event?.id}">${eventSpeakerAssignmentInstance?.event?.encodeAsHTML()}</g:link></li>
    </ul>
  </p>
    <div class="topicAbstract"><g:xwikiRender>${fieldValue(bean: eventSpeakerAssignmentInstance, field: 'topicAbstract')}</g:xwikiRender></div>

  </div>

  <g:if test="${eventSpeakerAssignmentInstance.files}">
    <div class="slides">
      <h2>Files available:</h2>
      <table>
        <thead>
        <tr>
          <th>Name</th>
          <th>Size</th>
          <th>Date Uploaded</th>
          <th>Downloads</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${eventSpeakerAssignmentInstance.files}" var="file">
          <tr>
            <td><fileuploader:download id="${file.id}" errorAction="show" errorController="eventSpeakerAssignment">${file.name}</fileuploader:download></td>
            <td><fileuploader:prettysize size="${file.size}"/></td>
            <td><g:formatDate format="MM/dd/yyyy" date="${file.dateUploaded}"/></td>
            <td>${file.downloads}</td>
          </tr>
        </g:each>
        </tbody>
      </table>
    </div>
  </g:if>

  <g:ifAnyGranted role="ROLE_ADMIN,ROLE_SPEAKER">
    <g:if test="${eventSpeakerAssignmentInstance.user == authenticatedUser}">
      <div class="slideUpload">
        <h2>Add a file:</h2>
        <fileuploader:form upload="slides"
                successAction="addFile"
                successController="eventSpeakerAssignment"
                successId="${eventSpeakerAssignmentInstance.id}"
                errorAction="show"
                errorController="eventSpeakerAssignment"
                errorId="${eventSpeakerAssignmentInstance.id}"/>
      </div>
    </g:if>
    <g:else>
      <g:ifAllGranted role="ROLE_ADMIN">
        <div class="slideUpload">
          <h2>Add a file:</h2>
          <fileuploader:form upload="slides"
                  successAction="addFile"
                  successController="eventSpeakerAssignment"
                  successId="${eventSpeakerAssignmentInstance.id}"
                  errorAction="show"
                  errorController="eventSpeakerAssignment"
                  errorId="${eventSpeakerAssignmentInstance.id}"/>
        </div>
      </g:ifAllGranted>
    </g:else>
  </g:ifAnyGranted>

  <div class="comments">
    <h2>Comments:</h2>
    <comments:render bean="${eventSpeakerAssignmentInstance}"/>
  </div>
  <g:ifAnyGranted role="ROLE_ADMIN,ROLE_SPEAKER">
    <div class="buttons">
      <g:form>
        <input type="hidden" name="id" value="${eventSpeakerAssignmentInstance?.id}"/>
        <g:if test="${eventSpeakerAssignmentInstance.user == authenticatedUser}">
          <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
        </g:if>
        <g:else>
          <g:ifAllGranted role="ROLE_ADMIN">
            <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
          </g:ifAllGranted>
        </g:else>
        <g:ifAllGranted role="ROLE_ADMIN">
          <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
        </g:ifAllGranted>
      </g:form>
    </div>
  </g:ifAnyGranted>
</div>
</body>
</html>
