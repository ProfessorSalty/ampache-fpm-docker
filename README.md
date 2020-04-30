# AMPACHE-FPM
### A minimal Docker container for Ampache
##### For those who need a bit more control

| Env var                     | Description                                                                                                | Default     | Required? |
|-----------------------------|------------------------------------------------------------------------------------------------------------|-------------|-----------|
| AMPACHE_DEBUG               | Send debug info to `/var/log/ampache/debug.log`                                                            | false       | No        |
| AMPACHE_LASTFM_API_KEY      | Set this to use Last.fm                                                                                    | none        | No        |
| AMPACHE_LASTFM_API_SECRET   | Set this to use Last.fm                                                                                    | none        | No        |
| AMPACHE_LDAP_GROUP          | Require a specific group for users                                                                         | none        | No        |
| AMPACHE_LOGIN_METHOD        | Defines which auth method to use (mysql,ldap,http,pam,external,openid)                                     | mysql       | No        |
| AMPACHE_MAIL_AUTH           | Enable SMTP authentication                                                                                 | false       | No        |
| AMPACHE_MAIL_AUTH_PASSWORD  | Password for SMTP authentication                                                                           | none        | No        |
| AMPACHE_MAIL_AUTH_USER      | Username for SMTP authentication                                                                           | none        | No        |
| AMPACHE_MAIL_DOMAIN         | Domain used in sent emails (*ex me@example.com*)                                                           | example.com | No        |
| AMPACHE_MAIL_ENABLE         | Enable the server to send emails                                                                           | false       | No        |
| AMPACHE_MAIL_HOST           | Host for the SMTP server (*ex smtp.google.com*)                                                            | localhost   | No        |
| AMPACHE_MAIL_NAME           | Name that will show up as the email sender (*ex Admin, Greg S, Boaty McBoatface)                           | Ampache     | No        |
| AMPACHE_MAIL_PORT           | SMTP Port                                                                                                  | 25          | No        |
| AMPACHE_MAIL_USER           | Name used in sent emails (*ex me@example.com*)                                                             | me          | No        |
| AMPACHE_REMEMBER_ME_SESSION | How long to keep users logged in if they check "Remember Me" (in seconds)                                  | 31536000    | No        |
| AMPACHE_SECRET              | Cryptographic secret                                                                                       | none        | Yes       |
| AMPACHE_SESSION_LENGTH      | How long users are normally logged in for (in seconds)                                                     | 7200        | No        |
| AMPACHE_SMTP_SECURITY       | How SMTP is secured, if enabled (*ssl, tls, or none*)                                                      | none        | No        |
| AMPACHE_STREAM_LENGTH       | Length of a single streaming session (in seconds)                                                          | 7200        | No        |
| LDAP_ADMIN_DN               | Full DN for the LDAP admin user (*ex cn=admin,dc=example,dc=com*)                                          | none        | No        |
| LDAP_ADMIN_PASSWORD         | Password for the LDAP admin user                                                                           | none        | No        |
| LDAP_HOST                   | LDAP server URL (*ex localhost, 192.168.1.27, docker-service-name*)                                        | localhost   | No        |
| LDAP_SEARCH_DN              | Base DN for users (*ex ou=people,dc=example,dc=com*)                                                       | none        | No        |
| MYSQL_DATABASE              | Name of the Ampache database (must match what is given to MySQL)                                           | ampache     | No        |
| MYSQL_HOST                  | Socket path or hostname of the database (*ex localhost, /var/run/mysqld/mysqld.sock, docker-service-name*) | none        | Yes       |
| MYSQL_PASSWORD              | Password for the MySQL database (must match what is given to MySQL)                                        | none        | Yes       |
| MYSQL_PORT                  | Port to use when connecting to the database                                                                | 3306        | No        |
| MYSQL_USER                  | Name of the Ampache database user (must match what is given to MySQL)                                      | ampache     | No        |