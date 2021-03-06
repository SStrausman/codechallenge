# code challenge

### ERD
[ERD can be found here](http://imgur.com/atV8FIb)

There were several interesting parts of this that I wanted to touch on

1. I know the instructions said no fields needed to be added, but I added the foreign keys to demonstrate a little bit about how the relationships would work. I would not name my keys in the way the sql tool I used did (prefering something like user_id to the ID_users) that they ended up generating, but I just left it up to show what I was thinking with those relationships.

2. I find that schema design is a process where its really easy to miss things. Because of that, I usally like to have that process be fairly collaborative. Since this was a coding challenge, however, I didn't do that. I think this (and all schemas) would benefit from talking them out.

3. The Users model was interesting in this design. Usually when I am doing rolls it is simply a matter of different CRUD privileges, which means I make everything a user and use something like cancancan to differentiate the roles. For this design, however, I decided that wouldn't work. The reason for this is that each of these users are not distinct in just their permissions, but also in what data we will want to store about them. That means that if we want to keep our log in process the same for all users we have two options. First, we could just put all of them in the user table, which would lead to a database filled with nulls because of the different attributes different users would likely have. That seems bad for pretty self-explanatory reasons. Instead, I decided to make different types of users that inherented from the User model. That way we can have users log in the same way but still maintain the integrity of the user table while still keeping track of all the different attributes different users might have.

4. The assessments themselves also offered an interesting decision points It wasn't clear from the instructions whether there would be one universal survey or if there would be multiple ones or even if surveys would be made for different events. I could either create one table and then store a boolean of true/false on each user to show whether they had passed that survey, but I decided to handle the possible use case (and potential future use case) where we needed to handle multiple different assessments and created a table to keep track of all the users that has passed which assessments. It still works for the use case where we have one single assessment, but is much more scalable. 

5. I wasn't really sure how to handle check ins and outs since its behavior I've never modeled before, and it went a level beyond just keeping track of which users showed up at the event, so I decided to make it its own database column. That way it can have booleans checkin and checkout for the event. 

6. When I started my actual creation of attributes, I decided that it made more sense to have the beverages have a join table with events instead of simply belonging to events, because thats not really how beverages function in this application. I decided not to another version of the ERD, but you'll see my actual implementation reflects that choice.

7. Similarly, I realized that sales should also belong to a beverage as well. That is reflected in the code but not in the ERD for the same reason.

8. When doing the associations for events, I noticed that the design of the ERD does not fulfil the purposes of the different users really well. Therefore, I decided to link directly to a brand and to a retailer in the event. It is my assumption that an event has only one retailer and one brand. This approach would not scale to multiple different brands per an event without some kind of join table.

9. Decided to change attendences to be associated with the tasters as opposed to with the users to be more consistent with how I'm using the rest of the user types.

10. Changed the user_assessments to be taster_assessment and belong to taster for the same reasoning.

11. For the user model, I would normally implement something like bcrypt or devise on the password and not store the password in the database, but given that this is a test app that will never be deployed with users I made the choice to focus on the other parts of the challenge and not spend time setting this up.

### Run The App

1. clone the repo
2. change directory to local repo
3. bundle install to get all gems
4. create the database
5. migrate database
6. run rails c to bring up database in terminal

### Run The Tests
1. change directory to the directory of the app
2. type 'rspec'
3. to run specific tests, instead type 'rspec name_of_file.rb'