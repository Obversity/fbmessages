class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.belongs_to :conversation, foreign_key: true
      t.belongs_to :participant, foreign_key: true
      t.text :content
      t.string :message_type
      t.datetime :sent_at

      t.timestamps
    end
  end
end
