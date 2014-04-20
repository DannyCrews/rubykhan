
# RubyKhan: a Khan Academy API gem


[![Gem Version](https://badge.fury.io/rb/rubykhan.png)](http://badge.fury.io/rb/rubykhan)

[![Coverage Status](https://coveralls.io/repos/abigezunt/RubyKhan/badge.png)](https://coveralls.io/r/abigezunt/RubyKhan)

[![Build Status](https://travis-ci.org/abigezunt/RubyKhan.png?branch=master)](https://travis-ci.org/abigezunt/RubyKhan)

This is a wrapper for the [Khan Academy API](http://api-explorer.khanacademy.org/api/v1/).  It is a work in progress, and only supports part of the API.  Any assistance with implementing extra calls would be appreciated!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubykhan'
```

And then execute:

```ruby
$ bundle
```

Or install it yourself as:

```ruby
$ gem install rubykhan
```

## Usage

So far, this gem only accesses the publically available parts of the API.  For authentication, try [Khan Academy OmniAuth gem](https://github.com/dipil-saud/omniauth-khan-academy).

In your main.rb file:

```ruby
require 'rubykhan'
```

Information from Khan academy's API is accessed through topic keywords called "slugs" that you can use in your API requests.  Topics are arranged hierarchically from the most general (e.g. "math", "science", "humanities") to the very specific. 

To see an array of all the nested topic slugs (which you can use for future queries):

```ruby
KhanAcademy::Topic.all
```

You can always pass in a key if you are looking for different information:

```ruby
KhanAcademy::Topic.all('slug')
KhanAcademy::Topic.all('title')
KhanAcademy::Topic.all('node_slug')
```

You can get a Topic object by directly calling `.retrieve`:

```ruby
algebra = KhanAcademy::Topic.retrieve("algebra")

algebra.title
algebra.description
```

More specific topics (e.g. "differential-equations", "buddhist-art", "blood-vessels") can return videos and exercises:

```ruby
buddhist_art = KhanAcademy::Topic.get_exercises("buddhist-art").first
buddhist_art.title
buddhist_art.ka_url
```

```ruby
blood_vessels_videos = KhanAcademy::Topic.get_videos("blood-vessels").first
blood_vessels_videos.description
blood_vessels_videos.title
blood_vessels_videos.ka_url
```

You can also get a list of all Exercises:

```ruby
exercises = KhanAcademy::Exercise.all
```

More information about the Khan Academy API can be found at the [Khan Academy API Explorer](http://api-explorer.khanacademy.org/api/v1/).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## FAQ: 

Q: What's up with the name?

A: It's a pun on [Crossing the Rubicon](https://www.khanacademy.org/humanities/history/ancient-medieval/Ancient/v/a-tour-through-ancient-rome-in-320-c-e).  Julius Caesar would've used Ruby in his conquest of Gaul, and we want you to be able to use Ruby in your  Khan Academy app.  :)

