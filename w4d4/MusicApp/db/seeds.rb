# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 Band.create!(:name => "The Beatles")
 Band.create!(:name => "Nirvana")
 Band.create!(:name => "Backstreet Boys")
 Band.create!(:name => "Linkin Park")

Album.create!(:title => "My Bonnie", :yr => 1962, :band_id => 1)
Album.create!(:title => "Please Please Me", :yr => 1963, :band_id => 1)

Track.create!(:song => "My Bonnie", :album_id => 1 , :ord => 1 , :lyrics => "My Bonnie lies over the ocean, My Bonnie lies over the sea, My Bonnie lies over the ocean")
Track.create!(:song => "Skinny Minnie", :album_id => 1 , :ord => 2 , :lyrics => "My skinny Minnie is a crazy chick ,Six foot high and one foot thick Well,  ")
