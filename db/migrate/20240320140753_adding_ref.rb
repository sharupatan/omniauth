class AddingRef < ActiveRecord::Migration[7.1]
  def change
    add_reference :groups, :leader, foreign_key: true
  end
end
