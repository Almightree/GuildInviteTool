---------------------------------------------------------------
-- Guild Invite Tool - Designed for use by the Greeter Team of the Convert To Raid Guild --
---------------------------------------------------------------

HelloWorld_Text = {}
local channel = "SAY"

SLASH_HELLO_WORLD_ADD1 = "/hwadd"
SLASH_HELLO_WORLD_ADD2 = "/helloworldadd" -- an alias for /hwadd
SlashCmdList["HELLO_WORLD_ADD"] = function(msg)
	local id, text = msg:match("(%S+)%s+(.+)")
	if id and text then
		HelloWorldText[id:lower()] = text
	end
end

SLASH_HELLO_WORLD_SHOW1 = "/hwshow"
SLASH_HELLO_WORLD_SHOW2 = "/helloworldshow" -- an alias for /hwshow
SlashCmdList["HELLO_WORLD_SHOW"] = function(msg)
	local text = HelloWorld_Text[msg:lower()]
	if text then
		SendChatMessage(text, channel)
	end
end

local frame = CreateFrame("Frame")

local function myEventHandler(self, event, msg, sender)
	print(event, sender, msg)
end

frame:RegisterEvent("CHAT_MSG_WHISPER")
frame:SetScript("OnEvent", myEventHandler)