

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Event</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Event List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Event</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${eventInstance}">
            <div class="errors">
                <g:renderErrors bean="${eventInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title">Title:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:eventInstance,field:'title','errors')}">
                                    <input type="text" id="title" name="title" value="${fieldValue(bean:eventInstance,field:'title')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startTime">Start Time:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:eventInstance,field:'startTime','errors')}">
                                    <g:datePicker name="startTime" value="${eventInstance?.startTime}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endTime">End Time:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:eventInstance,field:'endTime','errors')}">
                                    <g:datePicker name="endTime" value="${eventInstance?.endTime}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="location">Location:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:eventInstance,field:'location','errors')}">
                                    <input type="text" id="location" name="location" value="${fieldValue(bean:eventInstance,field:'location')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="directions">Directions:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:eventInstance,field:'directions','errors')}">
                                    <input type="text" id="directions" name="directions" value="${fieldValue(bean:eventInstance,field:'directions')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:eventInstance,field:'description','errors')}">
                                    <textarea rows="5" cols="40" name="description">${fieldValue(bean:eventInstance, field:'description')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="maxAttendees">Max Attendees:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:eventInstance,field:'maxAttendees','errors')}">
                                    <input type="text" id="maxAttendees" name="maxAttendees" value="${fieldValue(bean:eventInstance,field:'maxAttendees')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="registrationOpen">Registration Open:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:eventInstance,field:'registrationOpen','errors')}">
                                    <g:checkBox name="registrationOpen" value="${eventInstance?.registrationOpen}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="onHomePage">On Home Page:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:eventInstance,field:'onHomePage','errors')}">
                                    <g:checkBox name="onHomePage" value="${eventInstance?.onHomePage}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="archived">Archived:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:eventInstance,field:'archived','errors')}">
                                    <g:checkBox name="archived" value="${eventInstance?.archived}" ></g:checkBox>
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
