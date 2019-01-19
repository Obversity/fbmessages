class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.belongs_to :person, foreign_key: true
      t.belongs_to :conversation, foreign_key: true

      t.timestamps
    end
  end
end
