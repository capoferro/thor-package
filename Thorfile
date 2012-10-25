$:.push File.expand_path('../lib', __FILE__)
require 'thor'
require 'thor/scmversion'
require 'thor/package'

::SOURCE_ROOT = File.dirname(__FILE__)
::APPLICATION_NAME = "thor-package"

class ThorPackageProject < Thor
  PROJECT_NAME = "thor-package"
  namespace PROJECT_NAME

  desc "build", "Build the gem"
  def build
    system("gem build -V '#{PROJECT_NAME}.gemspec'")
    FileUtils.mkdir_p(File.join(File.dirname(__FILE__), 'pkg'))
    FileUtils.mv("#{PROJECT_NAME}-#{current_version}.gem", 'pkg')
  end

  desc "install", "Build and install latest to system gems"
  def install
    invoke "build", []
    system("gem install pkg/#{PROJECT_NAME}-#{current_version}.gem")
  end

  desc "release [TYPE]", "Bump version, make a build, and push to Rubygems"
  def release(type='auto')
    @current_version = nil
    invoke "version:bump", [type]
    invoke "build", []
    system("gem push pkg/#{PROJECT_NAME}-#{current_version}.gem")
  end
    
  private
  def current_version
    @current_version ||= ::ThorSCMVersion.versioner.from_path
  end
end
