require 'rails_helper'

RSpec.describe Paper, type: :model do
  it "should create an author with first_name, last_name, homepage" do
    paper = Paper.new(title: "COMPUTING MACHINERY AND INTELLIGENCE", venue: "Mind 49: 433-460", year: 1950)
    expect(paper.title).to eq("COMPUTING MACHINERY AND INTELLIGENCE")
    expect(paper.venue).to eq("Mind 49: 433-460")
    expect(paper.year).to eq(1950)
  end

  it "should have a author relation" do
    @paper = Paper.new(title: "COMPUTING MACHINERY AND INTELLIGENCE", venue: "Mind 49: 433-460", year: 1950)
    expect(@paper.authors.length).to eq(0)
  end

  it "should have an author in the relation" do
    @author = FactoryBot.create :author
    @paper = @author.papers.create(title: "COMPUTING MACHINERY AND INTELLIGENCE", venue: "Mind 49: 433-460", year: 1950)
    expect(@paper.authors.length).to eq(1)
  end
end
