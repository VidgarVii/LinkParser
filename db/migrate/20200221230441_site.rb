class Site < ActiveRecord::Migration[6.0]
  def change
    create_table :sites do |t|
      t.string :url, null: false
      t.string :title
      t.integer :status, null: false
    end
  end
end
