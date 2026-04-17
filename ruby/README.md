# Ruby Dev Container

Includes: Ruby 3.4, Bundler, gem

## Build

```bash
docker build -t dev-ruby .
```

## Run

```bash
# Basic
docker run --rm -it -v "$PWD":/code dev-ruby

# Persist gems between sessions
docker run --rm -it \
  -v "$PWD":/code \
  -v ruby-gems:/usr/local/bundle \
  dev-ruby
```

## Common commands inside the container

```bash
ruby hello.rb               # run a script
ruby -e "puts 'hello'"     # run inline
irb                         # interactive Ruby shell

gem install <name>          # install a gem globally
gem list                    # list installed gems

bundle init                 # create a Gemfile
bundle add <gem>            # add a gem to Gemfile
bundle install              # install from Gemfile
bundle exec ruby hello.rb   # run with bundled gems

# Testing
bundle exec rspec           # run RSpec tests (if installed)
bundle exec rake test       # run Minitest via Rake
```

See `packages.md` for common gems.
