require 'rails_helper'

describe "Show paper page", type: :feature do
  it "should exist and render infos of paper" do
    @paper = FactoryBot.create :paper
    visit edit_paper_path(@paper)
  end

  it "should update the paper" do
    @paper = FactoryBot.create :paper
    visit edit_paper_path(@paper)
    page.fill_in 'paper[title]', with: 'COMPUTING MACHINERY AND INTELLIGENC1'
    page.fill_in 'paper[venue]', with: 'Mind 49: 433-461'
    page.fill_in 'paper[year]', with: '1951'
    find('input[type="submit"]').click

    @paper.reload
    expect(@paper.title).to eq("COMPUTING MACHINERY AND INTELLIGENC1")
    expect(@paper.venue).to eq("Mind 49: 433-461")
    expect(@paper.year).to eq(1951)
  end
end
