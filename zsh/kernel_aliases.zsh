# some aliases for dealing with kernel compilation!
alias cleankernel='make mrproper' # remove previous compilation
alias quemudefault='qemu-system-i386  -m 512 -net nic -net user,hostfwd=tcp:127.0.0.1:2222-:22 vm-cs155/vm-cs155.vmdk'

