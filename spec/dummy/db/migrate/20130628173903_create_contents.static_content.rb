# This migration comes from static_content (originally 20120705141451)
class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :slug
      t.text :text

      t.timestamps
    end
  end
end
