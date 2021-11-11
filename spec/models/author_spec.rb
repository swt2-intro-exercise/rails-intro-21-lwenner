require 'rails_helper'

RSpec.describe Author, type: :model do
  it "should create an author with first_name, last_name, homepage" do
    author = Author.new(first_name: "Alan", last_name: "Turing", homepage: "http://wikipedia.de/Alan_Turing")
    expect(author.first_name).to eq("Alan")
    expect(author.last_name).to eq("Turing")
    expect(author.homepage).to eq("http://wikipedia.de/Alan_Turing")
    expect(author.name).to eq("Alan Turing")
  end

  it "should have a author relation" do
    @author = Author.new(first_name: "Alan", last_name: "Turing", homepage: "http://wikipedia.de/Alan_Turing")
    expect(@author.papers.length).to eq(0)
  end

  it "should have an author in the relation" do
    @paper = FactoryBot.create :paper
    @author = @paper.authors.create(first_name: "Alan", last_name: "Turing", homepage: "http://wikipedia.de/Alan_Turing")
    expect(@author.papers.length).to eq(1)
  end
end
