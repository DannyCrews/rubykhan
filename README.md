
# RubyKhan: a Khan Academy API gem


[![Gem Version](https://badge.fury.io/rb/rubykhan.png)](http://badge.fury.io/rb/rubykhan)

[![Coverage Status](https://coveralls.io/repos/abigezunt/rubykhan/badge.png)](https://coveralls.io/r/abigezunt/rubykhan)

[![Build Status](https://travis-ci.org/abigezunt/rubykhan.png?branch=master)](https://travis-ci.org/abigezunt/rubykhan)

[![Code Climate](https://codeclimate.com/github/abigezunt/rubykhan.png)](https://codeclimate.com/github/abigezunt/rubykhan)

```ruby
gem 'rubykhan'
```

```ruby
require 'rubykhan'
```

## Accessing the Khan Academy API

Information from Khan academy's API is accessed through topic keywords called "slugs" that you can use in your API requests.  Topics are arranged hierarchically from the most general (e.g. "math", "science", "humanities") to the very specific. 

To see the whole topic tree hash, you can instantiate a Topic Tree object:

```ruby
all = KhanAcademy::TopicTree.new
```

And you can inspect the whole hierarchy to see what is returned via json:

```ruby
all.topictree
```

You can also retrieve a hash of just the topic slugs to choose from for your further queries:

```ruby
all.topics
```

Another API query returns more detailed information about a topic, including its children, which can be other, more specific topics, or videos and exercises.  The most specific sub-sub-topics have videos and exercises, but the top-level topics don't, so you won't get any exercises for a topic like "math" or even something as specific as "algebra", but the topic "solving-linear-equations-and-inequalities does return some exercises.  It sometimes takes several queries to get to that level.

To query about a topic, instantiate a topic object:

```ruby
getty_museum = KhanAcademy::Topic.new('getty-museum')
```

You can access the json response directly with the `.json` method:

```ruby
getty_museum.json
```

You can also access many attributes with ruby attribute accessor methods:

```ruby
description = getty_museum.description
title = getty_museum.title
url = getty_museum.url
parent_topic = getty_museum.parent_topic
```

To see the list of related subtopics and videos:

```ruby
children = getty_museum.children
```

```ruby
algebra = KhanAcademy::Topic.new('algebra')
algebra.subtopics
```

```ruby
linear_equations = KhanAcademy::Topic.new('solving-linear-equations-and-inequalities')
linear_equations.subtopics
```

More information about the Khan Academy API can be found at the [Khan Academy API Explorer](http://api-explorer.khanacademy.org/api/v1/).

## FAQ: 

Q: What's up with the name?

A: It's a pun on [Crossing the Rubicon](https://www.khanacademy.org/humanities/history/ancient-medieval/Ancient/v/a-tour-through-ancient-rome-in-320-c-e).  Julius Caesar would've used Ruby in his conquest of Gaul, and we want you to be able to use Ruby in your  Khan Academy app.  :)

## CONTRIBUTING

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
