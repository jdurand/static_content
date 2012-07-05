require 'rdiscount' #TODO: Fix this stupid require statement.
class Content < ActiveRecord::Base
  attr_accessible :slug, :text, as: :admin
  validates :slug, presence: true

  def parsed_text
    RDiscount.new(text).to_html.html_safe
  end
  class << self
    def from_slug(slug, options={})
      find_or_initialize_by_slug(slug).tap do |content|
        if content.new_record?
          content.text = options[:default] if content.new_record?
          content.save
        end
      end
    end
  end
end
