require 'rspec'
require 'dessert'
require 'chef'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  chef = Chef.new("chef")
  dessert = Dessert.new("cake", 100, chef)
  describe "#initialize" do

    it "sets a type" do
      expect(dessert.type).to eq("cake")
    end
    it "sets a quantity" do
      expect(Dessert.new("cake", 100, "me").quantity).to eq(100)
    end
    it "starts ingredients as an empty array" do
      expect(Dessert.new("cake", 100, "me").ingredients).to eq([])
    end
    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cat", "cat", :cat)}.to raise_error(ArgumentError)
    end
  end
  d = Dessert.new("cat", 10, :cat)
  ingredients = ["flour", "salt", "nuts", "chocolate", "vegan ice cream", "banana", "soymilk"]
  ingredients.each { |i|
    d.add_ingredient(i)
    dessert.add_ingredient(i)
  }
  describe "#add_ingredient" do

    it "adds an ingredient to the ingredients array" do
      expect(d.ingredients).to eq(ingredients)
    end
  end

  describe "#mix!" do
    dessert.mix!
    index = 0
    dessert.ingredients.each_with_index do |ingrd, i|
      break if ingrd != ingredients[i]
      index = i
    end
    it "shuffles the ingredient array" do
      expect(index < (ingredients.length - 1)).to be_truthy
    end
  end

  describe "#eat" do
    dessert.eat(10)
    it "subtracts an amount from the quantity" do
      expect(dessert.quantity).to eq(90)
    end
    it "raises an error if the amount is greater than the quantity" do
      expect{dessert.eat(400)}.to raise_exception("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(dessert.serve).to match(/Chef.*/)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
