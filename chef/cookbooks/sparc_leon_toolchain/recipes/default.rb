package 'qemu-user'
package 'libc6-i386' # the gaisler toolchain is compiled for i386

directory '/opt'

#url = 'http://www.gaisler.com/anonftp/linux/linux-2.6/toolchains/sparc-linux-4.4.2/sparc-linux-ct-multilib-0.0.7.tar.bz2'
url = 'http://isla-de-muerta.de/~matze/sparc-linux-ct-multilib-0.0.7.tar.bz2'
tar_extract url do
	target_dir '/opt'
	creates '/opt/sparc-linux-4.4.2-toolchains/multilib/bin'
	checksum '334a49f28e8fdad7dbcb0eeb11e078930a67703d86467205925448b526761418'
	compress_char ''
end
