require 'json'
require 'pathname'

def get_json(relpath)
  JSON.parse(File.read(relpath))
end

def expand(partial_path)
  Pathname(partial_path).expand_path
end

def git_pull(dir = Dir.pwd)
  Dir.chdir(dir) do
    status = %x{git pull}
    puts status unless status =~ /Already up-to-date\./
  end
end

namespace :dotfiles do 
  def symlink_manifest
    get_json("./manifest/symlink.json")
  end

  def contains_dotfiles(path)
    path.to_s.match(/dotfiles/)
  end

  task :create_dotfiles_dirs do
    symlink_manifest["directories"].each { |dirname| Dir.new(expand(dirname)) }
  end

  task :symlink_dotfiles => [:create_dotfiles_dirs] do
    symlink_manifest["dotfiles"].each do |symlink|
      dotfile_path = expand(symlink[0])
      symlink_path = expand(symlink[1])
      if File.exists?(symlink_path) && !contains_dotfiles(symlink_path)
        system "rm #{symlink_path}"
        system "ln -s #{dotfile_path} #{symlink_path}"
      end
    end
  end
end

namespace :packages do
  def arch_manifest
    get_json("./manifest/arch_packages.json")
  end

  task :update_lists do
    sh "sudo pacman -Syy"
  end

  task :update_packages => [:update_lists] do
    sh "sudo pacman -Syyu"
  end

  task :install_packages => [:update_packages] do
    arch_manifest["repos"].each do |pkg|
      sh "sudo pacman -S #{pkg}"
    end
  end

  task :install_python_dependencies do
  end
end

namespace :system_configuration do
  task :set_default_applicatons do
    sh "xdg-mime default chromium.desktop x-scheme-handler/http"
    sh "xdg-mime default chromium.desktop x-scheme-handler/https"
    sh "xdg-mime default chromium.desktop text/html"
  end

  task :update_submodules do
  end
end

task default: ["packages:update_packages"]
task setup: [
  "packages:install_packages",
  "dotfiles:symlink_dotfiles"
]
