class CreateMorsels < ActiveRecord::Migration
  def change
    create_table :morsels do |t|
      t.belongs_to :user
      t.string :sweet, :limit => 140
      t.timestamps
    end
  end
end
