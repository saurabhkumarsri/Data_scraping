class CreateBusinesses < ActiveRecord::Migration[7.0]
  def change
    create_table :businesses do |t|
      t.string :business_name
      t.string :business_type
      t.string :number
      t.string :address
      t.string :license
      t.string :profile_link
      t.string :address_link
      t.string :web_link
      t.string :linkdin_link
      t.string :twitter_link

      t.timestamps
    end
  end
end
