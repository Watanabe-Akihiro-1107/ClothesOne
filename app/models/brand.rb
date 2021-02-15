class Brand < ApplicationRecord
	has_many :items
	validates :brand_name, uniqueness: true
	# uniqueness: true　はカラムに一意性を持たせる制約です。便利。
end
