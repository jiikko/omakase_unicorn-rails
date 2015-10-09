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
$ generate_crt_and_key
```

### Generate unicorn.conf.rb, nginx-site.conf
```shell
$ bundle exec rails g omakase_unicorn:rails:config install
```
unicorn.conf.rbとnginx.confが./.project以下に生成されます。
nginx.confはシムリンクを貼るのがおすすめ。

for OSX
```
$ cp ./.project/local.rails.app_name.plist ~/Library/LaunchAgents/
$ launchctl load -w local.rails.app_name
# $ launchctl unload -w local.rails.app_name # delete from launchctl
$ launchctl start local.rails.app_name
```

### Unicorn
### start
```shell
$ bundle exec unicorn -D -c ./.project/unicorn.conf.rb -E development
```
```shell
$ launchctl start local.rails.app_name
```
### upgrade
```shell
$ kill -USR2 `cat ./tmp/pids/unicorn.pid`
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jiikko/omakase_unicorn-rails.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
