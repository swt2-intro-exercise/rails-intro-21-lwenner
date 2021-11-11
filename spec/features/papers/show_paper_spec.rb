require 'rails_helper'

describe "Show paper page", type: :feature do
  it "should exist and render infos of paper" do
    @paper = FactoryBot.create :paper
    visit paper_path(@paper)
    expect(page).to have_text("COMPUTING MACHINERY AND INTELLIGENCE")
    expect(page).to have_text("Mind 49: 433-460")
    expect(page).to have_text("1950")
  end

  it "should show authors of the paper" do
    @author = FactoryBot.create :author
    @paper = @author.papers.create(title: "COMPUTING MACHINERY AND INTELLIGENCE", venue: "Mind 49: 433-460", year: 1950)
    visit paper_path(@paper)
    expect(page).to have_text("Alan Turing")
  end
end
