# README
Team Name : PUSH POP FLIP FLIP

Proposed Level of Achievement : Gemini

 

Motivation

The story behind our project is because there are a lot of startup companies emerging around the world. These startups focus on many areas, and many of them are focused on small scale creative industries that design and manufacture life-changing products and solutions. These startup companies are tight on their budget and their human resources. Many could not afford to hire a lot of people, let alone software developers to keep track of their business i.e. their manufacturing process and timetable.

Therefore, through our elaborative thinking, we decided to create a website app that can track and monitor the production of small or home industries without the fuss and error of having human error in tracking the production phases. Hopefully this app could benefit small businesses in terms of cost and extensive work, while keeping accurate data for the plan. Therefore, these struggling startup companies will increase their overall work efficiency and thus maximize their profit.

 

Aim

We aim to develop a simple production line manager application with an intuitive and user-friendly graphical user interface. This app will be designed like a scheduler that could track each item in the production process, as well as a comprehensive notification that would help the user keep track of their manufacturing flow.

 

Target Audience

Small and home manufacturing industries/businesses

 

User Stories

As a supervisor who foresees the production flow would have an overview of all the production steps of the manufacturing facility.
As an operator who works on the individual item would know when an item is overdue, and when the next items are scheduled to be done.
As an inventory specialist who logs the items would know how many items that have been finished, and the material required to complete a certain item.
As a production manager will know which item that passes after each of the production processes have been completed.
As a quality control will know which item that needs to be checked.
As a delivery manager will know which item has been finished and ready for shipping.

 

Features

CRUD for Logging Items and Workspaces
Drag and drop functionality for easier management
Login system (admin and user)
Gmail login (using google firebase)
Email Notification for Overdue Items
 

Scope of Project

To get inside the app, the User will have a login page that the user needs to input his/her username (Email) and password. The login is integrated with the Google Account login, as we are using Google Firebase as our database. Additionally, each user has different access to the data in this app. For example, the manager can modify the items but employees can only view the items.

Thereafter, the user is navigated to the Home page that provides important notifications on products that are reaching or have exceeded the given deadlines. Through the home page, the user can navigate through the other menus in the app

Our app is centred around the Production Phase Overview will tell which stages a certain item is currently in. Not only that, but each of the items will also have their basic information shown on the item node. Another feature that is present in each of the items is the colour coding that marks whether an item has passed its due date. We can view each of the phases separately or collectively, along with the estimated completion time and the deadline.

The user will have the ability to modify or Edit the specification of each item (name, quantity, owner, due dates, etc.) along with the desired production details of phases and due dates.

The Catalogue database provides details and specifications of all the products, such as the name of the item, category and subcategory, type of materials, date and time, etc. The products can be viewed collectively or separately according to its own category.

 

Tech Stack

Ruby Version 2.6.0
Rails 6.0.3
Bundler 2.1.4
Yarn 1.22.4
js 12.16.3
PostgreSQL 12.3
 

Plan

Features to be completed by mid-June:

Complete CRUD operations and database setup
Catalogue containing all the items
Features to be completed by mid-July:

Production Phase
Home Page
Design of the website
Sign in account
Features to be completed by the end of July:

Different access to different people
QR Code scanner and generator (if possible)
Export function (if possible)
 

Preliminary UI/UX design

https://drive.google.com/file/d/1MUtGVwG5rnsE1cPqfPrvoMUhNXmSs0D6/view?usp=sharing

 

Github Repository

https://github.com/domaxi/pushpopflipflip
This README would normally document whatever steps are necessary to get the
application up and running.

------------------------------------------------------------------------------

* Ruby version
    Ruby Version 2.6.0

* System dependencies
    Rails 6.0.3
    Bundler 2.1.4
    Yarn 1.22.4
    Node.js 12.16.3

* Configuration

* Database creation
    SQLite3 3.28.0

* Database initialization

* How to run the test suite
    wear shoes
    run on rails
    

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
    Rails server
    Type http://localhost:3000 to the browser

* ...
