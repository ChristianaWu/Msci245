class CreateSpells < ActiveRecord::Migration[6.0]
  def change
    create_table :spells do |t|
      t.string :name, limit: 70, null: false, unique: true
      t.integer :level, limit: 1, null: false
      t.string :school, limit: 70, null: false
      t.string :concentration, null: false
      t.string :description, limit: 4096

      t.timestamps
    end
  end
end
