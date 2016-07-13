require 'json'
require 'pathname'

def symlink_manifest
  JSON.parse(File.read("./symlink.json"))
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

task :update do
end

