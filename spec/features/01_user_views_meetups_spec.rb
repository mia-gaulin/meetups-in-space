require 'spec_helper'

feature "meetups are listed on index page" do
  meetup_1 = Meetup.create(title: "Earth Viewing", meetup_date: "3/15/16", description: "Watch our little blue planet from space!", user_id: 1, location_id: 1)

  meetup_2 = Meetup.create(title: "Jumping Contest", meetup_date: "3/16/16", description: "Who can jump the highest in the moon's lessened gravity?", user_id: 2, location_id: 1)

  scenario "user views meetups" do
    visit '/meetups'

    expect(page).to have_content "Earth Viewing"
    expect(page).to have_content "Jumping Contest"
  end
end
