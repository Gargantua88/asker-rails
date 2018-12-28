class CreateHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtags do |t|
      t.string :body

      t.timestamps
    end
  end

  create_table :hashtags_questions do |t|
    t.references :question, foreign_key: true
    t.references :hashtag, foreign_key: true
  end
end
