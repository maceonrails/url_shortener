class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :url_id
      t.string :user_agent
      t.string :ip_address
      t.text :referrer_url

      t.timestamps null: false
    end
  end
end
