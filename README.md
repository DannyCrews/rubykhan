
# RubyKhan: a Khan Academy API gem


[![Gem Version](https://badge.fury.io/rb/rubykhan.png)](http://badge.fury.io/rb/rubykhan)

[![Coverage Status](https://coveralls.io/repos/abigezunt/rubykhan/badge.png)](https://coveralls.io/r/abigezunt/rubykhan)

[![Build Status](https://travis-ci.org/abigezunt/rubykhan.png?branch=master)](https://travis-ci.org/abigezunt/rubykhan)

[![Code Climate](https://codeclimate.com/github/abigezunt/rubykhan.png)](https://codeclimate.com/github/abigezunt/rubykhan)

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

So far, this gem only accesses the publically available parts of the API, but you can request an API key and use OmniAuth to authenticate users using their Khan Academy logins, and to access specific information about users.  Try this [Khan Academy OmniAuth gem](https://github.com/dipil-saud/omniauth-khan-academy).

In your main.rb file:

```ruby
require 'rubykhan'
```

Information from Khan academy's API is accessed through topic keywords called "slugs" that you can use in your API requests.  Topics are arranged hierarchically from the most general (e.g. "math", "science", "humanities") to the very specific. 


You can see an array of all the topic slugs (which you can use for future queries):

```ruby
KhanAcademy::Topic.all
```

You can also get more information about a topic using the `.get_info` method:

```ruby
algebra = KhanAcademy::Topic.get_info('algebra')

algebra.title
algebra.description
algebra.ka_url
```

More specific topics (e.g. "differential-equations") can return videos and exercises.

```ruby
buddhist_art = KhanAcademy::Playlist.get_exercises("buddhist-art")
buddhist_art.image_url
buddhist_art.prerequisites
buddhist_art.title
buddhist_art.tutorial_only
```

```ruby
buddhist_art_videos = KhanAcademy::Playlist.get_videos("buddhist-art")
buddhist_art_videos.description
buddhist_art_videos.title
buddhist_art_videos.ka_url
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

## CONTRIBUTING

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
