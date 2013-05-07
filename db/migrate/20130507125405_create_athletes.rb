class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :code
      t.string :country
      t.string :event
      t.string :fname
      t.string :gender
      t.string :height
      t.string :sname
      t.string :sport
      t.string :weight

      t.timestamps
    end
  end
end