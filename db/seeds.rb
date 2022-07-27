# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "csv"

filepath = "exhibits.csv"
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
      explainer: explaiiner,
      interactive: interactive
    )
    place.photos.attach(io: img_file, filename: "exhibit_thumbnail_#{title}.jpeg")
    puts "#{exhibit.title} created"
end