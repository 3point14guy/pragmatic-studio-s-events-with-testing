require 'rails_helper'

describe "Navigating events" do
  it "allows navigation from detail page to listing page" do
    # event = Event.create(name: "BugSmash",
    #                     location: "Denver",
    #                     price: 10.00,
    #                     description: "A fun evening of bug smashing!",
    #                     starts_at: 10.days.from_now)
    # can be replaced with this method call that is in the attributes files
    event = Event.create(event_attributes)

    visit event_url(event)

    click_link "All Events"

    expect(current_path).to eq(events_path)
  end

  it "allows navigation from listing page to detail page" do
    event = Event.create(event_attributes)

    visit events_url

    click_link event.name

    expect(current_path).to eq(event_path(event))
  end
end
#capybara gives us click_link and current_path
