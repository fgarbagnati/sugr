class CreateMorsels < ActiveRecord::Migration
  def change
    create_table :morsels do |t|
      t.belongs_to :user
      t.string :sweet
      t.timestamps
    end
  end
end
