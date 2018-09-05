class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name
      t.integer :house_id
      t.timestamps
    end
  end

  def up
    create_table :people do |t|
      t.string :name
      t.house_id :house_id

      t.timestamps
    end
  end

  def down
    drop_table :people
  end
end
