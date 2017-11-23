# Instrumenter

Instrumenter is a small gem that was created to allow logging with a single request id across multiple microservice backends. The idea here is that you set an `X-Request-Id` header on your edge, and this Gem will allow you to propagate that value through all your various services. For example:

1. CDN edge generates a request id (setting the `X-Request-Id` header)
1. The request goes to your first Rack microservice, which is a Rails app
1. The Rails app then calls another microservice. You add `Instrument.log_event(message)` around your call to the second service, and set the `X-Request-Id` header on the call to the second service to the value of `Instrumenter.instance.request_id`
1. The second service receives the same value for `X-Request-Id` that was generated at the edge
1. The second (and any subsequent services) can continue to easily pass the same `X-Request-Id` header around, allowing you to trace a single request through multiple backends in your logs

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'instrumenter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install instrumenter

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mukaibot/instrumenter. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Instrumenter project’s codebases, issue trackers and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/instrumenter/blob/master/CODE_OF_CONDUCT.md).
