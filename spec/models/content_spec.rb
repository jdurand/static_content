require 'spec_helper'
describe Content do

  describe "mass assigment" do

    context "common" do

      it { should_not allow_mass_assignment_of(:text) }
      it { should_not allow_mass_assignment_of(:slug) }
    end

    context "admin" do

      it { should allow_mass_assignment_of(:text).as(:admin) }
      it { should allow_mass_assignment_of(:slug).as(:admin) }
    end
  end

  describe "validation" do

    [:text, :slug].each do |attribute|
      it { should validate_presence_of(attribute) }
    end

    context "uniqueness" do

      before do
        Content.create({slug: :awesome, text: "Okay"}, as: :admin)
      end

      [:slug].each do |attribute|
        it {should validate_uniqueness_of(attribute)}
      end
    end
  end

  describe ".from_slug" do

    it "requires a default option" do
      expect do
        Content.from_slug(:this_slug_has_not_default)
      end.to raise_error ArgumentError
    end

    context "given a new record" do

      it 'creates a content based on a slug' do
        expect do
          Content.from_slug(:my_awesome_slug, default: "Something")
        end.to change(Content, :count).by(1)
      end

      describe "saved values" do

        before do
          default_text = "Hi, this is dog"
          Content.from_slug(:my_awesome_slug, default: default_text) 
        end

        subject do
          Content.last
        end

        its(:text) { should eq("Hi, this is dog") }
        its(:slug) { should eq("my_awesome_slug") }
      end
    end

    context "given an already created content" do

      before do
        Content.create({slug: :my_awesome_slug, text: "Hi, this is dog"}, as: :admin)
      end

      it 'not create a new content' do
        expect do
          Content.from_slug(:my_awesome_slug, default: "Something")
        end.to_not change(Content, :count)
      end

      describe "not change the values" do

        before do
          Content.from_slug(:my_awesome_slug, default: "I have no idea what I'm doing") 
        end

        subject do
          Content.last
        end

        its(:text) { should eq("Hi, this is dog") }
        its(:slug) { should eq("my_awesome_slug") }
      end
    end
  end

  describe "#parsed_text" do

    let(:content) do
      Content.create({slug: :my_already_created_slug, text: "#Hi, this is dog!"}, as: :admin)
    end

    it "displays appropriate tags" do
      content.parsed_text.should == "<h1>Hi, this is dog!</h1>\n"
    end

    it "is html safe" do
      content.parsed_text.should be_html_safe
    end
  end

  describe "#raw_text" do

    let(:content) do
      Content.create({slug: :my_already_created_slug, text: "#Hi, this is dog!"}, as: :admin)
    end

    it "displays the markdown tags" do
      content.raw_text.should == "#Hi, this is dog!"
    end
    it "is html safe" do
      content.raw_text.should be_html_safe
    end
  end
end
