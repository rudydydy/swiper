require 'tempfile'

module Swiper
  class Module < Thor
    include Thor::Actions

    BASE_PATH = 'Classes/Modules'

    APPLICATION_LOGIN_FILES = {
      'Interactor.swift'      => 'Interactor',
      'InteractorInput.swift' => 'InteractorInput',
      'InteractorOutput.swift'=> 'InteractorOutput'
    }

    MODULE_INTERFACE_FILES = {
      'ModuleInterface.swift' => 'ModuleInterface'
    }

    PRESENTER_FILES = {
      'Presenter.swift'       => 'Presenter'
    }

    VIEW_FILES = {
      'ViewInterface.swift'   => 'View',
      'ViewController.swift'  => 'View'
    }

    WIREFRAME_FILES = {
      'Wireframe.swift'       => 'Wireframe'
    }

    Swiper::Module.source_root(File.dirname(__FILE__))

    desc 'list', 'lists all generated VIPER modules'
    def list
      return unless File.exists? BASE_PATH
      module_names = Dir.entries(BASE_PATH).reject { |d| d == '.' || d == '..' }
      print_table module_names.map.with_index { |m, i| [i+1, m] }
    end

    desc 'create NAME', 'adds a new VIPER module with the specified name'
    def create(module_name)
      config = invoke('swiper:commands:configure', [])

      @module          = module_name.camelize
      @prefixed_module = module_name.to_variable_name
      @project         = config[:project]
      @author          = config[:author]
      @date            = Time.now.strftime('%d/%m/%y')
      @year            = Time.now.year

      template_generator(APPLICATION_LOGIN_FILES, "Application Logic")
      template_generator(MODULE_INTERFACE_FILES, "Module Interface")
      template_generator(PRESENTER_FILES, "User Interface/Presenter")
      template_generator(VIEW_FILES, "User Interface/View")
      template_generator(WIREFRAME_FILES, "User Interface/Wireframe")
      empty_directory "#{BASE_PATH}/#{@module}/User Interface/Transition/"

      # rendering dependencies body
      path = Dir::Tmpname.create('dep') { |path| path }
      template('templates/DependenciesBody.swift', path)

      say File.open(path).read + "\n", :yellow
    end

    desc 'destroy NAME', 'destroys VIPER module with the specified name'
    def destroy(module_name)
      @module = module_name.camelize
      module_path = "#{BASE_PATH}/#{@module}"

      if File.exists? module_path
        remove_dir module_path if yes?("Really destroy module: #{@module}? [y/N]")
      else
        say "No such module: #{@module}"
      end
    end

    private
    def template_generator template_files, template_dir
      template_files.each do |file_name, folder|
        template "templates/#{file_name}", "#{BASE_PATH}/#{@module}/#{template_dir}/#{file_name}"
      end
    end
  end
end
