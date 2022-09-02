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
local l__Workspace__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
function u1.constructor(p1, ...)
	l__KnitController__2.constructor(p1, ...);
	p1.Name = "MapController";
	p1.mapCFrames = l__Workspace__2:WaitForChild("MapCFrames");
	p1.denyRegions = {};
end;
local l__BlockEngineClientEvents__3 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out.client["block-engine-client-events"]).BlockEngineClientEvents;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function u1.KnitStart(p2)
	l__BlockEngineClientEvents__3.PlaceBlock:connect(function(p3)
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
		local v8, v9, v10 = ipairs(l__denyRegions__5);
		while true do
			v8(v9, v10);
			if not v8 then
				break;
			end;
			v10 = v8;
			v6(v9, v8 - 1, l__denyRegions__5);		
		end;
	end);
	l__default__4.Client:OnEvent("RemoteName", function(p5)
		if not p5.update then
			p2.denyRegions = p5.blockPlaceDisabledRegions;
			return;
		end;
		local v11, v12, v13 = ipairs(p5.blockPlaceDisabledRegions);
		while true do
			v11(v12, v13);
			if not v11 then
				break;
			end;
			v13 = v11;
			table.insert(p2.denyRegions, v12);		
		end;
	end);
	p2.denyRegions = l__default__4.Client:Get("RemoteName"):CallServer().blockPlaceDisabledRegions;
end;
u1.waitForCFrame = v1.async(function(p6, p7)
	return p6:getCFramesFolder():WaitForChild(p7).Value;
end);
u1.getCFrame = v1.async(function(p8, p9)
	local v14 = p8:getCFramesFolder():FindFirstChild(p9);
	if v14 ~= nil then
		v14 = v14.Value;
	end;
	return v14;
end);
function u1.getCFrameWithoutYield(p10, p11)
	local v15 = p10.mapCFrames;
	if v15 ~= nil then
		v15 = v15:FindFirstChild(p11);
	end;
	local v16 = v15;
	if v16 ~= nil then
		v16 = v16.Value;
	end;
	return v16;
end;
function u1.getCFramesFolder(p12)
	local v17 = p12.mapCFrames:GetAttribute("Setup");
	if v17 == 0 or v17 ~= v17 or v17 == "" or not v17 then
		while p12.mapCFrames.AttributeChanged:Wait() ~= "Setup" do
		
		end;
	end;
	return p12.mapCFrames;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return nil;
