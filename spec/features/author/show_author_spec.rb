require 'rails_helper'

describe "Show author page", type: :feature do
  it "should exist and render infos of author" do
    @alan = FactoryBot.create :author
    visit author_path(@alan)
    expect(page).to have_text("Alan")
    expect(page).to have_text("Turing")
    expect(page).to have_text("http://wikipedia.de/Alan_Turing")
  end
end
