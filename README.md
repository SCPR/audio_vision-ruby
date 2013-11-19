# AudioVision

[![Build Status](https://circleci.com/gh/SCPR/audio_vision-ruby.png?circle-token=15b157b848c82b2bab8abef94055acf1d001f59b)](https://circleci.com/gh/SCPR/audio_vision-ruby)

This is a simple Ruby client for the AudioVision API.
Documentation for the AudioVision API can be found
[**here**](https://github.com/SCPR/api-docs/tree/master/AudioVision/v1).


## Installation

Add this line to your application's Gemfile:

    gem 'audio_vision'


## Usage

### Posts
```ruby
# Find by ID
AudioVision::Post.find(109)

# Find by URL
AudioVision::Post.find_by_url("http://audiovision.scpr.org/319/public-square-thankful-for")

# Find Collection - all parameters are passed directly to API
AudioVision::Post.collection(limit: 10, query: "Los Angeles", category: "video")
```

### Billboards
```ruby
# Find by ID
AudioVision::Billboard.find(4)

# Get the current Billboard
AudioVision::Billboard.current

# Get all Billboards
AudioVision::Billboard.collection
```

### Buckets
```ruby
# Find by UUID (key)
AudioVision::Billboard.find("featured-posts")

# Get all Buckets
AudioVision::Bucket.collection
```


## Contributing
Fork it, fix it, send a PR. `bundle exec rspec` to run tests.
