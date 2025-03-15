class Product < ApplicationRecord
  validates :name, :description, :price, presence: true

  after_create :log_new_product
  after_update :log_update_product
  after_destroy :log_destroy_product

  private
  def log_new_product
    puts "A product was been created"
  end

  private
  def log_update_product
    puts "A product was updated"
  end

  private
  def log_destroy_product
    puts "A product was destroyed"
  end
end
