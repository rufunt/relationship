class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.string :type
      t.string :title
      t.text :description
      t.references :contact, index: true, foreign_key: true
      t.references :topic, polymorphic: true, index: true

      t.timestamps
    end
  end
end
