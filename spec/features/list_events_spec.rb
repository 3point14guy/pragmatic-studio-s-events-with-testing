require "rails_helper"
require "spec_helper"

# the code left of and including the ".to" is called the target
# expect(page).to
# everything to the right, is called the matcher
#                  have_text("3 Events")

# "describe", ".to", "have_text" are all ruby methods provided by rspec
# visit and page are method and object provided by capybara

describe "Viewing the list of events" do
  it "shows the event" do
    visit events_url
    expect(page).to have_text("3 Events")
    expect(page).to have_text("Event 1")
    expect(page).to have_text("Event 2")
    expect(page).to have_text("Event 3")
  end
end
