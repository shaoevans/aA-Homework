require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Evans") }
  let(:brownie) { Dessert.new("brownie", 100, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("brownie")
    end

    it "sets a quantity" do 
      expect(brownie.quantity).to eq(100)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to be_empty
    end
    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "100", chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    before(:each) do 
      brownie.add_ingredient("chocolate")
    end
    it "adds an ingredient to the ingredients array" do
      expect(brownie.ingredients).to eq(["chocolate"])
    end

  end

  describe "#mix!" do
    before(:each) do 
      brownie.add_ingredient("chocolate")
      brownie.add_ingredient("sugar")
      brownie.add_ingredient("spice")
      brownie.add_ingredient("butter")
      brownie.mix!
    end
    it "shuffles the ingredient array" do
      expect(brownie.ingredients).to_not eq(["chocolate", "sugar", "spice", "butter"])
    end
  end

  describe "#eat" do
    before(:each) do
      brownie.eat(1)
    end
    it "subtracts an amount from the quantity" do
      expect(brownie.quantity).to eq(99)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {brownie.eat(200)}.to raise_error
    end

  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Evans")
      expect(brownie.serve).to eq("Evans has made 100 brownies!")
    end
    
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(brownie)
      brownie.make_more
    end
  end
end
