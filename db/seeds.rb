# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
CampgroundImage.destroy_all
CommentImage.destroy_all

User.create(first_name: "Nedim", last_name: "Filipovic", email: "nedim.filipovic@gmail.com", password: "123456", image: File.new("#{Rails.root}/stock_photos/profile_photo.jpg"), admin: true, contributor: true)

campground1 = Campground.new(title: "Lost Lake Campground", content: "Placeholder.")
campground1.campground_images << CampgroundImage.new(image: File.new("#{Rails.root}/stock_photos/lostlake_1.jpg"), main_image: true)
campground1.campground_images << CampgroundImage.new(image: File.new("#{Rails.root}/stock_photos/lostlake_2.jpg"))
campground1.campground_images << CampgroundImage.new(image: File.new("#{Rails.root}/stock_photos/lostlake_3.jpg"))
User.first.campgrounds << campground1

campground2 = Campground.new(title: "Montana de Oro Campground", content: "Placeholder.")
campground2.campground_images << CampgroundImage.new(image: File.new("#{Rails.root}/stock_photos/montanadeoro_1.jpg"), main_image: true)
campground2.campground_images << CampgroundImage.new(image: File.new("#{Rails.root}/stock_photos/montanadeoro_2.jpg"))
campground2.campground_images << CampgroundImage.new(image: File.new("#{Rails.root}/stock_photos/montanadeoro_3.jpg"))
campground2.campground_images << CampgroundImage.new(image: File.new("#{Rails.root}/stock_photos/montanadeoro_4.jpg"))
User.first.campgrounds << campground2

campground3 = Campground.new(title: "Anza-Borrego Campground", content: "Placeholder.")
campground3.campground_images << CampgroundImage.new(image: File.new("#{Rails.root}/stock_photos/anzaborrego_1.jpg"), main_image: true)
campground3.campground_images << CampgroundImage.new(image: File.new("#{Rails.root}/stock_photos/anzaborrego_2.jpg"))
campground3.campground_images << CampgroundImage.new(image: File.new("#{Rails.root}/stock_photos/anzaborrego_3.jpg"))
User.first.campgrounds << campground3
