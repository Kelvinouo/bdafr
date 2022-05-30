-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions"));
local v5 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v7 = setmetatable({}, {
	__tostring = function()
		return "YetiAbilityController";
	end, 
	__index = l__KnitController__6
});
v7.__index = v7;
function v7.new(...)
	local v8 = setmetatable({}, v7);
	return v8:constructor(...) and v8;
end;
local u1 = l__KnitController__6;
local l__GetTarmacAssetFromPath__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers").GetTarmacAssetFromPath;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__BLOCK_SIZE__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "partcache").out);
local l__Workspace__6 = v5.Workspace;
function v7.constructor(p1)
	u1.constructor(p1);
	p1.Name = "YetiAbilityController";
	p1.random = Random.new();
	p1.frozenBlockParts = {};
	local v9 = l__GetTarmacAssetFromPath__2({ "blocks", "ice_frost_1" });
	local v10 = {};
	for v11, v12 in ipairs(Enum.NormalId:GetEnumItems()) do
		table.insert(v10, (u3("Decal", {
			Texture = v9.s, 
			Face = v12, 
			ZIndex = 2, 
			Transparency = 1
		})));
	end;
	p1.partCache = u5.new(u3("Part", {
		Size = Vector3.new(l__BLOCK_SIZE__4, l__BLOCK_SIZE__4, l__BLOCK_SIZE__4), 
		Position = Vector3.new(0, 0, 0), 
		CanCollide = false, 
		Anchored = true, 
		Transparency = 1, 
		Children = v10
	}), 100);
	p1.partCache:SetCacheParent((u3("Folder", {
		Name = "FrozenBlockCache", 
		Parent = l__Workspace__6.Terrain
	})));
end;
local l__BlockEngineRemotes__7 = v2.BlockEngineRemotes;
local l__BlockEngine__8 = v2.BlockEngine;
local l__SoundManager__9 = v3.SoundManager;
local l__GameSound__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__12 = v5.Players;
function v7.KnitStart(p2)
	u1.KnitStart(p2);
	l__BlockEngineRemotes__7.Client:OnEvent("RemoteName", function(p3)
		local v13 = tostring(l__BlockEngine__8:getWorldPosition(p3.blockRef.blockPosition));
		local v14 = p2.frozenBlockParts[v13];
		if v14 then
			l__SoundManager__9:playSound(l__GameSound__10.BREAK_FROZEN_BLOCK, {
				position = v14.Position
			});
			p2.frozenBlockParts[v13] = nil;
			p2.partCache:ReturnPart(v14);
		end;
	end);
	l__default__11.Client:OnEvent("RemoteName", function(p4)
		local v15 = {};
		if l__Players__12:GetPlayerFromCharacter(p4.senderEntityInstance) == l__Players__12.LocalPlayer then
			local v16 = nil;
		else
			v16 = p4.position;
		end;
		v15.position = v16;
		l__SoundManager__9:playSound(l__GameSound__10.YETI_ROAR, v15);
		for v17, v18 in ipairs(p4.frozenBlocks) do
			local v19 = tostring(v18.position);
			if p2.frozenBlockParts[v19] == nil then
				local v20 = p2:makeIceBlock(v18.position);
				p2.frozenBlockParts[v19] = v20;
				p2:tweenInIce(v20, (v18.position - p4.position).Magnitude);
				task.delay(v18.expirationTime - l__Workspace__6:GetServerTimeNow(), function()
					if p2.frozenBlockParts[v19] ~= nil then
						p2:tweenOutIce(v20):andThen(function()
							p2.frozenBlockParts[v19] = nil;
							p2.partCache:ReturnPart(v20);
						end);
					end;
				end);
			end;
		end;
	end);
end;
local l__OutQuad__13 = v4.OutQuad;
local u14 = v3.ConstantManager.registerConstants(script, {
	TweenInTime = 0.5
});
local l__default__15 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__InQuart__16 = v4.InQuart;
v7.tweenInIce = v1.async(function(p5, p6, p7)
	local v21 = p6:GetChildren();
	local function v22(p8)
		return p8:IsA("Decal");
	end;
	local v23 = {};
	local v24 = 0;
	for v25, v26 in ipairs(v21) do
		if v22(v26, v25 - 1, v21) == true then
			v24 = v24 + 1;
			v23[v24] = v26;
		end;
	end;
	l__default__15(l__OutQuad__13(p7, u14.TweenInTime, 2.5, 35), l__InQuart__16, function(p9)
		for v27, v28 in ipairs(v23) do
			v28.Transparency = p9;
		end;
	end, 1, 0.45 + p5.random:NextNumber(-0.1, 0.2)):Wait();
end);
v7.tweenOutIce = v1.async(function(p10, p11)
	local v29 = p11:GetChildren();
	local function v30(p12)
		return p12:IsA("Decal");
	end;
	local v31 = {};
	local v32 = 0;
	for v33, v34 in ipairs(v29) do
		if v30(v34, v33 - 1, v29) == true then
			v32 = v32 + 1;
			v31[v32] = v34;
		end;
	end;
	l__default__15(p10.random:NextNumber(1, 3), l__InQuart__16, function(p13)
		for v35, v36 in ipairs(v31) do
			v36.Transparency = p13;
		end;
	end, v31[1].Transparency, 1):Wait();
end);
local l__GameQueryUtil__17 = v3.GameQueryUtil;
function v7.makeIceBlock(p14, p15)
	local v37 = p14.partCache:GetPart();
	v37.Position = p15;
	l__GameQueryUtil__17:setQueryIgnored(v37, true);
	return v37;
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v7.new());
return nil;
