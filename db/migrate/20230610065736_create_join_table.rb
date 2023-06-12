class CreateJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :events_users, id: false do |t|
      t.belongs_to :events
      t.belongs_to :users
    end
  end
end
