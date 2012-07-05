require 'rdiscount' #TODO: Fix this stupid require statement.
class Content < ActiveRecord::Base
  attr_accessible :slug, :text, as: :admin
  validates :slug, :text, presence: true
  validates_uniqueness_of :slug

  def parsed_text
    RDiscount.new(text).to_html.html_safe
  end
  class << self
    def from_slug(slug, options={})
      raise NoDefaultContentError if options[:default].nil?
      find_or_initialize_by_slug(slug).tap do |content|
        if content.new_record?
          content.text = options[:default] if content.new_record?
          content.save
        end
      end
    end
  end
end
class NoDefaultContentError < StandardError
  def initialize(msg = "You must provide a default text for a content.")
    super(msg)
  end
end
