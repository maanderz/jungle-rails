require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "is valid with all fields filled in" do
      category = Category.create() 
      product = category.products.create(name: "yay", price: 5, quantity: 2)
      expect(product).to be_valid
    end 

    it "is not valid without a name" do
      category = Category.create() 
      product = category.products.create(name: nil, price: 5, quantity: 2)
      expect(product).to_not be_valid
    end

    it "is not valid without a price" do
      category = Category.create() 
      product = category.products.create(name: "what?", price: nil, quantity: 2)
      expect(product).to_not be_valid
    end

    it "is not valid without a quantity" do  
      category = Category.create() 
      product = category.products.create(name: "what?", price: 5, quantity: nil)
      expect(product).to_not be_valid
    end

    it "is not valid without a category" do
      product = Product.create(name: "what?", price: 5, quantity: 2)
      expect(product).to_not be_valid
    end 

  end
end
