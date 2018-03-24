# Airtable Ruby SDK

This is an unofficial Ruby gem for interacting with Airtable API. Contributions are very much welcome.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'airtable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install airtable

Initial setup for the gem, put it in initializer or just before you call the client:

```ruby
Airtable.configure do |config|
  config.api_key = "YOUR_API_KEY"
end

client = Airtable.client(base_uid: 'airtablebaseuid')
```


## Usage

#### Fetching records

To retrieve records from a table inside a base, you can do this:

```ruby
client.list_records(table_name: 'tablename', params: {})
```

fill the params hash with a query to filter out the records. By default, this gem will retrieve 100 records at once, so you may want to add max_records key to the params like this: 

```ruby
client.list_records(table_name: 'tablename', params: { max_records: 3 })
```

At the moment, the only default values for any query param key is for ```max_records```.


#### Retrieve a record

To retrieve a specific record from a table, you can do this:

```ruby
client.retrieve_record(table_name: 'tablename', record_uid: 'airtable_record_uid')
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/galliani/airtable_client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Airtable Ruby SDK project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/galliani/airtable_client/blob/master/CODE_OF_CONDUCT.md).
