class Cnab < ActiveRecord::Migration[6.1]
  def change
    create_table :cnab do |t|
      t.string :cnab_type
      t.date :date
      t.string :value
      t.string :cpf
      t.string :card_number
    end
  end
end
