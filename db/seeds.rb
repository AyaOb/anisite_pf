# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'admin@test.com',
  password: 'adminadmin'
)

array = %w(SF/ファンタジー ロボット/メカ アクション/バトル コメディ/ギャグ 恋愛/ラブコメ 日常/ほのぼの スポーツ/競技 ホラー/サスペンス/推理)
array.each{ |tag|
  tag_list = ActsAsTaggableOn::Tag.new
  tag_list.name = tag
  tag_list.save
}