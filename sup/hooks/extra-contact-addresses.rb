`goobook query ''`.split("\n").map do |line|
  matches = line.match(/^(?<email>[^\s]+)\t(?<name>[^\t]+)\t.*$/)
  "#{matches[:name]} <#{matches[:email]}>" if matches
end.compact
