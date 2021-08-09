# Sana Benefits Air Quality

## Prompt:
- Use the air quality API to build an asthma warning tool.
- API info is available here: https://aqicn.org/api/ - you'll need to get an API token to use it.
- The interface should support multiple users
- Each user should be able to set up their location and warning threshold
- Once a user with their info set up logs in we need to tell them if the air quality at their location is above or under the threshold they specified earlier

- You may use any framework / libraries that you would like, or none at all.
- Once complete, zip up your source code and send it over for review.

We're looking for a few things here:
- Overall execution
- Code readability
- A clean front-end (we don't expect you to be a designer, but the UI should be easy to understand how to use)

## How to Run

Run the following commands

To install gems, please run


```
bundle install
```

Once completed, you can run:

```
ruby app/myapp.rb
```

In order to run this app correctly, you will need to have an `.env` file for:

```
AQI_TOKEN=
AQI_FEED_URL=
```

I have provided those passwords to you via an email.

## TODO

I refrained from going too far down the rabbit hole in this project. The goal was to get the API "gateway" to call data from the AQI GET endpoint and display the data as best as I could with the allotted time.

If I had more time and capacity to do so, the next steps in my project would be to:

- [] Enhance UI to have react experience
- [] Refactor API to structure AQI as a module and create API wrapper as a class
- [] Add more spec tests and break down code to split by inheritance and composition
- [] Create user registration/sessions with username/password
