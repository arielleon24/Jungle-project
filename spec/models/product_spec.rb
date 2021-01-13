require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do 


    it "validates with all four valid attributes" do 
      @category = Category.new( name: "Electronics" )
      @product = Product.new( name: "Testing Product", price: 100, quantity: 1, category: @category)
      expect(@product).to be_valid
    end

    it "does not validate without a name" do 
      @category = Category.new( name: "Electronics" )
      @product = Product.new( name: nil , price: 100, quantity: 1, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "does not validate without a price" do 
      @category = Category.new( name: "Electronics" )
      @product = Product.new( name: "Testing Product", price: nil, quantity: 1, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end 

    it "does not validate without a quantity" do 
      @category = Category.new( name: "Electronics" )
      @product = Product.new( name: "Testing Product", price: 100, quantity: nil, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end 

    it "does not validate without a category" do 
      @category = Category.new
      @product = Product.new( name: "Testing Product", price: 100, quantity: 1, category: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end 

  end
end
