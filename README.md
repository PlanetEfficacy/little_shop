# Little Shop of Orders

## The Waddams Emporium

* David Davydov
* Jesse Spevack
* Sonia Gupta
* Susi Irwin


Production: https://secure-stream-76661.herokuapp.com/
***
### Introduction

This project is a Ruby on Rails Web Application which has been designed and biult as an online commerce platform to facilitate online ordering.

The Waddams Emporium is an online e-commerce emporium specializing in artisinal, hand-crafted office accoutrements. Users can be either a Logged-In customer or a Visitor and the site is run by an Administrator account. This administrator can log in, add and remove items, and monitor orders.

We have used a gem called Paperclip to handle the images on the site. It connects to the Amazon AWS. We have also implemented Product Reviews where a logged-in user can add and delete his/her own review and a visitor can read all reviews.


#### Learning Goals

* Use TDD to drive all layers of Rails development including unit and integration tests
* Design a system of models which use one-to-one, one-to-many, and many-to-many relationships
* Practice mixing HTML, CSS, and templates to create an inviting and usable User Interface
* Differentiate responsibilities between components of the Rails stack
* Build a logical user-flow that moves across multiple controllers and models
* Practice an agile workflow and improve communication skills working within a team

### Restrictions

Project implementation may **not** use:

* Any external library for authentication except `bcrypt`

### Application Details

* Ruby version: 4

* Configuration:

  - Run ``bundle install``


* Database creation, initialization, and seeding:

  - ``rake db:create db:migrate db:seed``


* How to run the test suite

  - ``rspec``
