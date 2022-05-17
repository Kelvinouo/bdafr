
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
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
local u1 = l__KnitController__5;
function v6.constructor(p1, ...)
	u1.constructor(p1, ...);
	p1.Name = "BobaBlasterController";
	p1.effectCooldown = {};
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__4 = v4.Workspace;
local l__GameQueryUtil__5 = v2.GameQueryUtil;
local l__WeldUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u7 = Color3.fromRGB(237, 69, 41);
local u8 = Color3.new(0, 0, 0);
local l__SoundManager__9 = v2.SoundManager;
local l__GameSound__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__WatchCharacter__11 = v2.WatchCharacter;
local l__AnimatorAdded__12 = v2.AnimatorAdded;
local l__GameAnimationUtil__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__InventoryUtil__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__MapUtil__16 = v1.import(script, v1.getModule(script, "@easy-games", "data-structure").out).MapUtil;
local l__ExpireList__17 = v2.ExpireList;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		local v8 = u3("Part", {
			Name = "BobaPearl", 
			Position = p3.position, 
			Transparency = 0.5, 
			Size = Vector3.new(1, 1, 1), 
			Color = Color3.fromRGB(0, 0, 0), 
			Material = Enum.Material.Neon, 
			Shape = Enum.PartType.Ball, 
			CanQuery = false, 
			Parent = l__Workspace__4, 
			CanCollide = false
		});
		if p3.hitEntity then
			v8.Parent = p3.hitEntity;
		end;
		if p3.hitEntity then
			local v9 = RaycastParams.new();
			local v10 = {};
			local v11 = p3.hitEntity:GetChildren();
			local function v12(p4)
				return p4.Name ~= "BobaPearl";
			end;
			local v13 = {};
			local v14 = 0;
			for v15, v16 in ipairs(v11) do
				if v12(v16, v15 - 1, v11) == true then
					v14 = v14 + 1;
					v13[v14] = v16;
				end;
			end;
			table.move(v13, 1, #v13, #v10 + 1, v10);
			v9.FilterDescendantsInstances = v10;
			v9.FilterType = Enum.RaycastFilterType.Whitelist;
			local v17 = l__GameQueryUtil__5:raycast(v8.Position, p3.hitPart.Position - v8.Position, v9);
			local v18 = v17;
			if v18 ~= nil then
				v18 = v18.Position;
			end;
			if v18 then
				v8.CFrame = CFrame.new(v17.Position, v17.Position + v17.Normal);
			end;
		end;
		l__WeldUtil__6.weldParts(p3.hitPart, v8);
		local v19 = false;
		while time() - time() < 3 do
			if v19 then
				local v20 = u7;
			else
				v20 = u8;
			end;
			v8.Color = v20;
			if v19 then
				local v21 = 0;
			else
				v21 = 0.5;
			end;
			v8.Transparency = v21;
			if v19 then
				local v22 = Enum.Material.Neon;
			else
				v22 = Enum.Material.Glass;
			end;
			v8.Material = v22;
			if v19 then
				l__SoundManager__9:playSound(l__GameSound__10.BEEPING, {
					position = v8.Position, 
					rollOffMaxDistance = 45, 
					volumeMultiplier = 0.25
				});
			end;
			v19 = not v19;
			task.wait(0.22);		
		end;
		p2:playEffect(v8.CFrame);
		v8:Destroy();
	end);
	l__WatchCharacter__11(function(p5, p6, p7)
		l__AnimatorAdded__12(p6:WaitForChild("Humanoid"), function(p8)
			p8.AnimationPlayed:Connect(function(p9)
				local v23 = p9.Animation;
				if v23 ~= nil then
					v23 = v23.AnimationId;
				end;
				if v23 == l__GameAnimationUtil__13.getAssetId(l__AnimationType__14.BOBA_BLASTER_FIRE) then
					local v24 = l__InventoryUtil__15.getInventory(p5).hand;
					if v24 ~= nil then
						v24 = v24.tool;
					end;
					if v24 then
						local v25 = l__MapUtil__16.getOrCreate(p2.effectCooldown, p5.UserId, l__ExpireList__17.new(0.35));
						if #v25:getValues() >= 1 then
							return nil;
						end;
						v25:add(math.random());
						p2:playBlastEffect(p6);
					end;
				end;
			end);
		end);
	end);
end;
local l__ReplicatedStorage__18 = v4.ReplicatedStorage;
local l__EffectUtil__19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v6.playEffect(p10, p11)
	l__SoundManager__9:playSound(l__GameSound__10.GOO_SPLAT, {
		position = p11.Position, 
		rollOffMaxDistance = 45
	});
	l__SoundManager__9:playSound(l__GameSound__10.FIREWORK_EXPLODE_1, {
		position = p11.Position, 
		rollOffMaxDistance = 45, 
		volumeMultiplier = 0.1
	});
	local v26 = l__ReplicatedStorage__18.Assets.Effects.BobaPearlPop:Clone();
	v26.CFrame = p11;
	v26.Parent = l__Workspace__4;
	l__EffectUtil__19:playEffects({ v26 }, nil, {
		destroyAfterSec = 1, 
		sizeMultiplier = 1.4
	});
end;
local l__Players__20 = v4.Players;
local l__KnitClient__21 = v3.KnitClient;
local l__ItemType__22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v6.playBlastEffect(p12, p13)
	local v27 = l__Workspace__4.CurrentCamera;
	if v27 ~= nil then
		v27 = v27.CFrame.Position;
	end;
	if not v27 or (p13:GetPrimaryPartCFrame().Position - v27).Magnitude > 300 then
		return nil;
	end;
	local v28 = p13;
	if p13 == l__Players__20.LocalPlayer.Character and l__KnitClient__21.Controllers.ViewmodelController:isVisible() then
		local v29 = l__KnitClient__21.Controllers.ViewmodelController:getViewModel();
		if v29 then
			v28 = v29;
		end;
	end;
	local v30 = v28:FindFirstChild(l__ItemType__22.BOBA_BLASTER);
	if not v30 then
		return nil;
	end;
	l__EffectUtil__19:playEffects(v30:GetDescendants(), nil);
end;
u1 = v3.KnitClient.CreateController;
u1 = u1(v6.new());
return nil;

