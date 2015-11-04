

##labels for email lists
subj = message.subj.downcase
if subj.start_with? '[lpc-c]'
    message.add_label :LPC
end

if subj.start_with? '[sup]'
    message.add_label :sup
end

if subj.start_with? '[tor-talk]'
    message.add_label :tor
end

if subj.start_with? '[whispersystems]'
    message.add_label :OWS
end

if subj.start_with? '[moonbats]'
    message.add_label :Moonbats
end

if subj.start_with? 'Re: [lpc-c]'
    message.add_label :LPC
end

if message.subj.start_with? '[MLK Boston]'
    message.add_label :MLKBoston
    message.remove_label :inbox
end

if subj.start_with? '[Empowermentors]'
    message.add_label :Empowermentors
end

if subj.start_with? '[GitHub]'
    message.add_label :Github
end

if subj.start_with? '[capital-group]'
    message.add_label :Capital_group
end

if subj.start_with? '[Ns]'
    message.add_label :NS
end

if subj.start_with? '[arch-announce]'
    message.add_label :archannounce
end

if subj.start_with? '[tonics]'
    message.add_label :Tonics
end

if subj.start_with? 'arch-general'
    message.add_label :archgeneral
end

if subj.start_with? '[sup-talk]'
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

if message.from.email.start_with? 'kspilios@bu.edu'
    message.add_label :BI108
end

if message.from.email.start_with? 'smullen@bu.edu'
    message.add_label :BU
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


if message.from.email.start_with? 'notifications@myprewards.com'
    message.remove_label :inbox
end

if message.from.email.start_with? 'semaphore+notifications@renderedtext.com'
  message.remove_label :inbox
  message.add_label :semaphore_alert
end

if message.from.email.start_with? 'do-not-reply@trello.com'
  message.remove_label :inbox
  message.add_label :trello
end

if message.from.email.start_with? 'noreply@newrelic.com'
  message.remove_label :inbox
  message.add_label :new_relic
end

if message.from.email.start_with? 'info@bookbub.com'
  message.remove_label :inbox
  message.add_label :deals_email
end

if message.from.email.start_with? 'notifier@qbox.io'
  message.remove_label :inbox
  message.add_label :qbox_alert
end

