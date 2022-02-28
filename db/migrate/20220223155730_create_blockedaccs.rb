class CreateBlockedaccs < ActiveRecord::Migration[7.0]
  def change
    create_table :blockedaccs do |t|
      t.string :email
      t.timestamps
    end
  end
end
