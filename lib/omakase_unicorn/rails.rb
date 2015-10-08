require "omakase_unicorn/rails/version"
require 'rails/generators'

module OmakaseUnicorn
  module Rails
    class ConfigGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path('../..', __FILE__)

      def init
        directory "templates", ".project"
        app_name = File.basename(::Rails.root).to_s
        gsub_file '.project/nginx-site.conf', '{{sock_name}}', app_name
        gsub_file '.project/nginx-site.conf', '{{server_name}}', "#{app_name}.local"
        gsub_file '.project/nginx-site.conf', '{{root_path}}', ::Rails.root.to_s
        gsub_file '.project/unicorn.conf.rb', '{{root_path}}', ::Rails.root.to_s
        gsub_file '.project/unicorn.conf.rb', '{{sock_name}}', app_name
      end
    end
  end
end
