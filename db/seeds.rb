# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email:"admin@test",password:"aaaaaa")

cook = Genre.create(:name=>"料理")
 _cook_japan = cook.children.create(:name=>"和食")
 _cook_europe = cook.children.create(:name=>"洋食")
 _cook_china = cook.children.create(:name=>"中華")
 _cook_other = cook.children.create(:name=>"その他")
 
 fiction = Genre.create(:name=>"フィクション")
 _fiction_mystery = fiction.children.create(:name=>"ミステリー")
 _fiction_youth = fiction.children.create(:name=>"青春")
 _fiction_siencefiction = fiction.children.create(:name=>"SF")