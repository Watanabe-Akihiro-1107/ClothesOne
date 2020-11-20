class Inquiry < ApplicationRecord
	def index
		@inquiry = Inquiry.new
	end
end
