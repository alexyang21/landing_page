class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :vacation_start
      t.string :vacation_end
      t.string :zipcode

      t.timestamps
    end
  end
end
