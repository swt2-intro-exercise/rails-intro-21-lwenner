require 'rails_helper'

describe "Show paper page", type: :feature do
  it "should exist and render infos of paper" do
    @paper = FactoryBot.create :paper
    visit paper_path(@paper)
    expect(page).to have_text("COMPUTING MACHINERY AND INTELLIGENCE")
    expect(page).to have_text("Mind 49: 433-460")
    expect(page).to have_text("1950")
  end
end
