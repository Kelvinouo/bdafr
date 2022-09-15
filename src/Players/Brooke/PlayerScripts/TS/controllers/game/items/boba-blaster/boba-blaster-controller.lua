-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "BobaBlasterController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
function v6.constructor(p1, ...)
	l__KnitController__5.constructor(p1, ...);
	p1.Name = "BobaBlasterController";
	p1.effectCooldown = {};
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__3 = v4.Workspace;
local l__GameQueryUtil__4 = v2.GameQueryUtil;
local l__WeldUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u6 = Color3.fromRGB(237, 69, 41);
local u7 = Color3.new(0, 0, 0);
local l__SoundManager__8 = v2.SoundManager;
local l__GameSound__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__WatchCharacter__10 = v2.WatchCharacter;
local l__AnimatorAdded__11 = v2.AnimatorAdded;
local l__GameAnimationUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__InventoryUtil__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__MapUtil__15 = v1.import(script, v1.getModule(script, "@easy-games", "data-structure").out).MapUtil;
local l__ExpireList__16 = v2.ExpireList;
function v6.KnitStart(p2)
	l__KnitController__5.KnitStart(p2);
	l__default__1.Client:OnEvent("RemoteName", function(p3)
		local v8 = u2("Part", {
			Name = "BobaPearl", 
			Position = p3.position, 
			Transparency = 0.5, 
			Size = Vector3.new(1, 1, 1), 
			Color = Color3.fromRGB(0, 0, 0), 
			Material = Enum.Material.Neon, 
			Shape = Enum.PartType.Ball, 
			CanQuery = false, 
			Parent = l__Workspace__3, 
			CanCollide = false
		});
		if p3.hitEntity then
			v8.Parent = p3.hitEntity;
		end;
		if p3.hitEntity then
			local v9 = RaycastParams.new();
			local v10 = {};
			local v11 = {};
			local v12 = 0;
			local v13, v14, v15 = ipairs((p3.hitEntity:GetChildren()));
			while true do
				v13(v14, v15);
				if not v13 then
					break;
				end;
				if v14.Name ~= "BobaPearl" == true then
					v12 = v12 + 1;
					v11[v12] = v14;
				end;			
			end;
			table.move(v11, 1, #v11, #v10 + 1, v10);
			v9.FilterDescendantsInstances = v10;
			v9.FilterType = Enum.RaycastFilterType.Whitelist;
			local v16 = l__GameQueryUtil__4:raycast(v8.Position, p3.hitPart.Position - v8.Position, v9);
			local v17 = v16;
			if v17 ~= nil then
				v17 = v17.Position;
			end;
			if v17 then
				v8.CFrame = CFrame.new(v16.Position, v16.Position + v16.Normal);
			end;
		end;
		l__WeldUtil__5:weldParts(p3.hitPart, v8);
		local v18 = false;
		while time() - time() < 3 do
			if v18 then
				local v19 = u6;
			else
				v19 = u7;
			end;
			v8.Color = v19;
			if v18 then
				local v20 = 0;
			else
				v20 = 0.5;
			end;
			v8.Transparency = v20;
			if v18 then
				local v21 = Enum.Material.Neon;
			else
				v21 = Enum.Material.Glass;
			end;
			v8.Material = v21;
			if v18 then
				l__SoundManager__8:playSound(l__GameSound__9.BEEPING, {
					position = v8.Position, 
					rollOffMaxDistance = 45, 
					volumeMultiplier = 0.25
				});
			end;
			v18 = not v18;
			task.wait(0.22);		
		end;
		p2:playEffect(v8.CFrame);
		v8:Destroy();
	end);
	l__WatchCharacter__10(function(p4, p5, p6)
		l__AnimatorAdded__11(p5:WaitForChild("Humanoid"), function(p7)
			p7.AnimationPlayed:Connect(function(p8)
				local v22 = p8.Animation;
				if v22 ~= nil then
					v22 = v22.AnimationId;
				end;
				if v22 == l__GameAnimationUtil__12.getAssetId(l__AnimationType__13.BOBA_BLASTER_FIRE) then
					local v23 = l__InventoryUtil__14.getInventory(p4).hand;
					if v23 ~= nil then
						v23 = v23.tool;
					end;
					if v23 then
						local v24 = l__MapUtil__15.getOrCreate(p2.effectCooldown, p4.UserId, l__ExpireList__16.new(0.35));
						if #v24:getValues() >= 1 then
							return nil;
						end;
						v24:add(math.random());
						p2:playBlastEffect(p5);
					end;
				end;
			end);
		end);
	end);
end;
local l__ReplicatedStorage__17 = v4.ReplicatedStorage;
local l__EffectUtil__18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v6.playEffect(p9, p10)
	l__SoundManager__8:playSound(l__GameSound__9.GOO_SPLAT, {
		position = p10.Position, 
		rollOffMaxDistance = 45
	});
	l__SoundManager__8:playSound(l__GameSound__9.FIREWORK_EXPLODE_1, {
		position = p10.Position, 
		rollOffMaxDistance = 45, 
		volumeMultiplier = 0.1
	});
	local v25 = l__ReplicatedStorage__17.Assets.Effects.BobaPearlPop:Clone();
	v25.CFrame = p10;
	v25.Parent = l__Workspace__3;
	l__EffectUtil__18:playEffects({ v25 }, nil, {
		destroyAfterSec = 1, 
		sizeMultiplier = 1.4
	});
end;
local l__Players__19 = v4.Players;
local l__KnitClient__20 = v3.KnitClient;
local l__ItemType__21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v6.playBlastEffect(p11, p12)
	local v26 = l__Workspace__3.CurrentCamera;
	if v26 ~= nil then
		v26 = v26.CFrame.Position;
	end;
	if not v26 or (p12:GetPrimaryPartCFrame().Position - v26).Magnitude > 300 then
		return nil;
	end;
	local v27 = p12;
	if p12 == l__Players__19.LocalPlayer.Character and l__KnitClient__20.Controllers.ViewmodelController:isVisible() then
		local v28 = l__KnitClient__20.Controllers.ViewmodelController:getViewModel();
		if v28 then
			v27 = v28;
		end;
	end;
	local v29 = v27:FindFirstChild(l__ItemType__21.BOBA_BLASTER);
	if not v29 then
		return nil;
	end;
	l__EffectUtil__18:playEffects(v29:GetDescendants(), nil);
end;
local v30 = v3.KnitClient.CreateController(v6.new());
return nil;
