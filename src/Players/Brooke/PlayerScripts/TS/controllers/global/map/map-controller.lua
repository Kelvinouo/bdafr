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
		for v10, v11 in ipairs(p5.blockPlaceDisabledRegions) do
			table.insert(p2.denyRegions, v11);
		end;
	end);
	p2.denyRegions = l__default__5.Client:Get("RemoteName"):CallServer().blockPlaceDisabledRegions;
end;
u1.waitForCFrame = v1.async(function(p6, p7)
	return p6:getCFramesFolder():WaitForChild(p7).Value;
end);
function u1.getCFrame(p8, p9)
	local v12 = p8:getCFramesFolder():FindFirstChild(p9);
	if v12 ~= nil then
		v12 = v12.Value;
	end;
	return v12;
end;
function u1.getCFramesFolder(p10)
	local v13 = p10.mapCFrames:GetAttribute("Setup");
	if v13 == 0 or v13 ~= v13 or v13 == "" or not v13 then
		while p10.mapCFrames.AttributeChanged:Wait() ~= "Setup" do
		
		end;
	end;
	return p10.mapCFrames;
end;
u2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
