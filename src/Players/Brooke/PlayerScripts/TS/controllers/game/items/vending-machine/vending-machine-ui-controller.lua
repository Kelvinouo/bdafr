-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "VendingMachineUiController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "VendingMachineUiController";
	p1.hasPreloaded = false;
end;
local l__WatchCollectionTag__1 = v2.WatchCollectionTag;
local l__ContentProvider__2 = v3.ContentProvider;
local l__SoundManager__3 = v2.SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__BedwarsImageId__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__VendingMachineAppWrapper__9 = v1.import(script, script.Parent, "ui", "vending-machine-app-wrapper").VendingMachineAppWrapper;
local l__Players__10 = v3.Players;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__WatchCollectionTag__1("VendingMachine", function(p3)
		if p2.hasPreloaded then
			return nil;
		end;
		p2.hasPreloaded = true;
		l__ContentProvider__2:PreloadAsync({ l__SoundManager__3:createSound(l__GameSound__4.VENDING_ROLL_TICK), l__SoundManager__3:createSound(l__GameSound__4.VENDING_ROLL_PRIZE), u5("ImageLabel", {
				Image = l__BedwarsImageId__6.VENDING_RING
			}) });
	end);
	l__WatchCollectionTag__1("VendingMachine", function(p4)
		local l__Screen__7 = p4:WaitForChild("Screen");
		local u11 = u7.new();
		l__Screen__7.AncestryChanged:Connect(function(p5, p6)
			if p6 == nil then
				u11:DoCleaning();
			end;
		end);
		local u12 = u8.mount(u8.createElement("SurfaceGui", {
			Adornee = l__Screen__7, 
			ResetOnSpawn = false
		}, { u8.createElement(l__VendingMachineAppWrapper__9, {
				vendingMachine = p4
			}) }), l__Players__10.LocalPlayer:WaitForChild("PlayerGui"), "VendingMachine");
		u11:GiveTask(function()
			u8.unmount(u12);
		end);
	end);
end;
local v8 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v5.new());
return nil;
