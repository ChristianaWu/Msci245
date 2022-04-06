class CreateSpellclasses < ActiveRecord::Migration[6.0]
  def change
    create_table :spellclasses do |t|
      t.string :class_name, limit: 50, null: false

      t.timestamps
    end
  end
end
