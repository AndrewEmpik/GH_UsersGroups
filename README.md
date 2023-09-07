## Installation

First, you need to run a SQL script from **.\SQL_scripts** folder to create needed database environment. Follow the instructions in **.\SQL_scripts\README.md** file.

Then, for simple application launch just type:

```bash
$ npm i
$ npm start
```

## Observe endpoints in Swagger

You then will be able to see all the endpoints in **Swagger**, running at http://localhost:3000/api

To test them out you will need to use **Postman**, as the authentication mechanism is currently missing from Swagger.

## Testing in POSTMAN
Import the Postman collection from **.\UsersGroups.postman_collection.json** file and you'll be able to test all the endpoints out one-by-one.