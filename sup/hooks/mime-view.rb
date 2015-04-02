# filename has already been shellescaped
pid = Process.spawn("xdg-open", filename,
                    :out => '/dev/null',
                    :err => '/dev/null')

Process.detach pid

true
