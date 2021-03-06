require "omakase_unicorn/rails/version"
require 'rails/generators'

module OmakaseUnicorn
  module Rails
    class ConfigGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path('../..', __FILE__)

      def init
        directory "templates/conf", ".project"
        copy_file "templates/plist/local.rails.app.plist", ".project/local.rails.#{app_name}.plist"

        gsub_file '.project/nginx-site.conf', '{{sock_name}}', app_name
        gsub_file '.project/nginx-site.conf', '{{server_name}}', "#{app_name}.local"
        gsub_file '.project/nginx-site.conf', '{{root_path}}', root_path

        gsub_file '.project/unicorn.conf.rb', '{{root_path}}', root_path
        gsub_file '.project/unicorn.conf.rb', '{{sock_name}}', app_name

        gsub_file ".project/local.rails.#{app_name}.plist", '{{app_name}}', app_name
        gsub_file ".project/local.rails.#{app_name}.plist", '{{root_path}}', root_path
        gsub_file ".project/local.rails.#{app_name}.plist", '{{gem_home}}', File.dirname(`which bundle`).to_s.gsub("/bin", "")
        gsub_file ".project/local.rails.#{app_name}.plist", '{{bundle_path}}', File.dirname(`which bundle`).strip
        gsub_file ".project/local.rails.#{app_name}.plist", '{{ruby_path}}', File.dirname(`which ruby`).strip
      end

      private

      def root_path
        ::Rails.root.to_s
      end

      def app_name
        File.basename(::Rails.root).to_s
      end
    end
  end
end
