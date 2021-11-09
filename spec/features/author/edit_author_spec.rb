require 'rails_helper'

describe "Show author page", type: :feature do
  it "should exist and render infos of author" do
    @alan = FactoryBot.create :author
    visit edit_author_path(@alan)
  end

  it "should update the author" do
    @alan = FactoryBot.create :author
    visit edit_author_path(@alan)
    page.fill_in 'author[first_name]', with: 'Edsger'
    page.fill_in 'author[last_name]', with: 'Dijkstra'
    page.fill_in 'author[homepage]', with: 'https://de.wikipedia.org/wiki/Edsger_W._Dijkstra'
    find('input[type="submit"]').click

    @alan.reload
    expect(@alan.first_name).to eq("Edsger")
    expect(@alan.last_name).to eq("Dijkstra")
    expect(@alan.homepage).to eq("https://de.wikipedia.org/wiki/Edsger_W._Dijkstra")
  end
end
