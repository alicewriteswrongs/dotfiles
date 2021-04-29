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
    %x{git checkout master}
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

  task :create_dotfile_dirs do
    symlink_manifest["directories"].each do |dirname| 
      name = expand dirname
      Dir.mkdir name unless Dir.exist? name
    end
  end

  task :symlink_dotfiles => [:create_dotfile_dirs] do
    symlink_manifest["dotfiles"].each do |symlink|
      dotfile_path = expand(symlink[0])
      symlink_path = expand(symlink[1])
      if !contains_dotfiles(symlink_path)
        if File.symlink?(symlink_path) || File.exists?(symlink_path)
          puts "removing :: #{symlink_path}"
        system "rm #{symlink_path}"
        end
      end
      puts "symlinking :: #{dotfile_path} -> #{symlink_path}"
      system "ln -s #{dotfile_path} #{symlink_path}"
    end
  end

  task :initialize_submodules do
    sh "git submodule init"
    sh "git submodule update"
  end
end

namespace :brew do
  def brew_manifest
    get_json("./manifest/brew.json")
  end

  task :install_homebrew do
    puts "checking for homebrew installation..."
    sh "which brew" do |ok|
      if ok
        puts "homebrew already installed!"
      else
        puts "installing homebrew..."
        sh '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
      end
    end
    puts "done installing homebrew"
  end

  task :taps do
    brew_manifest["taps"].each do |tap|
      sh "brew tap #{tap}"
    end
  end

  task :install_casks => [:taps] do
    puts "installing homebrew casks..."
    brew_manifest["casks"].each do |cask|
      sh "brew install --cask #{cask}"
    end
    puts "done installing homebrew casks"
  end

  task :install_formulae do
    puts "installing hombrew formulae..."
    brew_manifest["formulae"].each do |formula|
      sh "brew install #{formula}"
    end
    puts "done installing hombrew formulae"
  end

  task :install => [:install_homebrew, :taps, :install_casks, :install_formulae] do
    puts "done installing homebrew and packages!"
  end
end

namespace :vim do
  task :copy_vim_plug do
    sh "curl -fLo \"${XDG_DATA_HOME:-$HOME/.local/share}\"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  end

  task :install_packages do
    sh "nvim +PlugInstall +qall"
  end

  task :update do
    sh "nvim +PlugUpdate +qall"
  end

  task :setup => [:copy_vim_plug, :install_packages] do
    puts "Vim setup complete!"
  end
end

task vim: ["vim:setup"]
task default: [
  "dotfiles:symlink_dotfiles",
  "dotfiles:initialize_submodules",
  "brew:install",
  "vim:setup",
]
