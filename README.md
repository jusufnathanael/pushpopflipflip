# PushPopFlipFlip Production Line Manager

This app is deployed to https://pushpopflipflip.herokuapp.com/.

Author: Jusuf Nathanael, Aldo Maximillian Sugito

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

#### 1. User Authentication

This application is secured with user authentication at the beginning of the session. User can sign up using their email and create an account. Below are some of the screenshots of the user authentication pages:

- Welcome page
- Sign up page
- Log in page
- Edit user / delete account page

On the home page, users will be notified about items that have reached the due dates but not yet finished.

#### 2. Workspaces and Items

Users can view the overall workspaces and rearrange the order using the drag and drop feature.
We have implemented pop-up windows for adding and editing workspace and items.

#### 3. Item Properties

All items are equipped with a QR code to ease users in finding or managing the items.

Every item also has certain due dates for each of the workspaces.

We also implemented a picture uploader system, in which a user can upload an image for a specific item. The picture uploader would automatically resize the image to a size that is comfortable to view. The image would show up in the table of items in each of the workspaces. Adding the picture is not mandatory for each of the items.

#### 4. Link Between Workspace

We have implemented the function to move an item from one workspace to another workspace. This is done so that we can move an item that has finished its current phase to the next phase. We also implemented the revert function to allow the user to undo the action that has been made by moving the item to its previous phase. This is done by adding the next and previous method on the workspace model, so that we can get the id of the next or the previous workspaces.

#### 5. Export to Excel

Users can view the list of all items, current items, and finished items with an addition of column sort function.
Subsequently, users can also export the list of finished items into an Excel file by clicking the ‘Download Finished Items’ button.
 

### Tech Stack

- Ruby 2.6.0
- Rails 6.0.3
- Bundler 2.1.4
- Yarn 1.22.4
- Node.js 12.16.3
- PostgreSQL 12.3
