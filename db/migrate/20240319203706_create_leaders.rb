class CreateLeaders < ActiveRecord::Migration[7.1]
  def change
    create_table :leaders do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :phone_number

      t.timestamps
    end
  end
end
