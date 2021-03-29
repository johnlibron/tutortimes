# Tutor Times

This is a work-in-progress application that allows users to register for tutoring sessions in different subjects. Each user gets a personalized registration page that allows them to view the available time slots and register for them.

## How to work on this project

This repository contains a minimal Rails 6.1 app for you to start from. You'll work in the (existing) `takehome` branch. You can do a `git checkout takehome`.

Before you write any code, please use GitHub to make a new pull request between the `main` and `takehome` branches. The PR will not have much in it to begin with. By creating it right away, we can use it to communicate about the code as you go. After you've had a chance to read through this file, you might update the PR description with an overall plan and a rough todo list. Of course, it will probably change along the way. That's OK!

Commit to the `takehome` branch and push it up as you complete each part. Feel free to ask questions in the PR. Don't be afraid to commit your work in progress. This enables us to follow along and interact as we would when developing a real feature at Treehouse. We're interested in the process of working with you as you build toward the completed project.

## Running the app

After installing Ruby 3.0, you should be able to run the app with these commands:

- `bin/setup`
- `bin/rails db:setup`
- `bin/rails server`
- Visit http://localhost:3000/ to see the example user accounts
- Click one of the "0 registrations" links to see a user's personal registration page and register as them

The test suite can be run with:

- `bin/rails test:all`

A few notes:

- We have created some basic admin pages for managing users and available time slots. The security and styling of these admin pages will not be judged at all for this project.
  - http://localhost:3000/time_slots - manage the available time slots
  - http://localhost:3000/users - manage the users who can register for tutoring
- You should focus on the core functionality and test cases first. For the user's registration page, visual appearance is not important but do try to maintain a good user experience. Any changes to improve the UX of this page are welcome but not required.
- You can implement these features as you see fit, but try to follow Rails' conventions when possible.

The sections below describe what you need to build. If you have any questions about the requirements, just let us know!

## Your tasks

To complete this project, add these three new features to the existing application. Be sure to add at least one test case for each feature!

Please keep track of your time and try not to exceed **four hours**.

### Implement a capacity limit for time slots

Add a `capacity` attribute to the time slot model so administrators can limit the number of registrations for a time slot. If the number of registrations for a given slot reaches its capacity, the slot should be labeled as full on the registration page. It should not be possible for any user to register for a time slot that is full; however, an already registered user should be able to cancel their registration.

### Prevent registration for overlapping time slots

If a user attempts to register for a slot that overlaps with one of their existing registrations, a warning message should be displayed to notify them of the scheduling conflict. If the student continues, that conflicting registration should be deleted before the new registration is created.

### Add a CSV export for daily schedules

Administrators should be able to export a CSV formatted file containing all registrations for a specified date. http://localhost:3000/export/YYYY-MM-DD.csv should respond with a CSV file containing columns for each time slot on that date, rows for each registered user, and an "X" to represent each registration. Users that did not register for any time slots on the specified date should not be included. The file should look something like this:

```
Student,Psychology (2:00—2:45pm),Information Systems (2:00—3:00pm),Creative Arts (3:00—3:45pm)
Alton (alton@example.com),,,X
Cedric (cedric@example.com),X,,X
Lonna (lonna@example.com),,X,
```
