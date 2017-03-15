class CreateMeows < ActiveRecord::Migration[5.0]
  def change
    create_table :meows do |t|
      t.text :content

      t.timestamps
    end
  end
end
