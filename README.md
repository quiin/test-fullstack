Full-Stack Rails Test
===================


This project was created as a Full-Stack **Ruby on Rails** skill test.
----------


###<i class="icon-cog"></i> Specifications

- Ruby  v2.2.1
- Rails v4.2.6
- Ubuntu Xenial 16.04
- Deployed in Heroku: https://goo.gl/DUs8QW
- Database used
	- Local: sqlite3
	- Production: Postgress

### <i class="icon-sitemap"></i> Folder structure

```
+-- app
|   |-- assets - javascript/coffeescript/css/image files
|   |-- controllers -  application controllers
|   |-- helpers - application helpers
|   |-- models - application models
|   +-- views - html templaste and partials
+-- config
|   |-- environments - application config files like money.rb
|   +-- locales - application locales (using es.yml)
+-- db
|   +-- migrate - database internal structure migrations
+-- spec
|   |-- factories - Model factories
|   |-- models - Model specific tests
|   +-- support - Test support files & helpers
+-- test - Auto generated tests
```

### <i class="icon-globe"></i> Requirements

+ Users can sign in to the application, complete their profile and submit a requisition
+ User authentication with Facebook
+ User profile auto completed with Facebook fields
+ Users can:
	+ Create requisitions
	+ View his/her requisitions
+ Users cannot:
	+ Delete requisitions
+ In order to create a requisition, the user's profile must be completed
+ Each requisition must have at least 3 obligatory personal references (added dynamically)

### <i class="icon-bell"></i> Considerations

+ Form fields must be validated
+ Design & UX is free

### <i class="icon-star"></i> Features
+ Internationalization
	+ App will detect the browser language and show text in the expected language
	+ Can easilly increase the scope to more languages and locales
+ CURP dynamic auto completition
	+ Curp field will be automatically filled using input fields such as name, last names, etc.
+ Dynamic personal references add/remove
	+ Personal references in a requisition can be added or removed dynamically by clicking the **New Requisition** or the **x** button in the form
+ Security
	+ No unregistered users are allowed
	+ Users can only access their own information
	+ Passwords are hashed securely
	+ Use SSL and secure cookies
+ Login
	+ Via facebook
	+ Via account creation
+ Dynamic user inputs
	+ Money input fields formatted as the user types
	+ Cellphone fields are formatted with a phone format template

### <i class="icon-laptop"></i> Tests

The following gems where used as auxiliary helpers to ease testing writing:

+ Rspec
+ FactoryGirl
+ Faker
+ Shoulda-matchers
+ Database_cleaner

Things that are being tested by these files include:

+ Correct model class name & attributes
+ Correct internal database mapping (i.e the string "Hello world!" is effectively being stored as a string)
+ Correct associations according to the [Entity Relationship Diagram](#er-diagram)
+ Correct error messages on specific errors
+ Model specific validations such as:
	+ Presence
	+ Numericality
	+ Length
	+ Format
	+ Specific constraints	

Please notice the following attribute validations were excluded from the tests because their input fields already provide an input-restriction mechanism.

+ Every telephone/cellphone field
+ Requisition.requested_amount
+ Requisition.income

For more information please visit [Masked Input](https://github.com/caarlos0/maskedinput-rails) and [Auto Numeric](https://github.com/randoum/autonumeric-rails)

To run all set of tests run

    rspec

To run a specific test individualy run

    rspec /path/to/_spec_file.rb

### <i class="icon-user"></i><a name="er-diagram"> Entity Relationship Diagram</a>

![alt text](https://i.imgur.com/CBVq1kB.png "E-R diagram")
