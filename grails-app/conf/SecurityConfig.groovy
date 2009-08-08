security {

  // see DefaultSecurityConfig.groovy for all settable/overridable properties

  active = true

  loginUserDomainClass = "AcegiUser"
  authorityDomainClass = "Role"

  useRequestMapDomainClass = false

  useControllerAnnotations = true

  defaultRole = "ROLE_MEMBER"
  enabled = "moderated"
}
