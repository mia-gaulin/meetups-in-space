require 'spec_helper'

feature "User is able to view all attendees of a meetup" do
  scenario "User visits a meetup page to view attendees" do
    visit '/meetups/1'

    expect(page).to have_content ("Who is attending?")
  end
end
