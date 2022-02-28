class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.integer :created_by
      t.bigint :p_cid
      t.integer :has_recovered, null: false, default: 0
      t.bigint :p_phone
      t.string :p_name
      t.date :from_date
      t.date :to_date
      t.date :transfer_date
      t.integer :transfer_from
      t.integer :transfer_to

      t.timestamps
    end
  end
end
