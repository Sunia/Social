class CreateVideoGames < ActiveRecord::Migration
  def change
    create_table :video_games do |t|

      t.string :name
      t.integer :user_id
      t.string :fav_character

      t.timestamps
    end
  end
end
