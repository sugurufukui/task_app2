class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.datetime :start_date
      t.datetime :end_date
      t.string :fulltime
      t.string :memo

      t.timestamps
    end
  end
end
