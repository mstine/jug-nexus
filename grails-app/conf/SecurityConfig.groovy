security {

  // see DefaultSecurityConfig.groovy for all settable/overridable properties

  active = true

  loginUserDomainClass = "User"
  authorityDomainClass = "Role"

  useRequestMapDomainClass = false

//  useControllerAnnotations = true

  defaultRole = "ROLE_MEMBER"
  enabled = "moderated"
  alwaysUseDefaultTargetUrl = true

  requestMapString = """
    CONVERT_URL_TO_LOWERCASE_BEFORE_COMPARISON
    PATTERN_TYPE_APACHE_ANT

    /commentable/add**=IS_AUTHENTICATED_REMEMBERED
    /eventattendeeregistration/setattendeeishere/**=ROLE_ADMIN
    /eventattendeeregistration/registerattendee/**=ROLE_MEMBER,ROLE_SPEAKER,ROLE_ADMIN
    /eventattendeeregistration/unregisterattendee/**=ROLE_MEMBER,ROLE_SPEAKER,ROLE_ADMIN
    /event/create=ROLE_ADMIN
    /event/edit/**=ROLE_ADMIN
    /event/save/**=ROLE_ADMIN
    /event/update/**=ROLE_ADMIN
    /event/delete/**=ROLE_ADMIN
    /eventspeakerassignment/create=ROLE_ADMIN
    /eventspeakerassignment/edit/**=ROLE_ADMIN,ROLE_SPEAKER
    /eventspeakerassignment/save/**=ROLE_ADMIN
    /eventspeakerassignment/update/**=ROLE_ADMIN,ROLE_SPEAKER
    /eventspeakerassignment/delete/**=ROLE_ADMIN
    /eventspeakerassignment/addfile/**=ROLE_ADMIN,ROLE_SPEAKER
    /eventspeakerassignment/listforevent/**=ROLE_ADMIN,ROLE_SPEAKER
    /raffle/**=ROLE_ADMIN
    /role/**=ROLE_ADMIN
    /sponsor/**=ROLE_ADMIN
    /sponsorgroup/**=ROLE_ADMIN
    /user/create=ROLE_ADMIN
    /user/edit/**=ROLE_ADMIN
    /user/save/**=ROLE_ADMIN
    /user/update/**=ROLE_ADMIN
    /user/delete/**=ROLE_ADMIN
    /register/edit/**=ROLE_ADMIN,ROLE_SPEAKER,ROLE_MEMBER
    /register/update/**=ROLE_ADMIN,ROLE_SPEAKER,ROLE_MEMBER
  """
}
