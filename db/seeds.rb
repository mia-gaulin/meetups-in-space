# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')

Location.create(name: "Mercury")
Location.create(name: "Venus")
Location.create(name: "Earth")
Location.create(name: "Mars")
Location.create(name: "Jupiter")
Location.create(name: "Saturn")
Location.create(name: "Uranus")
Location.create(name: "Neptune")
Location.create(name: "Pluto")

User.create(
  provider: "github",
  uid: "1",
  username: "herp",
  email: "herp@launchacademy.com",
  avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
)
User.create(
  provider: "github",
  uid: "2",
  username: "derp",
  email: "derp@launchacademy.com",
  avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
)
User.create(
  provider: "github",
  uid: "3",
  username: "derpimir",
  email: "derpimir@launchacademy.com",
  avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
)

Meetup.create(title: "Whiskey Tasting", meetup_date: "3/15/16", description: "Get drunk in space!", user_id: 1, location_id: 1)
Meetup.create(title: "Xylophone Concert", meetup_date: "3/15/16", description: "Just what it sounds like", user_id: 1, location_id: 1)
Meetup.create(title: "Karaoke", meetup_date: "3/15/16", description: "Sing your little heart out", user_id: 2, location_id: 8)
Meetup.create(title: "Bounce House Party", meetup_date: "3/15/16", description: "This will be great in reduced gravity.", user_id: 3, location_id: 4)
Meetup.create(title: "Snowball Fight", meetup_date: "3/15/16", description: "Get rekt", user_id: 2, location_id: 9)
Meetup.create(title: "Hells Angels Fundraiser", meetup_date: "3/15/16", description: "Vroom vroom", user_id: 1, location_id: 5)
Meetup.create(title: "Fallout 4", meetup_date: "3/15/16", description: "Play Fallout all day where a day is 153 hours long!", user_id: 2, location_id: 9)
Meetup.create(title: "Crochet", meetup_date: "3/15/16", description: "Make pretty things", user_id: 3, location_id: 6)

attendee_1 = User.create(provider: "github", uid: "9", username: "herpina", email: "herpina@gmail.com", avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400")

attendee_2 = User.create(provider: "github", uid: "4", username: "derpald", email: "derpald@gmail.com", avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400")

attendee_3 = User.create(provider: "github", uid: "5", username: "herpson", email: "herpson@gmail.com", avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400")

attendee_4 = User.create(provider: "github", uid: "6", username: "derpina", email: "derpina@gmail.com", avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400")

attendee_5 = User.create(provider: "github", uid: "7", username: "herpinstein", email: "herpinstein@gmail.com", avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400")

attendee_6 = User.create(provider: "github", uid: "8", username: "derpigan", email: "derpigan@gmail.com", avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400")

Attendee.create(meetup_id: 6, user_id: 1)
Attendee.create(meetup_id: 4, user_id: 2)
Attendee.create(meetup_id: 2, user_id: 2)
Attendee.create(meetup_id: 3, user_id: 1)
Attendee.create(meetup_id: 1, user_id: 3)
Attendee.create(meetup_id: 5, user_id: 4)
Attendee.create(meetup_id: 4, user_id: 3)
Attendee.create(meetup_id: 5, user_id: 1)
Attendee.create(meetup_id: 7, user_id: 5)
Attendee.create(meetup_id: 1, user_id: 6)
Attendee.create(meetup_id: 6, user_id: 7)
Attendee.create(meetup_id: 4, user_id: 6)
Attendee.create(meetup_id: 7, user_id: 2)
Attendee.create(meetup_id: 4, user_id: 8)
Attendee.create(meetup_id: 1, user_id: 8)
Attendee.create(meetup_id: 8, user_id: 9)
Attendee.create(meetup_id: 7, user_id: 5)
Attendee.create(meetup_id: 8, user_id: 3)
