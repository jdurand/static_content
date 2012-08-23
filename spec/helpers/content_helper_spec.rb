require 'spec_helper'
describe ContentHelper do
  before do
    @options = [:sidebar_text, default: "What's up, dog"]
    content = Content.new({slug: :sidebar_text, text: "Hi, this is dog"}, as: :admin)
    Content.should_receive(:from_slug).with(@options).and_return(content)
  end

  context "parsed content" do
    it "returns a content by slug" do
      helper.content(@options).should == "<p>Hi, this is dog</p>\n"
    end

    it "is aliased as c" do
      helper.c(@options).should == "<p>Hi, this is dog</p>\n"
    end
  end

  context "raw content" do
    it "returns a raw content by slug" do
      helper.raw_content(@options).should == "Hi, this is dog"
    end

    it "is aliased as rc" do
      helper.rc(@options).should == "Hi, this is dog"
    end
  end
end
