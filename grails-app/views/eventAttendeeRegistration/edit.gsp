

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit EventAttendeeRegistration</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">EventAttendeeRegistration List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New EventAttendeeRegistration</g:link></span>
        </div>
        <div class="body">
            <h1>Edit EventAttendeeRegistration</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${eventAttendeeRegistrationInstance}">
            <div class="errors">
                <g:renderErrors bean="${eventAttendeeRegistrationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${eventAttendeeRegistrationInstance?.id}" />
                <input type="hidden" name="version" value="${eventAttendeeRegistrationInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="event">Event:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:eventAttendeeRegistrationInstance,field:'event','errors')}">
                                    <g:select optionKey="id" from="${Event.list()}" name="event.id" value="${eventAttendeeRegistrationInstance?.event?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user">User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:eventAttendeeRegistrationInstance,field:'user','errors')}">
                                    <g:select optionKey="id" from="${AcegiUser.list()}" name="user.id" value="${eventAttendeeRegistrationInstance?.user?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="raffleWinner">Raffle Winner:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:eventAttendeeRegistrationInstance,field:'raffleWinner','errors')}">
                                    <g:checkBox name="raffleWinner" value="${eventAttendeeRegistrationInstance?.raffleWinner}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
