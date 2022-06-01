require "tdd"

describe Array do 
	it "#my_uniq" do 
		expect([1, 2, 2, 3, 3, 3].my_uniq).to eq([1, 2, 3])
		expect([1, 2, 3].my_uniq).to eq([1, 2, 3])
	end

	it "#two_sum" do 
		expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
		expect([1, 0, 2, 2, 1].two_sum).to eq([])
	end

	it "#my_transpose" do 
		m1 = [
			[0, 1, 2],
			[3, 4, 5],
			[6, 7, 8]
		]

		m2 = [
			[0, 3, 6],
    	[1, 4, 7],
    	[2, 5, 8]
		]
		expect(m1.my_transpose).to eq(m2)
	end
end

describe "max_profit" do 
	it "returns the most profitable pair of days to buy and then sell the stock" do
		prices = [7,1,5,3,6,4]
		expect(max_profit(prices)).to eq([1, 4])
		prices = [7,6,4,3,1]
		expect(max_profit(prices)).to eq([])
	end
end