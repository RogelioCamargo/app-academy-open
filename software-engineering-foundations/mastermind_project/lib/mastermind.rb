require_relative "code"

class Mastermind
	def initialize(length)
		@secret_code = Code.new(length)
	end
end
