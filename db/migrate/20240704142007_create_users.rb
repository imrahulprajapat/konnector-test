class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, uniq: true
      t.json :campaigns_list
      t.timestamps
    end
  end
end
