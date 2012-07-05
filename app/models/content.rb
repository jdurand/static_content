class Content < ActiveRecord::Base
  attr_accessible :slug, :text, as: :admin
  validates :slug, presence: true
  def self.markdown(slug)
    binding
    RDiscount.new(content(slug).text).to_html.html_safe
  rescue
    nil
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
