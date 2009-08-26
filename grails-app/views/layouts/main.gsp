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
        <li><g:link controller="event">Events</g:link></li>
        <li><g:link controller="user" action="speakers">Speakers</g:link></li>
        <li><g:link controller="user" action="members">Members</g:link></li>
        <li><g:link controller="eventSpeakerAssignment">Topics</g:link></li>
      </ul>
    </div>
    <!-- end #menu -->
    <div id="search">
      <g:form url='[controller: "searchable", action: "index"]' id="searchableForm" name="searchableForm" method="get">
        <fieldset>
          <g:textField id="q" name="q" value="search keywords" class="text" onfocus="this.select()"/>
          <input type="submit" value="Search" class="button"/>
        </fieldset>
      </g:form>
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
                  <li><g:link controller="user">Users</g:link></li>
                  <li><g:link controller="role">Roles</g:link></li>
                  <li><g:link controller="sponsorGroup">Sponsor Groups</g:link></li>
                  <li><g:link controller="sponsor">Sponsors</g:link></li>
                </ul>
              </li>
            </g:ifAllGranted>
            <li>
              <h2>Twitter</h2>
              <g:timeline/>
            </li>
            <li>
              <h2>Google Group</h2>
              <div style="text-align: center">
                <p><strong>Subscribe to Memphis/Mid-South Java User Group</strong></p>
                <form action="http://groups.google.com/group/memphis-mid-south-jug/boxsubscribe">
                  <label for="email">Email:</label><br/><input id="email" type="text" name="email"/><br/>
                  <input type="submit" value="Subscribe" name="sub"/>
                </form>
                <p>
                  <a href="http://groups.google.com/group/memphis-mid-south-jug">Visit this group</a>
                </p>
              </div>
              <p style="text-align:center"><img src="${resource(dir: 'images', file: 'JUG_Button-full.jpg')}"/></p>
              <p style="text-align:center"><a href="http://java.net"><img style="border: 0;" src="${resource(dir: 'images', file: 'javanet_button_170-full.jpg')}"/></a></p>
              <p style="text-align:center"><a href="http://jug-usa.dev.java.net/"><img style="width: 180px; height: 80px; border: 0" src="${resource(dir: 'images', file: 'jug-usa-lg.jpg')}"/></a></p>
            </li>
            <li>
              <h2>Sponsors</h2>
              <g:each in="${SponsorGroup.list()}" var="sponsorGroup">
                <h3 style="text-align: center">${sponsorGroup.name}</h3>
                <g:each in="${sponsorGroup.sponsors}" var="sponsor">
                  <p style="text-align: center">
                    <a href="${sponsor.url}">
                      <g:if test="${sponsor.logo}">
                        <img style="border: 0" src="${createLink(controller:'download',id:sponsor.logo.id)}"/>
                      </g:if>
                      <g:else>
                        ${sponsor.name}
                      </g:else>
                    </a>
                  </p>
                </g:each>
              </g:each>
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
