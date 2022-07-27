class CreateMyExhibits < ActiveRecord::Migration[6.1]
  def change
    create_table :my_exhibits do |t|
      t.references :user, foreign_key: true
      t.references :exhibit, foreign_key: true
      t.references :device, foreign_key: true
      t.boolean :morning, default: false, null: false
      t.boolean :selected, default: false, null: false
      t.boolean :weather_display, default: false, null: false
      t.boolean :time_display, default: false, null: false
      t.boolean :temp_display, default: false, null: false
      t.boolean :max_min_temp_display, default: false, null: false
      t.boolean :weather_icon_display_display, default: false, null: false

      t.timestamps
    end
  end
end
