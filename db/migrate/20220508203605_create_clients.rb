class CreateClients < ActiveRecord::Migration[4.2]
  def change
    create_table :clients, id: :uuid do |t|
      t.string :alias
      t.string :phone
      t.string :city

      t.timestamps
    end
  end
end
