class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
    t.string :name
    t.string :description
    t.string :genre
    t.string :platform
    t.string :average_playtime
    end
  end
end
