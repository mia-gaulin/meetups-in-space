require 'spec_helper'

feature "user views page for a specific meetup" do
  let(:user) do
    User.create(
      provider: "github",
      uid: "1",
      username: "jarlax1",
      email: "jarlax1@launchacademy.com",
      avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400 (85KB)"
    )
  end

  scenario "each meetup is a link to a page" do
    Meetup.create(title: "Earth Viewing", meetup_date: "3/15/16", description: "Watch our little blue planet from space!", user_id: 1, location_id: 1)

    Meetup.create(title: "Jumping Contest", meetup_date: "3/16/16", description: "Who can jump the highest in the moon's lessened gravity?", user_id: 2, location_id: 1)

    visit '/meetups'

    expect(page).to have_link "Earth Viewing"
  end

  scenario "user views meetup page" do
    meetup_1 = Meetup.create(title: "Earth Viewing", meetup_date: "3/15/16", description: "Watch our little blue planet from space!", user_id: 1, location_id: 1)

    Location.create(name: "Mars")

    visit '/meetups'
    sign_in_as user

    expect(page).to have_content "You're now signed in as #{user.username}!"

    click_link "Earth Viewing"

    expect(page).to have_content meetup_1.description
    expect(page).to have_content ("Mars")
    expect(page).to have_content ("jarlax1")
  end
end
