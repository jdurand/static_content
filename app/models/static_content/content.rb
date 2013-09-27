require 'rdiscount' #TODO: Fix this stupid require statement.
module StaticContent
  class Content < ActiveRecord::Base

    attr_accessible :slug, :text, as: :admin

    validates :slug, :text, presence: true
    validates :slug, uniqueness: true

    def self.from_slug(slug, options={})
      raise ArgumentError.new("You must provide a default text for a content.") if options[:default].nil?
      find_or_initialize_by_slug(slug).tap do |content|
        if content.new_record?
          content.text = options[:default]
          content.save
        end
      end
    end

    def parsed_text
      markdown.to_html.html_safe
    end

    def raw_text
      text.html_safe
    end

    private

    def markdown
      @content ||= RDiscount.new(text)
    end
  end
end
