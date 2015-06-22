class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :short_url
      t.text :original_url

      t.timestamps null: false
    end
  end
end
