<%--
  Created by IntelliJ IDEA.
  User: mstine
  Date: Jan 11, 2010
  Time: 10:47:19 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>Request Password Email</title>
  <meta name="layout" content="main"/>
</head>
<body>
<h1>Forgot your password?</h1>
<p>Please enter your username. We will send an email to your email address on record with containing a link that
you can click on to reset your password.</p>
<g:if test="${flash.message}">
  <div class="message">${flash.message}</div>
</g:if>
<g:form>
  <div class="dialog">
    <table>
      <tbody>
      <tr class='prop'>
        <td valign='top' class='name'><label for='username'>Username:</label></td>
        <td valign='top' class='value'>
          <input type="text" id="username" name="username"/>
        </td>
      </tr>
    </table>
  </div>
  <div class="buttons">
    <span class="button"><g:actionSubmit class='save' value="Send Password Email"/></span>
  </div>
</g:form>
</body>
</html>