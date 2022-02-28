class CreateTestresults < ActiveRecord::Migration[7.0]
  def change
    create_table :testresults do |t|
      t.integer :pid
      t.date :testdate
      t.integer :test_result
      t.integer :recovered

      t.timestamps
    end
  end
end
