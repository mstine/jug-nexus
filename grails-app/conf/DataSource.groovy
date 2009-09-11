hibernate {
  cache.use_second_level_cache = true
  cache.use_query_cache = true
  cache.provider_class = 'com.opensymphony.oscache.hibernate.OSCacheProvider'
}
// environment specific settings
environments {
  development {
    dataSource {
      dialect = org.hibernate.dialect.MySQLInnoDBDialect
      pooled = true
      driverClassName = "com.mysql.jdbc.Driver"
      username = "root"
      password = ""
      dbCreate = "create-drop" // one of 'create', 'create-drop','update'
      url = "jdbc:mysql://localhost/jugnexusdev"
    }
  }
  test {
    dataSource {
      dialect = org.hibernate.dialect.MySQLInnoDBDialect
      pooled = true
      driverClassName = "com.mysql.jdbc.Driver"
      username = "root"
      password = ""
      dbCreate = "update"
      url = "jdbc:mysql://localhost/jugnexustest"
    }
  }
  production {
    dataSource {
      dialect = org.hibernate.dialect.MySQLInnoDBDialect
      pooled = false      
      dbCreate = "update"
      jndiName = "java:comp/env/jdbc/JugNexusProdDB"
    }
  }
}