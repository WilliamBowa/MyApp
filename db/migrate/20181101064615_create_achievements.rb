class CreateAchievements < ActiveRecord::Migration[5.1]
  def change
    create_table :achievements do |t|
      t.string :title
      t.string :description
      t.integer :privacy
      t.boolean :featured

      t.timestamps
    end
  end
end
