class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :slug
      t.text :text

      t.timestamps
    end
  end
end
