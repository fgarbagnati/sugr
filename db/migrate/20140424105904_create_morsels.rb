class CreateMorsels < ActiveRecord::Migration
  def change
    create_table :morsels do |t|
      t.belongs_to :user
      t.string(140) :sweet
      t.timestamps
    end
  end
end
