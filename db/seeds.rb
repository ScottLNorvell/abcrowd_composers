
Subject.delete_all
Topic.delete_all


# Create new subjects with 5 generic topics each!
['Math', 'Science', 'Literature', 'Vocabulary', 'History', 'Geography', 'English'].each do |subj_title|
	subject = Subject.new title: subj_title

	# make 
	5.times do |i|
		subject.topics << Topic.new( title: "#{subj_title} Topic number #{i}" )
	end

	subject.save

	topic = subject.topics.first
	topic.lyrics.create 
end


