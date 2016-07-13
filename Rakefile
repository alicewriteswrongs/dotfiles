require 'json'
require 'pathname'

def get_json(relpath)
  JSON.parse(File.read(relpath))
end

namespace :dotfiles do 
  def symlink_manifest
    get_json("./symlink.json")
  end

  def expand(partial_path)
    Pathname(partial_path).expand_path
  end

  def contains_dotfiles(path)
    path.to_s.match(/dotfiles/)
  end

  task :create_dotfiles_dirs do
    symlink_manifest["directories"].each do |dirname|
      Dir.new(expand(dirname))
    end
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
    get_json("./arch/arch_packages.json")
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
end

task default: ["dotfiles:symlink_dotfiles"]
task update: ["packages:update_packages"]
