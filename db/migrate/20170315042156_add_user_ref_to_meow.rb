class AddUserRefToMeow < ActiveRecord::Migration[5.0]
  def change
    add_reference :meows, :user, foreign_key: true
  end
end
