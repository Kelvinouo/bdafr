-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "StunController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__KnitController__2;
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "StunController";
end;
local l__WatchCharacter__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCharacter;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__KnitClient__5 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__ClientSyncEvents__6 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	l__WatchCharacter__2(function(p3, p4)
		if p3 == l__Players__3.LocalPlayer then
			p4:GetAttributeChangedSignal("SnaredUntilTime"):Connect(function()
				if p4:GetAttribute("SnaredUntilTime") ~= -1 then
					local v5 = u4.new();
					v5:GiveTask(l__KnitClient__5.Controllers.SprintController:getMovementStatusModifier():addModifier({
						moveSpeedMultiplier = 0
					}));
					p4:GetAttributeChangedSignal("SnaredUntilTime"):Connect(function()
						v5:DoCleaning();
					end);
				end;
			end);
			p4:GetAttributeChangedSignal("StunnedUntilTime"):Connect(function()
				if p4:GetAttribute("StunnedUntilTime") ~= -1 then
					local v6 = u4.new();
					v6:GiveTask(l__ClientSyncEvents__6.SwordSwing:connect(function(p5)
						p5:setCancelled(true);
					end));
					v6:GiveTask(l__KnitClient__5.Controllers.SprintController:getMovementStatusModifier():addModifier({
						moveSpeedMultiplier = 0
					}));
					p4:GetAttributeChangedSignal("StunnedUntilTime"):Connect(function()
						v6:DoCleaning();
					end);
				end;
			end);
		end;
	end);
end;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function v3.showStatusBubble(p6, p7, p8)
	local v7 = u4.new();
	local l__Head__8 = p7:FindFirstChild("Head");
	if l__Head__8 then
		local u8 = u7("BillboardGui", {
			Parent = l__Head__8, 
			Size = UDim2.fromScale(1, 1), 
			Adornee = l__Head__8, 
			StudsOffsetWorldSpace = Vector3.new(0, 2.5, 0), 
			LightInfluence = 0, 
			Children = { u7("ImageLabel", {
					Image = p8, 
					Size = UDim2.fromScale(1, 1), 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0
				}) }
		});
		v7:GiveTask(function()
			u8:Destroy();
		end);
	end;
	return v7;
end;
u1 = l__KnitClient__5.CreateController;
u1 = u1(v3.new());
return nil;
