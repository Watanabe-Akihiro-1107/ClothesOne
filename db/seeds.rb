# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

womans = Category.create(:category_name=>"Womans")
mens =Category.create(:category_name=>"Mens")
kids =Category.create(:category_name=>"Kids")


womans_outer = womans.children.create(:category_name=>"W'sアウター")
womans_bottom = womans.children.create(:category_name=>"W'sボトムス")
womans_thirt = womans.children.create(:category_name=>"W'sシャツ/ブラウス")
womans_cutsaw = womans.children.create(:category_name=>"W'sカットソー")
womans_knit = womans.children.create(:category_name=>"W'sニット")
womans_accesarry = womans.children.create(:category_name=>"W'sアクセサリー")
womans_inner =womans.children.create(:category_name=>"W'sインナー")
womans_roomwear =womans.children.create(:category_name=>"W'sルームウェア")
womans_dress =womans.children.create(:category_name=>"W'sワンピース")


mens_outer =mens.children.create(:category_name=>"M'sアウター")
mens_bottom = mens.children.create(:category_name=>"M'sボトムス")
mens_thirt = mens.children.create(:category_name=>"M'sシャツ")
mens_cutsaw = mens.children.create(:category_name=>"M'sカットソー")
mens_knit = mens.children.create(:category_name=>"M'sニット")
mens_accesarry = mens.children.create(:category_name=>"M'sアクセサリー")
mens_inner =mens.children.create(:category_name=>"M'sインナー")
mens_roomwear =mens.children.create(:category_name=>"M'sルームウェア")

kids_boy =kids.children.create(:category_name=>"ボーイズ")
kids_girl =kids.children.create(:category_name=>"ガールズ")
kids_baby =kids.children.create(:category_name=>"ベビー")


