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
local u1 = l__KnitController__5;
local l__GetTarmacAssetFromPath__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers").GetTarmacAssetFromPath;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__BLOCK_SIZE__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "partcache").out);
local l__Workspace__6 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
function v6.constructor(p1)
	u1.constructor(p1);
	p1.Name = "YetiAbilityController";
	p1.random = Random.new();
	p1.frozenBlockParts = {};
	local v8 = l__GetTarmacAssetFromPath__2({ "blocks", "ice_frost_1" });
	local v9 = {};
	for v10, v11 in ipairs(Enum.NormalId:GetEnumItems()) do
		table.insert(v9, (u3("Decal", {
			Texture = v8.s, 
			Face = v11, 
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
		Children = v9
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
local l__EntityUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	l__BlockEngineRemotes__7.Client:OnEvent("RemoteName", function(p3)
		local v12 = tostring(l__BlockEngine__8:getWorldPosition(p3.blockRef.blockPosition));
		local v13 = p2.frozenBlockParts[v12];
		if v13 then
			l__SoundManager__9:playSound(l__GameSound__10.BREAK_FROZEN_BLOCK, {
				position = v13.Position
			});
			p2.frozenBlockParts[v12] = nil;
			p2.partCache:ReturnPart(v13);
		end;
	end);
	l__default__11.Client:OnEvent("RemoteName", function(p4)
		if p4.senderEntityInstance then
			local v14 = {};
			local v15 = l__EntityUtil__12:getEntity(p4.senderEntityInstance);
			if v15 ~= nil then
				v15 = v15:isLocalPlayer();
			end;
			if v15 then
				local v16 = nil;
			else
				v16 = p4.position;
			end;
			v14.position = v16;
			l__SoundManager__9:playSound(l__GameSound__10.YETI_ROAR, v14);
		end;
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
v6.tweenInIce = v1.async(function(p5, p6, p7)
	local v21 = {};
	local v22 = 0;
	for v23, v24 in ipairs((p6:GetChildren())) do
		if v24:IsA("Decal") == true then
			v22 = v22 + 1;
			v21[v22] = v24;
		end;
	end;
	l__default__15(l__OutQuad__13(p7, u14.TweenInTime, 2.5, 35), l__InQuart__16, function(p8)
		for v25, v26 in ipairs(v21) do
			v26.Transparency = p8;
		end;
	end, 1, 0.45 + p5.random:NextNumber(-0.1, 0.2)):Wait();
end);
v6.tweenOutIce = v1.async(function(p9, p10)
	local v27 = {};
	local v28 = 0;
	for v29, v30 in ipairs((p10:GetChildren())) do
		if v30:IsA("Decal") == true then
			v28 = v28 + 1;
			v27[v28] = v30;
		end;
	end;
	l__default__15(p9.random:NextNumber(1, 3), l__InQuart__16, function(p11)
		for v31, v32 in ipairs(v27) do
			v32.Transparency = p11;
		end;
	end, v27[1].Transparency, 1):Wait();
end);
local l__GameQueryUtil__17 = v3.GameQueryUtil;
function v6.makeIceBlock(p12, p13)
	local v33 = p12.partCache:GetPart();
	v33.Position = p13;
	l__GameQueryUtil__17:setQueryIgnored(v33, true);
	return v33;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v6.new());
return nil;
