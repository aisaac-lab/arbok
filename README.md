# Usage

## without proxy
```
m = Arbok.new()
res = m.get('https://api.ipify.org?format=json')
res.body
```

## with proxy
```
m = Arbok.new(proxy: {
  url: '',
  user: '',
  pass: '',
})
res = m.get('https://api.ipify.org?format=json')
res.body
```

# Installation

```ruby
gem 'arbok', github: 'aisaac-lab/arbok'
```

# Develop
    $ bundle install

## Run spec
    $ bundle exec rspec

## Try
    $ bundle exec irb
    > require 'arbok'