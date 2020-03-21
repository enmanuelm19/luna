class CreateSpreeEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_events do |t|
      t.string :type
      t.text :body

      t.timestamps
    end
  end
end
