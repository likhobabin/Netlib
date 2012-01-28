class AddReaderIdToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :reader_id, :integer
  end

  def self.down
    remove_column :books, :reader_id
  end
end
