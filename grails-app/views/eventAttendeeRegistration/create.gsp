

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create EventAttendeeRegistration</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">EventAttendeeRegistration List</g:link></span>
        </div>
        <div class="body">
            <h1>Create EventAttendeeRegistration</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${eventAttendeeRegistrationInstance}">
            <div class="errors">
                <g:renderErrors bean="${eventAttendeeRegistrationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
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
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
