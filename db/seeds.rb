# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



kids = Genre.create(:name=>"少年漫画")
kids_jannpu = kids.children.create(:name=>"週間少年ジャンプ")
kids_magazin = kids.children.create(:name=>"週刊少年マガジン")

seinenn = Genre.create(:name=>"青年漫画")
seinenn_yanngu = seinenn.children.create(:name=>"ヤングマガジン")
seinenn_magazin = seinenn.children.create(:name=>"ヤングジャンプ")
