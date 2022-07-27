class CreateExhibits < ActiveRecord::Migration[6.1]
  def change
    create_table :exhibits do |t|
      t.string :title, presence: true, default: "Add New Title"
      t.string :subtitle
      t.text :description
      t.text :explainer
      t.boolean :interactive, default: false, null: false

      t.timestamps
    end
  end
end
