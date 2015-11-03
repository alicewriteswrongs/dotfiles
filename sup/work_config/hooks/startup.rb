Dir['/home/benpote/mail/archive/*'].map do |d|
  uri = "maildir:" d
  log "Processing source #{uri}"
  unless SourceManager.source_for uri
    source = Maildir.new uri, true, false, nil, [LabelManager.label_for(File.basename(d))]
    SourceManager.add_source source
    log "Added source #{d}"
  end
end
