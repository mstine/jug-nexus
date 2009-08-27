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
  """
}
