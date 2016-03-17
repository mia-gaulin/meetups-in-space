require 'spec_helper'

feature "User is able to view all attendees of a meetup" do
  let(:user) do
    User.create(
      provider: "github",
      uid: "1",
      username: "jarlax1",
      email: "jarlax1@launchacademy.com",
      avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400 (85KB)"
    )
  end

  scenario "User visits a meetup page to view attendees" do
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

    click_link "Amazing Race: Jupiter"

    expect(page).to have_content ("Who is attending?")
  end

  scenario "User may join a meetup" do
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

    click_link "Amazing Race: Jupiter"

    expect(page).to have_content ("Who is attending?")

    click_button "Join"
  end

  scenario "User may see themselves on the list of those attending" do
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

    click_link "Amazing Race: Jupiter"

    expect(page).to have_content "Who is attending?"

    click_button "Join"

    expect(page).to have_content "jarlax1"
  end

  scenario "if a user is already attending the meetup, they may not join again" do
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

    click_link "Amazing Race: Jupiter"

    expect(page).to have_content "Who is attending?"

    click_button "Join"

    expect(page).to have_content "You have joined the meetup"
    expect(page).to have_content "jarlax1"
    expect(page).to_not have_button "Join"
  end

  scenario "user must be signed in to join a meetup" do
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

    click_link "Sign Out"

    click_link "Amazing Race: Jupiter"

    expect(page).to have_content "Who is attending?"

    click_button "Join"

    expect(page).to have_content "Please sign in before joining meetups"
  end
end
