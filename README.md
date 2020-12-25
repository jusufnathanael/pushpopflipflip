# PushPopFlipFlip Production Line Manager

### Motivation

The story behind our project is because there are a lot of startup companies emerging around the world. These startups focus on many areas, and many of them are focused on small scale creative industries that design and manufacture life-changing products and solutions. These startup companies are tight on their budget and their human resources. Many could not afford to hire a lot of people, let alone software developers to keep track of their business i.e. their manufacturing process and timetable.

Therefore, through our elaborative thinking, we decided to create a website app that can track and monitor the production of small or home industries without the fuss and error of having human error in tracking the production phases. Hopefully this app could benefit small businesses in terms of cost and extensive work, while keeping accurate data for the plan. Therefore, these struggling startup companies will increase their overall work efficiency and thus maximize their profit.


### Aim

We aim to develop a simple production line manager application with an intuitive and user-friendly graphical user interface. This app will be designed like a scheduler that could track each item in the production process, as well as a comprehensive notification that would help the user keep track of their manufacturing flow.


### Target Audience

Small and home manufacturing industries/businesses


### User Stories

1. As a supervisor who foresees the production flow would have an overview of all the production steps of the manufacturing facility.
2. As an operator who works on the individual item would know when an item is overdue, and when the next items are scheduled to be done.
3. As an inventory specialist who logs the items would know how many items that have been finished, and the material required to complete a certain item.
4. As a production manager will know which item that passes after each of the production processes have been completed.
5. As a quality control will know which item that needs to be checked.
6. As a delivery manager will know which item has been finished and ready for shipping.


### Features

1. User Authentication
2. Home Page

CRUD for Logging Items and Workspaces
Drag and drop functionality for easier management
Login system (admin and user)
Gmail login (using google firebase)
Email Notification for Overdue Items
 

#### 1. User Authentication

This application is secured with user authentication at the beginning of the session. User can sign up using their email and create an account. Below are some of the screenshots of the user authentication pages:

Welcome page


Sign up



Log in


Edit user / delete account


### 2. Home Page
On the home page, users will be notified about items that have reached the due dates but not yet finished.




3. Workspaces

Drag and drop
Users can drag and drop the workspaces to rearrange the overall order.




Overall workspaces


Pop up windows for new and edit workspace
4. Items

Pop-up windows for new and edit item


Implement due dates
Users can set the due dates for each workspace


Picture uploader
We also implemented a picture uploader system, in which a user can upload an image for a specific item. The picture uploader would automatically resize the image to a size that is comfortable to view. The image would show up in the table of items in each of the workspaces. Adding the picture is not mandatory for each of the items.

Generate QR code
All items are equipped with a QR code to ease users in finding or managing the items.


All, current, and finished items + column sort
Users can view the list of all items, current items, and finished items with an addition of column sort function.



Export to Excel
Users can export the list of finished items into an Excel file by clicking the ‘Download Finished Items’ button.




5. Link Between Workspace

Link to next and previous workspace
Users can navigate to the next and previous workspace.


Move items between workspace
We have implemented the function to move an item from one workspace to another workspace. This is done so that we can move an item that has finished its current phase to the next phase. We also implemented the revert function to allow the user to undo the action that has been made by moving the item to its previous phase. This is done by adding the next and previous method on the workspace model, so that we can get the id of the next or the previous workspaces.




6. Add CSS using Bootstrap


7. Additional Settings/Features

Database initialisation
We have migrated from using sqlite3 database to using postgresql database. We think that the postgresql offers more features that are well suited for our app. With the addition of the pgadmin4, we can see the database tables clearer, thus giving us more information when debugging our code.


Website deployment
We have deployed our web application from our Github repository using Herokuapp. Currently, the website is hosted at https://pushpopflipflip.herokuapp.com/
You can try logging in, creating an account, and go through our application

Continuous integration (Travis CI)
We have implemented the Travis CI for our app. The travis CI is integrated at our application source code, and also our github repository. The CI is intended to smoothen out the deployment process of our website.



 

### Tech Stack

Ruby 2.6.0
Rails 6.0.3
Bundler 2.1.4
Yarn 1.22.4
Node.js 12.16.3
PostgreSQL 12.3
