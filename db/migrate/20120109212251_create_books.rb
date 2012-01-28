class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string :author
      t.string :title
      t.datetime :publication_date
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
