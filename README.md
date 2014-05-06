How many times your deploys were failed, because you forgot to update `.yml` files on server... No more!

Tamplier gem checks, that all keys from any `.yml.sample` files are actually exist in real `.yml` files.
That allows to detect configuration problems earlier and spend less time on deployment problems investigations.

Gem also provides command line utility to quickly setup fresh development environment by copying or symlinking `.yml.sample` files.

## Installation

Add this line to your application's Gemfile:

    gem 'tamplier'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tamplier

## Usage

Being included in Rails application, gem checks, that current environment configuration if valid (`.yml` files, backed by `.yml.sample` files have same set of keys). If configuration is not _complete_, exception will be raised and application will not start.

Gem provides a command line utility `tamplier` which allows to perform configuration check.

To check `.yml` files in `config` subdirectory of current path, use

    $ tamplier check [-e ENV]


## Contributing

1. Fork it ( https://github.com/maksar/tamplier/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
