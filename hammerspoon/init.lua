-- open a new iterm window
hs.hotkey.bind({"option", "return"}, "return", function()
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
