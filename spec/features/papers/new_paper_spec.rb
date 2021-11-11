require 'rails_helper'

describe "New paper page", type: :feature do
  it "should exist at 'new_paper_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit new_paper_path
  end

  it "should have text inputs for an paper's title, venue and year" do
    visit new_paper_path
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_field('paper[title]')
    expect(page).to have_field('paper[venue]')
    expect(page).to have_field('paper[year]')
  end

  it "should have a select for authors" do
    visit new_paper_path
    expect(page).to have_field('paper[author_ids][]')
  end

  it "form should create a new paper" do
    visit new_paper_path
    page.fill_in 'paper[title]', with: 'COMPUTING MACHINERY AND INTELLIGENCE'
    page.fill_in 'paper[venue]', with: 'Mind 49: 433-460'
    page.fill_in 'paper[year]', with: '1950'
    find('input[type="submit"]').click
    expect(Paper.count).to eq(1)
  end

  it "should return not valid because title is empty" do
    @paper = Paper.new(year: 1950, venue: "Mind 49: 433-460")
    expect(@paper).to_not be_valid
  end

  it "should return not valid because venue is empty" do
    @paper = Paper.new(title: "COMPUTING MACHINERY AND INTELLIGENCE", year: 1950)
    expect(@paper).to_not be_valid
  end

  it "should return not valid because year is empty" do
    @paper = Paper.new(title: "COMPUTING MACHINERY AND INTELLIGENCE", venue: "Mind 49: 433-460")
    expect(@paper).to_not be_valid
  end

  it "should return valid" do
    @paper = Paper.new(title: "COMPUTING MACHINERY AND INTELLIGENCE", venue: "Mind 49: 433-460", year: 1950)
    expect(@paper).to be_valid
  end

  it "should show errors when creating" do
    visit new_paper_path
    find('input[type="submit"]').click

    expect(page).to have_text("Title can't be blank")
    expect(page).to have_text("Venue can't be blank")
    expect(page).to have_text("Year can't be blank")
    expect(page).to have_text("Year is not a number")
  end
end
