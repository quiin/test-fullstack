Full-Stack Rails Test
===================


This project was created as a Full-Stack **Ruby on Rails** skill test.
----------


####<i class="icon-cog"></i> Specifications
- Ruby  v2.2.1
- Rails v4.2.6
- Ubuntu Xenial 16.04
- Deployed in Heroku: https://goo.gl/DUs8QW
- Database used
	- Local: sqlite3
	- Production: Postgress

#### <i class="icon-globe"></i> Requirements

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

#### <i class="icon-bell"></i> Considerations

+ Form fields must be validated
+ Design & UX is free

#### <i class="icon-star"></i> Features
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
+ Login
	+ Via facebook
	+ Via account creation
+ Dynamic user inputs
	+ Money input fields formatted as the user types
	+ Cellphone fields are formatted with a phone format template

#### <i class="icon-user"></i> Entity Relationship Diagram

![alt text](https://i.imgur.com/CBVq1kB.png "E-R diagram")
