<head>
  <meta name='layout' content='main'/>
  <title>Login</title>

</head>

<body>
<div class='body'>
  <g:if test='${flash.message}'>
    <div class='message'>${flash.message}</div>
  </g:if>
  <h1>Please Login:</h1>
  <form action='${postUrl}' method='POST' id='loginForm' class='cssform'>
    <div class="dialog">
      <table>
        <tbody>
        <tr class="prop">
          <td valign="top" class="name"><label for='j_username'>Username:</label></td>
          <td valign="top" class="value"><input type='text' class='text_' name='j_username' id='j_username' value='${request.remoteUser}'/></td>
        </tr>
        <tr class="prop">
          <td valign="top" class="name"><label for='j_password'>Password:</label></td>
          <td valign="top" class="value"><input type='password' class='text_' name='j_password' id='j_password'/></td>
        </tr>
        <tr class="prop">
          <td valign="top" class="name"><label for='remember_me'>Remember me!</label></td>
          <td valign="top" class="value"><input type='checkbox' class='chk' name='_spring_security_remember_me' id='remember_me'
            <g:if test='${hasCookie}'>checked='checked'</g:if>/></td>
        </tr>
        <tr class="prop">
          <td valign="top" class="name">&nbsp;</td>
          <td valign="top" class="value"><input type='submit' value='Login'/></td>
        </tr>
        </tbody>
      </table>

    </div>


  </form>

</div>
<script type='text/javascript'>
  <!--
  (function() {
    document.forms['loginForm'].elements['j_username'].focus();
  })();
  // -->
</script>
</body>
