-- Script Hash: a7a0799380ff1545f81efa07f1deda44f559bfffb15cc6d1221ae783b72f9e9f0982afc429d55e8ed3cc313ceb245406
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
local l__ComponentUtil__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ComponentUtil;
local l__MapBoundsComponent__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "map-bounds-component").MapBoundsComponent;
local l__BlockEngineClientEvents__6 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out.client["block-engine-client-events"]).BlockEngineClientEvents;
local l__default__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function u1.KnitStart(p2)
	l__ComponentUtil__4:componentAdded(l__MapBoundsComponent__5, function(p3)
		print("found map bounds!");
		p2.mapBounds = p3;
	end);
	l__BlockEngineClientEvents__6.PlaceBlock:connect(function(p4)
		if not p2.mapBounds then
			return nil;
		end;
		if not (p4.blockPosition.X < p2.mapBounds.attributes.minX) and not (p2.mapBounds.attributes.maxX < p4.blockPosition.X) and not (p4.blockPosition.Y < p2.mapBounds.attributes.minY) and not (p2.mapBounds.attributes.maxY < p4.blockPosition.Y) and not (p4.blockPosition.Z < p2.mapBounds.attributes.minZ) and not (p2.mapBounds.attributes.maxZ < p4.blockPosition.Z) then
			return;
		end;
		p4:setCancelled(true);
		return nil;
	end);
	l__BlockEngineClientEvents__6.PlaceBlock:connect(function(p5)
		local l__denyRegions__5 = p2.denyRegions;
		local function v6(p6)
			if p6.box then
				local v7 = p5.blockPosition - p6.center;
				if math.abs(v7.X) <= p6.radius.X and math.abs(v7.Z) <= p6.radius.X and math.abs(v7.Y) <= p6.radius.Y then
					p5:setCancelled(true);
				end;
				return nil;
			end;
			if not ((p5.blockPosition * Vector3.new(1, 0, 1) - p6.center * Vector3.new(1, 0, 1)).Magnitude <= p6.radius.X) or not (math.abs(p5.blockPosition.Y - p6.center.Y) <= p6.radius.Y) then
				return;
			end;
			p5:setCancelled(true);
			return nil;
		end;
		for v8, v9 in ipairs(l__denyRegions__5) do
			v6(v9, v8 - 1, l__denyRegions__5);
		end;
	end);
	l__default__7.Client:OnEvent("RemoteName", function(p7)
		if not p7.update then
			p2.denyRegions = p7.blockPlaceDisabledRegions;
			return;
		end;
		local v10 = p7.blockPlaceDisabledRegions;
		local function v11(p8)
			local l__denyRegions__12 = p2.denyRegions;
			table.insert(l__denyRegions__12, p8);
			return #l__denyRegions__12;
		end;
		for v13, v14 in ipairs(v10) do
			v11(v14, v13 - 1, v10);
		end;
	end);
	p2.denyRegions = l__default__7.Client:Get("RemoteName"):CallServer().blockPlaceDisabledRegions;
end;
u1.waitForCFrame = v1.async(function(p9, p10)
	return p9:getCFramesFolder():WaitForChild(p10).Value;
end);
function u1.getCFrame(p11, p12)
	local v15 = p11:getCFramesFolder():FindFirstChild(p12);
	if v15 ~= nil then
		v15 = v15.Value;
	end;
	return v15;
end;
function u1.getCFramesFolder(p13)
	local v16 = p13.mapCFrames:GetAttribute("Setup");
	if v16 == 0 or v16 ~= v16 or v16 == "" or not v16 then
		while p13.mapCFrames.AttributeChanged:Wait() ~= "Setup" do
		
		end;
	end;
	return p13.mapCFrames;
end;
function u1.getMapBounds(p14)
	return p14.mapBounds;
end;
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
