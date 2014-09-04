class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :name
      t.string :subject
      t.text :content

      t.timestamps
    end
  end
end
