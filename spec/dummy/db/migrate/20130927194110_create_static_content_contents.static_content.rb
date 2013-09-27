# This migration comes from static_content (originally 20130927193859)
class CreateStaticContentContents < ActiveRecord::Migration
  def change
    create_table :static_content_contents do |t|
      t.string :slug
      t.text :text

      t.timestamps
    end
  end
end
