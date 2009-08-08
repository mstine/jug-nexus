<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--

Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Name       : WidgetLike
Description: A two-column, fixed-width design featuring black content area background.
Version    : 1.0
Released   : 20081016

-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
  <title>Memphis/Mid-South Java User Group - <g:layoutTitle default="Welcome!"/></title>
  <meta name="keywords" content=""/>
  <meta name="description" content=""/>
  <link href="${resource(dir: "css", file: "widgetlike.css")}" rel="stylesheet" type="text/css" media="screen"/>
  <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>
  <g:layoutHead/>
  <g:javascript library="application"/>
</head>
<body>
<div id="bg1">
  <div id="header">
    <h1><a href="/jugNexus">Memphis/Mid-South JUG</a></h1>
    <g:isLoggedIn>
      <avatar:gravatar email="${loggedInUserInfo(field:'email')}"/>
      <h2>Welcome, <g:link controller="register"><g:loggedInUserInfo field="firstName"/></g:link>!<br/><span class="smallLink"><g:link controller="logout">Logout</g:link></span></h2>
    </g:isLoggedIn>
    <g:isNotLoggedIn>
      <h2>Welcome!<br/><span class="smallLink"><g:link controller="login">Login</g:link> / <g:link controller="register">Register</g:link></span></h2>
    </g:isNotLoggedIn>

  </div>
  <!-- end #header -->
</div>
<!-- end #bg1 -->
<div id="bg2">
  <div id="header2">
    <div id="menu">
      <ul>
        <li><a href="#">Events</a></li>
        <li><a href="#">Speakers</a></li>
        <li><a href="#">Members</a></li>
        <li><a href="#">Topics</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
    </div>
    <!-- end #menu -->
    <div id="search">
      <form method="get" action="#">
        <fieldset>
          <input type="text" name="q" value="search keywords" id="q" class="text"/>
          <input type="submit" value="Search" class="button"/>
        </fieldset>
      </form>
    </div>
    <!-- end #search -->
  </div>
  <!-- end #header2 -->
</div>
<!-- end #bg2 -->
<div id="bg3">
  <div id="bg4">
    <div id="bg5">
      <div id="page">
        <div id="content">
          <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir: 'images', file: 'spinner.gif')}" alt="Spinner"/>
          </div>
          <g:layoutBody/>
        </div>
        <!-- end #content -->
        <div id="sidebar">
          <ul>
            <li>
              <h2>Meet Juggy Elvis</h2>
              <img src="${resource(dir: 'images', file: 'juggyElvis-medium.jpg')}"/>
            </li>
            <g:ifAllGranted role="ROLE_ADMIN">
              <li>
                <h2>Admin Navigation</h2>
                <ul>
                  <li><g:link controller="event">Events</g:link></li>
                  <li><g:link controller="user">Users</g:link></li>
                  <li><g:link controller="role">Roles</g:link></li>
                  <li><g:link controller="eventAttendeeRegistration">Registrations</g:link></li>
                  <li><g:link controller="eventSpeakerAssignment">Speaker Assignments</g:link></li>
                </ul>
              </li>
            </g:ifAllGranted>
            <li>
              <h2>Ipsum sed interdum</h2>
              <ul>
                <li><a href="#">Sed vel quam vestibulum</a></li>
                <li><a href="#">Pellentesque morbi sit veroeros</a></li>
                <li><a href="#">Magna interdum donec pede</a></li>
                <li><a href="#">Nisl gravida iaculis auctor vitae</a></li>
                <li><a href="#">Bibendum sit amet mauris cras</a></li>
                <li><a href="#">Adipiscing libero et risus donec</a></li>
                <li><a href="#">Venenatis porttitor morbi quam</a></li>
              </ul>
            </li>
            <li>
              <h2>Powered By</h2>
              <img src="${resource(dir: 'images', file: 'grails_logo.png')}"/>
            </li>
          </ul>
        </div>
        <!-- end #sidebar -->
        <div style="clear: both; height: 40px;">&nbsp;</div>
      </div>
      <!-- end #page -->
    </div>
  </div>
</div>
<!-- end #bg3 -->
<div id="footer">
  <p>&copy; 2009 Memphis/Mid-South Java User Group. Design by <a href="http://www.nodethirtythree.com/">nodeThirtyThree</a> + <a href="http://www.freewpthemes.net/">Free CSS Templates</a></p>
</div>
<!-- end #footer -->
</body>
</html>
