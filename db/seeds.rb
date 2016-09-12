# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

Comment.destroy_all
Post.destroy_all
User.destroy_all

user = User.new(email: "deanfoulds@gmail.com", password: "password")
post = Post.new(title: "Mr Blair rides again", post_content: "Hopefully never to return!")
user.save
post.save

