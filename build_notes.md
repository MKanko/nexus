Rails Portfolio Project - Content Management System - MVC Architecture

_________________________________________________________________________

Nexus

Basic CRM contacts app for users to manage contacts, companys, schedules, and tasks.

______________________________________________________________________________________________

Implement Ruby on Rails framework.

Models:

• Include at least one has_many, at least one belongs_to, and at least two has_many :through relationships

• Include a many-to-many relationship implemented with has_many :through associations. The join table must 

include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be 

submitted by the app's user

Models must include reasonable validations for the simple attributes. Don't need to add every possible 

validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.

You must include at least one class level ActiveRecord scope method. a. Scope method must be chainable, meaning 

that you must use ActiveRecord Query methods within it (such as .where and .order) rather than native ruby methods 

(such as #find_all or #sort).

Application must provide standard user authentication, including signup, login, logout, and passwords.

Authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...

Include and make use of a nested resource with the appropriate RESTful URLs.

• Include a nested new route with form that relates to the parent resource

• Include a nested index or show route

Forms should correctly display validation errors. a. Fields should be enclosed within a fields_with_errors 

class b. Error messages describing the validation failures must be present within the view.

Application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app.

• Logic present in controllers should be encapsulated as methods in your models.

• Views should use helper methods and partials when appropriate.

• Follow patterns in the Rails Style Guide and the Ruby Style Guide.

Do not use scaffolding to build project. 