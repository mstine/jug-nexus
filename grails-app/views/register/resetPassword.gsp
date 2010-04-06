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
  <title>Reset Password</title>
  <meta name="layout" content="main"/>
</head>
<body>
<h1>Password Reset</h1>
<p>Please select a new password and click "Save New Password." You will then be able to login with your new password.</p>
<g:if test="${flash.message}">
  <div class="message">${flash.message}</div>
</g:if>
<g:form>
  <input type="hidden" id="uid" name="uid" value="${uid}"/>
  <div class="dialog">
    <table>
      <tbody>
      <tr class='prop'>
        <td valign='top' class='name'><label for='passwd'>New Password:</label></td>
        <td valign='top' class='value'>
          <input type="password" id="passwd" name="passwd"/>
        </td>
      </tr>
      <tr class='prop'>
        <td valign='top' class='name'><label for='repasswd'>Confirm New Password:</label></td>
        <td valign='top' class='value'>
          <input type="password" id="repasswd" name="repasswd"/>
        </td>
      </tr>
    </table>
  </div>
  <div class="buttons">
    <span class="button"><g:actionSubmit class='save' value="Save New Password"/></span>
  </div>
</g:form>
</body>
</html>