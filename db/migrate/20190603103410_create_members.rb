class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.string :website_url
      t.string :shortened_website_url

      t.timestamps
    end
  end
end
