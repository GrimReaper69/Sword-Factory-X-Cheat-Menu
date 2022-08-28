--------------------------------------------------- [ Cheat Manager ] ---------------------------------------------------

local AutoSoulTankRefillEnabled = false
local AutoSoulTankRefillDelay = 60
local AntiAfkEnabled = false
local AntiAfkDelay = 20
local ServiceConfig = {[1] = 0, [2] = "SoulTankService", [3] = "AddSouls", [4] = {}}
local VirtualInputManager = game:GetService("VirtualInputManager")

function AutoSoulTankRefill()
	while AutoSoulTankRefillEnabled do
        game:GetService("ReplicatedStorage").Framework.RemoteFunction:InvokeServer(unpack(ServiceConfig))
        wait(AutoSoulTankRefillDelay)
    end
end

function AntiAfk()
	while AntiAfkEnabled do
        VirtualInputManager:SendMouseButtonEvent(1, 1, 0, true, game, 1)
        VirtualInputManager:SendMouseButtonEvent(1, 1, 0, false, game, 1)
        wait(AntiAfkDelay)
    end
end

--------------------------------------------------- [ Cheat Menu ] ---------------------------------------------------

local UIL = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = UIL:MakeWindow({Name = "SWORD FACTORY X CHEAT MENU (VERSION 1.0)", HidePremium = true,
                                    SaveConfig = true, ConfigFolder = "SFXCM",
                                    IntroEnabled = true, IntroText = "SWORD FACTORY X CHEAT MENU"
                                })

local SoulTankTab = Window:MakeTab({
	Name = "SOUL TANK",
	PremiumOnly = false
})

SoulTankTab:AddToggle({
	Name = "AUTO REFILL SOUL TANK",
	Default = false,
	Save = true,
    Flag = "AutoSoulTankRefillEnabled",
	Callback = function(Value) AutoSoulTankRefillEnabled = Value AutoSoulTankRefill() end
})

SoulTankTab:AddSlider({
	Name = "AUTO REFILL DELAY",
	Min = 1,
	Max = 300,
	Default = 60,
	Increment = 1,
	ValueName = "DELAY (SECONDS)",
	Save = true,
    Flag = "AutoSoulTankRefillDelay",
	Callback = function(Value) AutoSoulTankRefillDelay = Value end
})

local AntiAfkTab = Window:MakeTab({
	Name = "ANTI AFK",
	PremiumOnly = false
})

AntiAfkTab:AddParagraph("NOTE", "Anti afk auto clicks to avoid getting kicked for being afk over 20 minutes.")

AntiAfkTab:AddToggle({
	Name = "PREVENT GETTING KICKED FOR BEING AFK",
	Default = false,
	Save = true,
    Flag = "AntiAfkEnabled",
	Callback = function(Value) AntiAfkEnabled = Value AntiAfk() end
})

AntiAfkTab:AddSlider({
	Name = "ANTI AFK DELAY",
	Min = 1,
	Max = 60,
	Default = 20,
	Increment = 1,
	ValueName = "DELAY (SECONDS)",
	Save = true,
    Flag = "AntiAfkDelay",
	Callback = function(Value) AntiAfkDelay = Value end
})

local ChangeLogTab = Window:MakeTab({
	Name = "CHANGE LOG",
	PremiumOnly = false
})

ChangeLogTab:AddLabel("WHAT'S NEW?")
ChangeLogTab:AddParagraph("VERSION 1.0 - (8/28/2022)", "• Added option to auto refill soul tank\n• Added option to afk without being disconnected\n• Added change log\n• Added credits\n• Added auto save & auto load feature\n• Added notifications")

local CreditsTab = Window:MakeTab({
	Name = "CREDITS",
	PremiumOnly = false
})

CreditsTab:AddLabel("CREDITS")
CreditsTab:AddParagraph("CREATED BY", "GrimReaper")
CreditsTab:AddParagraph("UI DESIGNER", "GrimReaper")
CreditsTab:AddParagraph("SCRIPTER", "GrimReaper")
CreditsTab:AddParagraph("ORIGINAL CONCEPT/IDEA", "GrimReaper, GDGGlelXD")

UIL:Init()
----------------------------------------------------------------------------------------------------------------------
