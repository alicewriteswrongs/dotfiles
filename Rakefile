require 'json'
require 'pathname'
require 'pry'

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
    symlink_manifest["directories"].each { |dirname| Dir.new(expand(dirname)) }
  end

  task :symlink_dotfiles => [:create_dotfile_dirs] do
    symlink_manifest["dotfiles"].each do |symlink|
      dotfile_path = expand(symlink[0])
      symlink_path = expand(symlink[1])
      if File.exists?(symlink_path) && !contains_dotfiles(symlink_path)
        system "rm #{symlink_path}"
        system "ln -s #{dotfile_path} #{symlink_path}"
      end
    end
  end

  task :initialize_submodules do
    sh "git submodule init"
    sh "git submodule update"
  end

  task :update_submodules => [:initialize_submodules] do
    Dir.chdir("extras")
    Dir.entries(Dir.pwd).keep_if { |s| s != "." && s != ".." }.each do |submodule_dir|
      git_pull(submodule_dir)
    end
  end

  task :install_extras => [:initialize_submodules] do
    sh "./extras/fzf/install"
  end
end

namespace :packages do
  def arch_manifest
    get_json("./manifest/arch_packages.json")
  end

  def package_installed?(pkg_name)
    sh "pacman -Qs #{pkg_name}"
  end

  task :update_lists do
    sh "sudo pacman -Syy --noconfirm"
  end

  task :update_packages => [:update_lists] do
    sh "sudo pacman -Syyu --noconfirm"
  end

  task :install_packages => [:update_packages] do
    arch_manifest["repos"].each do |pkg|
      sh "pacman -Qs #{pkg}" do |ok, res|
        sh "sudo pacman -S #{pkg} --noconfirm" if !ok
      end
    end
  end

  task :install_python_dependencies do
  end
end

namespace :system_configuration do
  task :set_default_applications do
    sh "xdg-mime default chromium.desktop x-scheme-handler/http"
    sh "xdg-mime default chromium.desktop x-scheme-handler/https"
    sh "xdg-mime default chromium.desktop text/html"
  end

  task :change_shell do
    sh "chsh -s $(which zsh)"
  end

  task :setup => [:set_default_applications, :change_shell] do
  end
end

namespace :vim do
  vim_dir = expand "~/.vim"

  task :clone_vundle do
    sh "git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim" if ! Dir.exists? expand("~/.vim/bundle/Vundle.vim")
  end

  task :install_packages do
    sh "vim +PluginInstall +qall"
  end

  task :setup_ycm do
    cd expand("~/.vim/bundle/youcompleteme")
    sh "python install.py --tern-completer --gocode-completer --clang-completer"
  end

  task :setup => [:clone_vundle, :install_packages, :setup_ycm] do
    mkdir vim_dir.to_s << "backup"
    mkdir vim_dir.to_s << "undo"
    puts "Vim setup complete!"
  end
end

namespace :i3 do
  url = "git@github.com:Airblader/i3.git"
  dir = expand "~/Code/i3-gaps"

  task :clone do
    sh "git clone #{url} #{dir}" if ! Dir.exists? dir
  end

  task :build do
    cd dir
    sh "git checkout gaps"
    sh "git pull"
    sh "make"
  end

  task :install => [:clone, :build] do
    sh "sudo make install"
  end
end

task default: ["packages:update_packages"]
task setup: [
  "packages:install_packages",
  "dotfiles:symlink_dotfiles",
  "dotfiles:install_extras",
  "vim:setup",
  "i3:install"
]
task vim: ["vim:setup"]
