require 'spec_helper'

feature "User creates a new meetup" do
  let(:user) do
    User.create(
      provider: "github",
      uid: "1",
      username: "jarlax1",
      email: "jarlax1@launchacademy.com",
      avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400 (85KB)"
    )
  end

  scenario "goes to meetups create new page" do
    visit '/meetups'

    expect(page).to have_link 'New Meetup'
  end

  scenario "goes to meetups create new page" do
    visit '/meetups'

    click_link 'New Meetup'

    expect(page).to have_content "Create a New Meetup"
    expect(page).to have_content "Title:"
    expect(page).to have_content "Location:"
    expect(page).to have_content "Description:"
  end

  scenario "user may view their meetup on the index page" do
    Location.create(name: "Jupiter")
    Location.create(name: "Venus")
    Location.create(name: "Earth")

    visit '/meetups'
    sign_in_as user

    expect(page).to have_content "You're now signed in as #{user.username}!"
    click_link "New Meetup"

    fill_in "Title:", with: "Amazing Race: Jupiter"
    select "Jupiter", :from => "location"
    fill_in "Date of meetup:", with: "03/17/2017"
    fill_in "Description:", with: "Race across the biggest planet in our solar system!"
    click_button "Submit"

    expect(page).to have_content "Amazing Race: Jupiter"
  end

  scenario "user creates an invalid meetup" do
    -----this will not pass yet
  end
end
