require 'spec_helper'
describe Content do
  it { should allow_mass_assignment_of(:text).as(:admin) }
  [:text, :slug].each do |attribute|
    it { should validate_presence_of(attribute) }
  end
  context "uniqueness" do
    before {Content.create({slug: :awesome, text: "Okay"}, as: :admin)}
    [:slug].each do |attribute|
      it {should validate_uniqueness_of(attribute)}
    end
  end
  it "requires a default option" do
    expect{Content.from_slug(:this_slug_has_not_default)}.to raise_error NoDefaultContentError
  end

  context "given a new record" do
    it 'creates a content based on a slug' do
      expect{Content.from_slug(:my_awesome_slug, default: "Something")}.to change(Content, :count).by(1)
    end
    it 'creates a content with a default text' do
      default_text = "Hi, this is dog"
      Content.from_slug(:my_awesome_slug, default: default_text).text.should == default_text
    end
    it 'creates content name based on slug' do
      default_text = "Hi, this is dog"
      Content.from_slug(:my_awesome_slug, default: default_text).name.should == :my_awesome_slug
    end
  end

  context "given an already created content" do
    before do
      @content = Content.create({slug: :my_already_created_slug, text: "Hi, this is dog"}, as: :admin)
    end
    it "finds an already content with a slug" do
      fetched_content = Content.from_slug(:my_already_created_slug, default: "I have no idea what I'm doing")
      fetched_content.should == @content
    end

    it "doesn't touch it" do
      fetched_content = Content.from_slug(:my_already_created_slug, default: "I have no idea what I'm doing")
      fetched_content.text.should == "Hi, this is dog"
    end
  end
  context "parsing content using Markdown" do
    before do
      @content = Content.create({slug: :my_already_created_slug, text: "#Hi, this is dog!"}, as: :admin)
    end
    it "displays appropriate tags" do
      @content.parsed_text.should == "<h1>Hi, this is dog!</h1>\n"
    end
    it "is html safe" do
      @content.parsed_text.should be_html_safe
    end
  end
end
