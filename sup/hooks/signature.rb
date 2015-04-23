## this tells sup which signature file to use, based on which email I'm sending from


if from_email == 'ben.pote@gmail.com'
    "Ben Pote
Public PGP key: https://pgp.mit.edu/pks/lookup?op=get&search=0xB3BAFECBA7AFC2EF
PGP fingerprint: 695B 9B5D A910 B280 92D1 360E B3BA FECB A7AF C2EF"
elsif from_email == 'axyridis@riseup.net'
    "AR
Public PGP key: https://pgp.mit.edu/pks/lookup?op=get&search=0x3D47670F42269A83
PGP fingerprint: 43D1 4BEF 39F7 4027 B02A DC4D 3D47 670F 4226 9A83"
elsif from_email == 'alice.writes.wrongs@gmail.com'
    "~*~ alice ~*~
Public PGP key: https://pgp.mit.edu/pks/lookup?op=get&search=0xB3580CB0CD99F2A4
PGP fingerprint: 4B57 95AF E3F3 404A 46C2 2932 B358 0CB0 CD99 F2A4"
else
    nil
end
