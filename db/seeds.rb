
Subject.delete_all
Topic.delete_all
Lyric.delete_all
AudioSnippet.delete_all
LyricLine.delete_all
LyricVersion.delete_all

subj_titles = ['Math', 'Science', 'Literature', 'Vocabulary', 'History', 'Geography', 'English']

lines = ['Twinkle, twinkle little star', 'How I wonder what you are', 'Up above the world so high', 'Like a diamond in the sky']

# Create new subjects with 5 generic topics each!
subj_titles.each do |subj_title|
	subject = Subject.new title: subj_title

	# make 5 dummy topics
	5.times do |i|
		subject.topics << Topic.new( title: "#{subj_title} Topic number #{i}" )
	end

	subject.save

	# add lyrics and audio snippets to first topics in each subject
	topic = subject.topics.first
	
	topic.audio_snippets.create title: 'Test Snippet', source: 'soundcloud', source_url: 'https://soundcloud.com/ahmed-gado-1/sad-piano-alone-in-the-dark'

	lyric = topic.lyrics.create title: 'Test Lyric'

	# create initial lyric version
	lyric_version = lyric.lyric_versions.create title: 'Initial Lyric Version'

	# add lines to dummy lyric_version
	i = 100
	lines.each do |line|
		lyric_version.lyric_lines << LyricLine.new(text: line, order_number: i, version_number: 0, likes: 0, lyric_id: lyric.id )
		i += 100
	end

	lyric.save
	
end


