require "swiper/version"
require 'thor'
require 'swiper/string_extension'
require 'swiper/module/module'
require 'yaml'

module Swiper
  class Commands < Thor
    include Thor::Actions

    # ----
    # register additional moduls
    register(Swiper::Module, 'module', 'module [COMMAND]', 'Managing modules.')
    Swiper::Commands.source_root(File.dirname(__FILE__))

    # ----
    # initialize VIPER hierarchy
    BASE_FILES = {
      'AppDelegate.swift'     => 'Classes',
      'AppDependencies.swift' => 'Classes'
    }

    PROJECT_FILES = {
      'RootWireframe.swift' => 'Classes/Common/Wireframe'
    }

    desc 'init', 'initializes Swift VIPER project'
    def init
      config = invoke(:configure, [])

      # Classes
      empty_directory 'Classes'

      # Classes/Common
      empty_directory 'Classes/Common'
      empty_directory 'Classes/Common/Categories'
      empty_directory 'Classes/Common/Model'
      empty_directory 'Classes/Common/Store'
      empty_directory 'Classes/Common/Utils'
      empty_directory 'Classes/Common/Wireframe'

      # Classes/Modules
      empty_directory 'Classes/Modules'

      # Add config
      @project = config[:project]
      @author  = config[:author]
      @date    = Time.now.strftime('%d/%m/%y')
      @year    = Time.now.year

      # Generate AppDelegate and AppDependencies files
      BASE_FILES.each do |file_name, folder|
        template "swiper/templates/#{file_name}", "#{folder}/#{file_name}"
      end

      # Generate RootWireframe file
      PROJECT_FILES.each do |file_name, folder|
        template "swiper/templates/#{file_name}", "#{folder}/#{file_name}"
      end
    end

    # ----
    # configuration
    CONFIG_FILE = '.swiper.yml'

    desc 'configure', 'configures project default information'
    def configure
      config = File.exists?(CONFIG_FILE) ? YAML.load_file(CONFIG_FILE) : {}

      project = ask("Project name [#{config[:project]}] ?")
      author = ask("Author [#{config[:author]}] ?")

      config[:project] = project.empty? ? config[:project] || '' : project
      config[:author] = author.empty? ? config[:author] || '' : author

      File.open(CONFIG_FILE, 'w') do |f|
        f.write config.to_yaml
      end

      config
    end
  end
end
