# OmakaseUnicorn::Rails

This gem generate unicorn.conf.rb and nginx.conf to use at development.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omakase_unicorn-rails'
```

And then execute:

    $ bundle

## Usage

### Generate unicorn.conf.rb, nginx-site.conf
```shell
[~/sites/app_name]$ bundle exec rails generate omakase_unicorn:rails:config install
      create  .project
      create  .project/nginx-site.conf
      create  .project/unicorn.conf.rb
      create  .project/local.rails.app_namea.plist
        gsub  .project/nginx-site.conf
        gsub  .project/nginx-site.conf
        gsub  .project/nginx-site.conf
        gsub  .project/unicorn.conf.rb
        gsub  .project/unicorn.conf.rb
        gsub  .project/local.rails.app_name.plist
        gsub  .project/local.rails.app_name.plist
        gsub  .project/local.rails.app_name.plist
        gsub  .project/local.rails.app_name.plist
        gsub  .project/local.rails.app_name.plist
```
```shell
# nginx
$ sudo ln ./.project/nginx-site.conf /etc/nginx/conf.d/
# unicorn
$ bundle exec unicorn -D -c ./.project/unicorn.conf.rb -E development
```

#### for OSX
```
$ cp ./.project/local.rails.app_name.plist ~/Library/LaunchAgents/
$ launchctl load -w ~/Library/LaunchAgents/local.rails.app_name.plist
$ launchctl start local.rails.app_name
```

### Generate self-signed certificate
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
