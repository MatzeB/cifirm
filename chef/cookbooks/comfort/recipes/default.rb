package 'git'
cookbook_file '/root/.gitconfig' do
	source '.gitconfig'
end

package 'vim'
cookbook_file '/root/.vimrc' do
	source '.vimrc'
end

package 'tmux'
