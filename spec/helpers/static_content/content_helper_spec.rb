require 'spec_helper'
describe StaticContent::ContentHelper do

  before do
    content = StaticContent::Content.new({slug: :sidebar_text, text: "Hi, this is dog"}, as: :admin)
    StaticContent::Content.should_receive(:from_slug).with(options).and_return(content)
  end

  let(:options) do
    [:sidebar_text, default: "What's up, dog"]
  end

  context "#content" do

    it "returns a content by slug" do
      helper.content(options).should eq("<p>Hi, this is dog</p>\n")
    end

    it "is aliased as c" do
      helper.c(options).should eq("<p>Hi, this is dog</p>\n")
    end
  end

  context "#raw_content" do

    it "returns a raw content by slug" do
      helper.raw_content(options).should eq("Hi, this is dog")
    end

    it "is aliased as rc" do
      helper.rc(options).should eq("Hi, this is dog")
    end
  end
end
