require "omakase_unicorn/rails/version"
require 'rails/generators'

module OmakaseUnicorn
  module Rails
    class ConfigGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path('../../templates', __FILE__)

      def init
        directory "templates", ".project"

        gsub_file '.project/nginx-site.conf', '{{sock_name}}', 'うぇいうぇい'
        gsub_file '.project/nginx-site.conf', '{{server_name}}', 'もいもい'
        gsub_file '.project/nginx-site.conf', '{{root_path}}', 'びょ'

        gsub_file '.project/unicorn.conf.rb', '{{root_path}}', 'びょ'
        gsub_file '.project/unicorn.conf.rb', '{{sock_name}}', 'うぇいうぇい'
      end
    end
  end
end
