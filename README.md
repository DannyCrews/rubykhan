
gem 'khan_academy'


Example usage: 

all = KhanAcademy::TopicTree.new
all.topics

# returns a hash where the keys are the main topics and the values are an array of subtopics


getty_museum = KhanAcademy::Topic.new('getty-museum')
description = getty_museum.description

newthing = KhanAcademy::Topic.new('solving-linear-equations-and-inequalities')
newthing.subtopics
