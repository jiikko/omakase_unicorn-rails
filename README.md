# OmakaseUnicorn::Rails

楽して開発環境で使うnginx + unicornな構成を作るためのgemです。
生成するファイルは`自己証明書`, `unicorn.conf.rb`, `nginx-site.conf`です

## Installation

Add this line to your application's Gemfile:

```ruby
group :development do
  gem 'omakase_unicorn-rails', 'jiikko/omakase_unicorn-rails'
end
```

And then execute:

    $ bundle

## Usage

### Generate 各所ファイル
```shell
$ init的ななにかのコマンド
```
自己証明書が不要な場合は`--unicorn` , `--nginx`を付加してください。
```shell
$ init的ななにかのコマンド --unicorn --nginx
```
unicorn.conf.rbとnginx.confが.project以下に生成されるので、nginx.confはシムリンク貼るのがおすすめ。

### Start unicorn
```
$ bundle exec unicorn -D -c ./.project/unicorn.conf.rb -E development
```
### Upgrade unicorn
```shell
$ kill -USR2 `cat ./tmp/pids/unicorn.pid`
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jiikko/omakase_unicorn-rails.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

