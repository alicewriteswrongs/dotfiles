-- open a new iterm window
hs.hotkey.bind("option", "return", function()
	if hs.application.find("iTerm") then
		hs.applescript.applescript([[
			tell application "iTerm"
				create window with default profile
			end tell
		]])
	else
		hs.application.open("iTerm")
	end
end)

hs.hotkey.bind("option", "f", function()
        hs.applescript.applescript([[
                tell application "Finder"
                        make new Finder window
                        activate 
                end tell
        ]])
end)

hs.hotkey.bind("option", "d", function() 
    hs.execute('echo "### $(date)" | pbcopy')
    hs.eventtap.keyStroke("cmd", "v")
end)
