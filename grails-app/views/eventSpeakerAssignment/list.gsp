

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>EventSpeakerAssignment List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New EventSpeakerAssignment</g:link></span>
        </div>
        <div class="post">
            <div class="title">
            <h2>Event Speaker Assignments</h2>
            </div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="entry">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Event</th>
                   	    
                   	        <th>User</th>
                   	    
                   	        <g:sortableColumn property="topic" title="Topic" />

                            <g:sortableColumn property="lightningTalk" title="Lightning Talk" />
                        

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${eventSpeakerAssignmentInstanceList}" status="i" var="eventSpeakerAssignmentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${eventSpeakerAssignmentInstance.id}">${fieldValue(bean:eventSpeakerAssignmentInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:eventSpeakerAssignmentInstance, field:'event')}</td>
                        
                            <td>${fieldValue(bean:eventSpeakerAssignmentInstance, field:'user')}</td>
                        
                            <td>${fieldValue(bean:eventSpeakerAssignmentInstance, field:'topic')}</td>

                          <td>${fieldValue(bean:eventSpeakerAssignmentInstance, field:'lightningTalk')}</td>
                        
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${eventSpeakerAssignmentInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
