require 'spec_helper'
describe ContentHelper do
  before do
    @options = :sidebar_text
    Content.should_receive(:from_slug).with(@options).and_return("Hi, this is dog")
  end
  it "returns a content by slug" do
    helper.content(@options).should == "Hi, this is dog"
  end
  it "should have an alias as c" do
    helper.c(@options).should == "Hi, this is dog"
  end
end
