# OmakaseUnicorn::Rails

開発環境で使うnginx と unicornの設定ファイルを作成するgemです。
自己証明書の作成もできます。

## Installation

Add this line to your application's Gemfile:

```ruby
group :development do
  gem 'omakase_unicorn-rails', github: 'jiikko/omakase_unicorn-rails'
end
```

And then execute:

    $ bundle

## Usage

### Genereate 自己証明書
need sudo
```shell
./bin/generate_crt_and_key
```

### Generate unicorn.conf.rb, nginx-site.conf
```shell
$ init的ななにかのコマンド
```
unicorn.conf.rbとnginx.confが./.project以下に生成されます。
nginx.confはシムリンクを貼るのがおすすめ。

### Unicorn
### start
```
$ bundle exec unicorn -D -c ./.project/unicorn.conf.rb -E development
```
### upgrade
```shell
$ kill -USR2 `cat ./tmp/pids/unicorn.pid`
```

## TODO
* generate launchd-plist


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jiikko/omakase_unicorn-rails.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

