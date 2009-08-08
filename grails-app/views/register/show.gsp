<html>
<head>
  <meta name="layout" content="main"/>
  <title>User Profile</title>
</head>

<body>

<g:render template="/userProfile" model="${[person: person]}"/>

<div class="buttons">
  <g:form>
    <input type="hidden" name="id" value="${person.id}"/>
    <span class="button"><g:actionSubmit class='edit' value="Edit"/></span>
  </g:form>
</div>

</body>
</html>