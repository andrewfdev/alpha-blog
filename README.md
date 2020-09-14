- Users  - create users table and model
- add validations
* username must be present and unique, min 3 max 25
* email address must be present and unique, max 105
* email must be valid format, check with email regex

associations
- One-to-many
between users and articles

REST for users

Authentication 
- Login using secure password

Restriction of actions
- Based on logged in/logged out state

Security
- Admin user functionality and access level

