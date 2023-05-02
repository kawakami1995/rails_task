class AddThingsToSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :content, :text
  end
end
