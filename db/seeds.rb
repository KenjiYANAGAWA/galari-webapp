# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "csv"

Exhibit.destroy_all

filepath = "app/assets/exhibits.csv"
puts "reading CSV file"
CSV.foreach(filepath, headers: :first_row) do |row|
    title = row['title']
    subtitle = row['subtitle']
    description = row['description']
    explainer = row['explainer']
    interactive = row['interactive'] == 'true'

    img_file = File.open("app/assets/images/exhibit_thumbnails/#{title}.jpeg")
    exhibit = Exhibit.create!(
      title: title.gsub("_"," "),
      subtitle: subtitle,
      description: description,
      explainer: explainer,
      interactive: interactive
    )
    exhibit.photos.attach(io: img_file, filename: "exhibit_thumbnail_#{title}.jpeg")
    puts "#{exhibit.title} created"
end

User.destroy_all

User.create! (
    email: "1@e.com",
    password: "123123",
    work: "Matsugasaki Hashikamicho, Sakyo Ward, Kyoto, 606-8585",
    home: "541 Nijojocho, Nakagyo Ward, Kyoto, 604-8301"
)

User.create! (
    email: "2@e.com",
    password: "123123",
    work: "",
    home: ""
)

5.times do |i|
    MyExhibit.create! (
        User.first,
        Exhibit.find(i)
    )
end

User.first.my_exhibits.first.selected = true

5.times do |i|
    MyExhibit.create! (
        User.find(2),
        Exhibit.find(i+10)
    )
end

User.second.my_exhibits.last.selected = true
