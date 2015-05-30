## this tells sup which signature file to use, based on which email I'm sending from


if from_email == 'ben.pote@gmail.com'
    "Ben Pote
PGP fingerprint: 695B 9B5D A910 B280 92D1 360E B3BA FECB A7AF C2EF"
elsif from_email == 'axyridis@riseup.net'
    "~*~ alice ~*~
PGP fingerprint: 43D1 4BEF 39F7 4027 B02A DC4D 3D47 670F 4226 9A83"
elsif from_email == 'alice.writes.wrongs@gmail.com'
    "~*~ alice ~*~
PGP fingerprint: 43D1 4BEF 39F7 4027 B02A DC4D 3D47 670F 4226 9A83"
else
    "~*~ alice ~*~"
end
