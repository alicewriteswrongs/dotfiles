

##labels for email lists
subj = message.subj.downcase
if subj.start_with? '[lpc-c]'
    message.add_label :LPC
end

if subj.start_with? '[tonics]'
    message.add_label :Tonics
end

if subj.start_with? 'arch-general'
    message.add_label :arch-general
end

if subj.start_with? '[sup-talk'
    message.add_label :sup
end

if subj.start_with? '[compsci]'
    message.add_label :hampcompsci
end

#sender based labels
if message.from.email.start_with? 'ryanvcostello@gmail.com'
    message.add_label :friends
end

if message.from.email.start_with? 'leocelo@gmail.com'
    message.add_label :friends
end


if message.from.email.start_with? 'ahgardiner@gmail.com'
    message.add_label :friends
end


if message.from.email.start_with? 'ken.pote@gmail.com'
    message.add_label :family
end


if message.from.email.start_with? 'epote12@gmail.com'
    message.add_label :family
end


if message.from.email.start_with? 'janeself123@gmail.com'
    message.add_label :friends
end




