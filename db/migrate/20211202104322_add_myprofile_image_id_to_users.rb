class AddMyprofileImageIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :myprofile_image_id, :string
  end
end
