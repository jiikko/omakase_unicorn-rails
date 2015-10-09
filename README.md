# OmakaseUnicorn::Rails

開発環境で使うnginx と unicornの設定ファイルを作成するgemです。

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omakase_unicorn-rails', github: 'jiikko/omakase_unicorn-rails', group: :development
```

And then execute:

    $ bundle

## Usage

### Generate unicorn.conf.rb, nginx-site.conf
```shell
$ bundle exec rails g omakase_unicorn:rails:config install
```
unicorn.conf.rb, nginx-site.conf, launchd用plistが./.project以下に生成されます。
```shell
# unicorn
$ bundle exec unicorn -D -c ./.project/unicorn.conf.rb -E development
# nginx
$ sudo ln ./.project/nginx-site.conf /etc/nginx/conf.d/
```

### for OSX
```
$ cp ./.project/local.rails.app_name.plist ~/Library/LaunchAgents/
$ launchctl load -w ~/Library/LaunchAgents/local.rails.app_name.plist
$ launchctl start local.rails.app_name
```

### Generate 自己証明書
```shell
openssl genrsa -out server.key 2048
openssl req -new -key server.key -out server.csr -subj '/C=JP/ST=Tokyo/L=Tokyo/O=Example Ltd./OU=Web/CN=example.com'
openssl x509 -in server.csr -days 3650 -req -signkey server.key > server.crt
rm server.csr
sudo mkdir -p /etc/ssl/certs
sudo mkdir -p /etc/ssl/private
sudo mv server.crt /etc/ssl/certs/ssl-cert-snakeoil.pem;
sudo mv server.key /etc/ssl/private/ssl-cert-snakeoil.key;
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jiikko/omakase_unicorn-rails.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
