-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "YetiAbilityController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local l__GetTarmacAssetFromPath__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers").GetTarmacAssetFromPath;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__BLOCK_SIZE__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "partcache").out);
local l__Workspace__5 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
function v6.constructor(p1)
	l__KnitController__5.constructor(p1);
	p1.Name = "YetiAbilityController";
	p1.random = Random.new();
	p1.frozenBlockParts = {};
	local v8 = l__GetTarmacAssetFromPath__1({ "blocks", "ice_frost_1" });
	local v9 = {};
	local v10, v11, v12 = ipairs(Enum.NormalId:GetEnumItems());
	while true do
		v10(v11, v12);
		if not v10 then
			break;
		end;
		v12 = v10;
		table.insert(v9, (u2("Decal", {
			Texture = v8.s, 
			Face = v11, 
			ZIndex = 2, 
			Transparency = 1
		})));	
	end;
	p1.partCache = u4.new(u2("Part", {
		Size = Vector3.new(l__BLOCK_SIZE__3, l__BLOCK_SIZE__3, l__BLOCK_SIZE__3), 
		Position = Vector3.new(0, 0, 0), 
		CanCollide = false, 
		Anchored = true, 
		Transparency = 1, 
		Children = v9
	}), 100);
	p1.partCache:SetCacheParent((u2("Folder", {
		Name = "FrozenBlockCache", 
		Parent = l__Workspace__5.Terrain
	})));
end;
local l__BlockEngineRemotes__6 = v2.BlockEngineRemotes;
local l__BlockEngine__7 = v2.BlockEngine;
local l__SoundManager__8 = v3.SoundManager;
local l__GameSound__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__EntityUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
function v6.KnitStart(p2)
	l__KnitController__5.KnitStart(p2);
	l__BlockEngineRemotes__6.Client:OnEvent("RemoteName", function(p3)
		local v13 = tostring(l__BlockEngine__7:getWorldPosition(p3.blockRef.blockPosition));
		local v14 = p2.frozenBlockParts[v13];
		if v14 then
			l__SoundManager__8:playSound(l__GameSound__9.BREAK_FROZEN_BLOCK, {
				position = v14.Position
			});
			p2.frozenBlockParts[v13] = nil;
			p2.partCache:ReturnPart(v14);
		end;
	end);
	l__default__10.Client:OnEvent("RemoteName", function(p4)
		if p4.senderEntityInstance then
			local v15 = {};
			local v16 = l__EntityUtil__11:getEntity(p4.senderEntityInstance);
			if v16 ~= nil then
				v16 = v16:isLocalPlayer();
			end;
			if v16 then
				local v17 = nil;
			else
				v17 = p4.position;
			end;
			v15.position = v17;
			l__SoundManager__8:playSound(l__GameSound__9.YETI_ROAR, v15);
		end;
		local v18, v19, v20 = ipairs(p4.frozenBlocks);
		while true do
			v18(v19, v20);
			if not v18 then
				break;
			end;
			v20 = v18;
			local v21 = tostring(v19.position);
			if p2.frozenBlockParts[v21] == nil then
				local v22 = p2:makeIceBlock(v19.position);
				p2.frozenBlockParts[v21] = v22;
				p2:tweenInIce(v22, (v19.position - p4.position).Magnitude);
				task.delay(v19.expirationTime - l__Workspace__5:GetServerTimeNow(), function()
					if p2.frozenBlockParts[v21] ~= nil then
						p2:tweenOutIce(v22):andThen(function()
							p2.frozenBlockParts[v21] = nil;
							p2.partCache:ReturnPart(v22);
						end);
					end;
				end);
			end;		
		end;
	end);
end;
local l__OutQuad__12 = v4.OutQuad;
local u13 = v3.ConstantManager.registerConstants(script, {
	TweenInTime = 0.5
});
local l__default__14 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__InQuart__15 = v4.InQuart;
v6.tweenInIce = v1.async(function(p5, p6, p7)
	local v23 = l__OutQuad__12(p7, u13.TweenInTime, 2.5, 35);
	local v24 = {};
	local v25 = 0;
	local v26, v27, v28 = ipairs((p6:GetChildren()));
	while true do
		v26(v27, v28);
		if not v26 then
			break;
		end;
		v28 = v26;
		if v27:IsA("Decal") == true then
			v25 = v25 + 1;
			v24[v25] = v27;
		end;	
	end;
	l__default__14(v23, l__InQuart__15, function(p8)
		local v29, v30, v31 = ipairs(v24);
		while true do
			v29(v30, v31);
			if not v29 then
				break;
			end;
			v31 = v29;
			v30.Transparency = p8;		
		end;
	end, 1, 0.45 + p5.random:NextNumber(-0.1, 0.2)):Wait();
end);
v6.tweenOutIce = v1.async(function(p9, p10)
	local v32 = p9.random:NextNumber(1, 3);
	local v33 = {};
	local v34 = 0;
	local v35, v36, v37 = ipairs((p10:GetChildren()));
	while true do
		v35(v36, v37);
		if not v35 then
			break;
		end;
		v37 = v35;
		if v36:IsA("Decal") == true then
			v34 = v34 + 1;
			v33[v34] = v36;
		end;	
	end;
	l__default__14(v32, l__InQuart__15, function(p11)
		local v38, v39, v40 = ipairs(v33);
		while true do
			v38(v39, v40);
			if not v38 then
				break;
			end;
			v40 = v38;
			v39.Transparency = p11;		
		end;
	end, v33[1].Transparency, 1):Wait();
end);
local l__GameQueryUtil__16 = v3.GameQueryUtil;
function v6.makeIceBlock(p12, p13)
	local v41 = p12.partCache:GetPart();
	v41.Position = p13;
	l__GameQueryUtil__16:setQueryIgnored(v41, true);
	return v41;
end;
local v42 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v6.new());
return nil;
