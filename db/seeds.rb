# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Subject.delete_all
Topic.delete_all

['Math', 'Science', 'Literature', 'Vocabulary'].each do |subject|
	Subject.create title: subject
end

Subject.all.each do |subject|
	9.times do |i|
		subject.topics << Topic.new( title: "Topic #{i}" )
	end
	subject.save
end
