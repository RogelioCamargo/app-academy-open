require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
	subject(:cake) { Dessert.new("cake", 10, chef)}

  describe "#initialize" do
    it "sets a type" do 
			expect(cake.type).to eq("cake")
		end

    it "sets a quantity" do 
			expect(cake.quantity).to eq(10)
		end

    it "starts ingredients as an empty array" do
			expect(cake.ingredients).to be_empty
		end

    it "raises an argument error when given a non-integer quantity" do 
			expect { Dessert.new("cake", "10", chef) }.to raise_error(ArgumentError)
		end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do 
			cake.add_ingredient("flour")
			expect(cake.ingredients).to include("flour")
		end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do 
			ingredients = ["chocolate", "flour", "egg"]

			ingredients.each do |ingredient|
				cake.add_ingredient(ingredient)
			end

			expect(cake.ingredients).to eq(ingredients)
			cake.mix! 
			expect(cake.ingredients).not_to eq(ingredients)
			expect(cake.ingredients.sort).to eq(ingredients.sort)

		end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do 
			cake.eat(4)
			expect(cake.quantity).to eq(6)
		end

    it "raises an error if the amount is greater than the quantity" do 
			expect { cake.eat(11) }.to raise_error("not enough left!")
		end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do 
			allow(chef).to receive(:titleize).and_return("Chef Roger the Great Baker")
			expect(cake.serve).to eq("Chef Roger the Great Baker has made 10 cakes!")
		end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 
			expect(chef).to receive(:bake).with(cake)
			cake.make_more
		end
  end
end
