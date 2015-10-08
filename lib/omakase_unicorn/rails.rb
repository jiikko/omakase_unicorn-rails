require "omakase_unicorn/rails/version"
require 'rails/generators'

module OmakaseUnicorn
  module Rails
    class ConfigGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path('../..', __FILE__)

      def init
        directory "templates", ".project"
        gsub_file '.project/nginx-site.conf', '{{sock_name}}', 'aaa'
        gsub_file '.project/nginx-site.conf', '{{server_name}}', 'bbb'
        gsub_file '.project/nginx-site.conf', '{{root_path}}', 'zzz'
        gsub_file '.project/unicorn.conf.rb', '{{root_path}}', 'xxx'
        gsub_file '.project/unicorn.conf.rb', '{{sock_name}}', 'aaaa'
      end
    end
  end
end
