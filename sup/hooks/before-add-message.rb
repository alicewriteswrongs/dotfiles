

##labels for email lists
subj = message.subj.downcase
if subj.start_with? '[lpc-c]'
    message.add_label :LPC
end

if subj.start_with? '[tonics]'
    message.add_label :Tonics
end

if subj.start_with? 'arch-general'
    message.add_lavel :arch-general
end

if subj.start_with? '[sup-talk'
    message.add_label :sup
end

if subj.start_with? '[compsci]'
    message.add_label :hampcompsci
end
