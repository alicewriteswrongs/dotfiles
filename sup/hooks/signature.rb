## this tells sup which signature file to use, based on which email I'm sending from


if from_email == 'ben.pote@gmail.com'
    "Ben Pote
PGP fingerprint: 695B 9B5D A910 B280 92D1 360E B3BA FECB A7AF C2EF"
elsif from_email == 'axyridis@riseup.net'
    "~*~ alice ~*~
https://keybase.io/aliceriot"
elsif from_email == 'alice.writes.wrongs@gmail.com'
    "~*~ alice ~*~
https://keybase.io/aliceriot"
else
    "~*~ alice ~*~"
end
