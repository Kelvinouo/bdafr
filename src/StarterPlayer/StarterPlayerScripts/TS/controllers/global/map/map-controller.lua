-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "MapController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
local u2 = l__KnitController__2;
local l__Workspace__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
function u1.constructor(p1, ...)
	u2.constructor(p1, ...);
	p1.Name = "MapController";
	p1.mapCFrames = l__Workspace__3:WaitForChild("MapCFrames");
	p1.denyRegions = {};
end;
local l__BlockEngineClientEvents__4 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out.client["block-engine-client-events"]).BlockEngineClientEvents;
local l__default__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function u1.KnitStart(p2)
	l__BlockEngineClientEvents__4.PlaceBlock:connect(function(p3)
		local l__denyRegions__5 = p2.denyRegions;
		local function v6(p4)
			if p4.box then
				local v7 = p3.blockPosition - p4.center;
				if math.abs(v7.X) <= p4.radius.X and math.abs(v7.Z) <= p4.radius.X and math.abs(v7.Y) <= p4.radius.Y then
					p3:setCancelled(true);
				end;
				return nil;
			end;
			if not ((p3.blockPosition * Vector3.new(1, 0, 1) - p4.center * Vector3.new(1, 0, 1)).Magnitude <= p4.radius.X) or not (math.abs(p3.blockPosition.Y - p4.center.Y) <= p4.radius.Y) then
				return;
			end;
			p3:setCancelled(true);
			return nil;
		end;
		for v8, v9 in ipairs(l__denyRegions__5) do
			v6(v9, v8 - 1, l__denyRegions__5);
		end;
	end);
	l__default__5.Client:OnEvent("RemoteName", function(p5)
		if not p5.update then
			p2.denyRegions = p5.blockPlaceDisabledRegions;
			return;
		end;
		local v10 = p5.blockPlaceDisabledRegions;
		local function v11(p6)
			local l__denyRegions__12 = p2.denyRegions;
			table.insert(l__denyRegions__12, p6);
			return #l__denyRegions__12;
		end;
		for v13, v14 in ipairs(v10) do
			v11(v14, v13 - 1, v10);
		end;
	end);
	p2.denyRegions = l__default__5.Client:Get("RemoteName"):CallServer().blockPlaceDisabledRegions;
end;
u1.waitForCFrame = v1.async(function(p7, p8)
	return p7:getCFramesFolder():WaitForChild(p8).Value;
end);
function u1.getCFrame(p9, p10)
	local v15 = p9:getCFramesFolder():FindFirstChild(p10);
	if v15 ~= nil then
		v15 = v15.Value;
	end;
	return v15;
end;
function u1.getCFramesFolder(p11)
	local v16 = p11.mapCFrames:GetAttribute("Setup");
	if v16 == 0 or v16 ~= v16 or v16 == "" or not v16 then
		while p11.mapCFrames.AttributeChanged:Wait() ~= "Setup" do
		
		end;
	end;
	return p11.mapCFrames;
end;
u2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
