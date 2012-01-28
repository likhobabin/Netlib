class CreateBooksCategories < ActiveRecord::Migration
  def self.up
	create_table :books_categories do |t|
		t.references :book
		t.references :category
	end
  end

  def self.down
	drop_table :books_categories
  end
end
