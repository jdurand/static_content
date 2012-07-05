class Content < ActiveRecord::Base
  attr_accessible :text, as: :admin
  validates :name, :slug, :text, presence: true
  def self.markdown(slug)
    binding
    RDiscount.new(content(slug).text).to_html.html_safe
  rescue
    nil
  end

end
