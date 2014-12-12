#SPEC FILE - RUN TESTS TO ENSURE CRUD ELEMENTS ARE WORKING....


require 'rails_helper'

feature "Events" do

  # ________________
  #   CREATE
  scenario "User can create an event" do

    visit root_path
    click_on "New Event"
    fill_in "Description", with: "My awesome event"
    click_on "Create Event"

    expect(page).to have_content("My awesome event")
  end

  # _________________
  #   UPDATE
  scenario "User edits an event" do    #SET UP (THRU ROOT PATH)  ---UPDATE----TEST ABILITY TO EDIT AN EVENT
    Event.create!(
    description: "My aweeesome event" #CREATE AN EVENT TO EDIT
    )

    visit root_path                  #SET UP ENDS
    expect(page).to have_content("My aweeesome event") #ENSURE THAT EVENT YOU CREATED IS THERE TO BE EDITED.
    click_on "edit"
    fill_in "Description", with: "My awesome event"  #DO THE THING -ACTUALLY EDIT EVENT
    click_on "Update Event"

    expect(page).to have_content("My awesome event")  #WHAT YOU EXPECT AFTER EDIT
    expect(page).to have_no_content("My aweeesome event")
  end
  # ________________
  #READ

  scenario 'listing events' do #READ----TEST ABILITY TO REVIEW THE EVENTS
    Event.create!(
    description: "Free lunch today -oh and a gschool panel", #CREATE EVENTS TO REVIEW
    )

    Event.create!(
    description: "Hug Momo Hour", #CREATE EVENTS TO REVIEW
    )

    Event.create!(
    description: "Ramen festival", #CREATE EVENTS TO REVIEW
    )

    visit root_path #SET UP

    expect(page).to have_content("Free lunch today -oh and a gschool panel")   #WHAT YOU EXPECT WHEN YOU VISIT HOME PAGE
    expect(page).to have_content("Hug Momo Hour")
    expect(page).to have_content("Ramen festival")
  end



  # ________________
  #DELETE

  scenario 'deleting events' do
    # Event.create!(
    # description: "I'm going to be deleted"
    # )

    Event.create!(
    description: "Ramen festival", #CREATE EVENTS TO REVIEW
    )

    visit root_path
    click_on "delete"

    expect(page).to have_no_content("I'm going to be deleted")
    expect(page.current_path).to eq(events_path)
  end
end
