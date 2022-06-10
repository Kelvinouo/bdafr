-- Script Hash: 7d8d3684a55422cbe1f9b3bb3b802e516fe7737723a1f2f6fe6a5e5a1f297b55d000060dd9a87b355b0d0e67f34e35ec
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
local u1 = l__KnitController__4;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "VendingMachineUiController";
	p1.hasPreloaded = false;
end;
local l__WatchCollectionTag__2 = v2.WatchCollectionTag;
local l__ContentProvider__3 = v3.ContentProvider;
local l__SoundManager__4 = v2.SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__BedwarsImageId__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__VendingMachineAppWrapper__10 = v1.import(script, script.Parent, "ui", "vending-machine-app-wrapper").VendingMachineAppWrapper;
local l__Players__11 = v3.Players;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__WatchCollectionTag__2("VendingMachine", function(p3)
		if p2.hasPreloaded then
			return nil;
		end;
		p2.hasPreloaded = true;
		l__ContentProvider__3:PreloadAsync({ l__SoundManager__4:createSound(l__GameSound__5.VENDING_ROLL_TICK), l__SoundManager__4:createSound(l__GameSound__5.VENDING_ROLL_PRIZE), u6("ImageLabel", {
				Image = l__BedwarsImageId__7.VENDING_RING
			}) });
	end);
	l__WatchCollectionTag__2("VendingMachine", function(p4)
		local l__Screen__7 = p4:WaitForChild("Screen");
		local u12 = u8.new();
		l__Screen__7.AncestryChanged:Connect(function(p5, p6)
			if p6 == nil then
				u12:DoCleaning();
			end;
		end);
		local u13 = u9.mount(u9.createElement("SurfaceGui", {
			Adornee = l__Screen__7, 
			ResetOnSpawn = false
		}, { u9.createElement(l__VendingMachineAppWrapper__10, {
				vendingMachine = p4
			}) }), l__Players__11.LocalPlayer:WaitForChild("PlayerGui"), "VendingMachine");
		u12:GiveTask(function()
			u9.unmount(u13);
		end);
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
