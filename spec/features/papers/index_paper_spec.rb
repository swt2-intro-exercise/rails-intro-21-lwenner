require 'rails_helper'

describe "Show author index page", type: :feature do
  it "should exist and render infos of authors" do
    FactoryBot.create :paper
    visit papers_path
    expect(page).to have_text("COMPUTING MACHINERY AND INTELLIGENCE")
    expect(page).to have_text("Mind 49: 433-460")
    expect(page).to have_text("1950")
    expect(page).to have_link 'New Paper', href: new_paper_path
  end

  it "should have edit link" do
    @paper = FactoryBot.create :paper
    visit papers_path
    expect(page).to have_link 'Edit', href: edit_paper_path(@paper)
  end

  it "should have delete link and delete the paper" do
    @paper = FactoryBot.create :paper
    visit papers_path
    expect(page).to have_link 'Destroy'
    expect(Paper.count).to eq(1)
    find('a[data-method="delete"]').click
    expect(Paper.count).to eq(0)
  end

  it "should filter the papers" do
    @paper = Paper.new(title: "COMPUTING MACHINERY AND INTELLIGENCE", venue: "Mind 49: 433-460", year: 1950)
    @paper.save
    @paper2 = Paper.new(title: "Voll tolles Paper", venue: "cool", year: 2020)
    @paper2.save
    visit '/papers?year=2020'
    expect(page).to have_text("Voll tolles Paper")
    expect(page).to have_text("cool")
    expect(page).to have_text("2020")
    expect(page).to_not have_text("COMPUTING MACHINERY AND INTELLIGENCE")
    expect(page).to_not have_text("Mind 49: 433-460")
    expect(page).to_not have_text("1950")
  end
end
