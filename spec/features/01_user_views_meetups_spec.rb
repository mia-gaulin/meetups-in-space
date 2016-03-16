require 'spec_helper'

feature "meetups are listed on index page" do

  scenario "user views meetups" do
    Meetup.create(title: "Earth Viewing", meetup_date: "3/15/16", description: "Watch our little blue planet from space!", user_id: 1, location_id: 1)

    Meetup.create(title: "Jumping Contest", meetup_date: "3/16/16", description: "Who can jump the highest in the moon's lessened gravity?", user_id: 2, location_id: 1)

    visit '/meetups'

    expect(page).to have_content "Earth Viewing"
    expect(page).to have_content "Jumping Contest"
  end

  scenario "meetups are listed alphabetically" do
    Meetup.create(title: "Earth Viewing", meetup_date: "3/15/16", description: "Watch our little blue planet from space!", user_id: 1, location_id: 1)

    Meetup.create(title: "Jumping Contest", meetup_date: "3/16/16", description: "Who can jump the highest in the moon's lessened gravity?", user_id: 2, location_id: 1)

    Meetup.create(title: "Zebra Watching", meetup_date: "3/15/16", description: "Count the stripes!", user_id: 1, location_id: 3)

    Meetup.create(title: "Cats", meetup_date: "3/16/16", description: "Let's talk about cats.", user_id: 2, location_id: 7)

    visit '/meetups'

    expect(page).to_not have_content "Zebra Watching"
  end
end
