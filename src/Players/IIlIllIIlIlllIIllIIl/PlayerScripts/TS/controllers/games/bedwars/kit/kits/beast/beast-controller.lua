-- Script Hash: 6357927450a081ca87c5ca331d8d9f23138ccf1961ae7e8e88a374e230c71eb5b51596308ecd8158f2bb08472b36bb4c
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "BeastController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = l__KnitController__5;
function v6.constructor(p1)
	u1.constructor(p1);
	p1.Name = "BeastController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__EntityUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__Workspace__4 = v4.Workspace;
local l__Maid__5 = v3.Maid;
local l__PlayerEntity__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local l__Players__7 = v4.Players;
local l__KnitClient__8 = v3.KnitClient;
local l__BeastKit__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "beast", "beast-util").BeastKit;
local l__Flamework__10 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CooldownId__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local l__getItemMeta__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local u13 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__ReplicatedStorage__14 = v4.ReplicatedStorage;
local l__GameQueryUtil__15 = v2.GameQueryUtil;
local l__SoundManager__16 = v2.SoundManager;
local l__GameSound__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__18 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__InQuad__19 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).InQuad;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		local v8 = l__EntityUtil__3:getEntity(p3.entityInstance);
		if v8 == nil then
			return nil;
		end;
		local v9 = p3.expirationTime - l__Workspace__4:GetServerTimeNow();
		local u20 = l__Maid__5.new();
		task.delay(v9, function()
			u20:DoCleaning();
		end);
		if v1.instanceof(v8, l__PlayerEntity__6) then
			local v10 = v8:getPlayer() == l__Players__7.LocalPlayer;
		else
			v10 = false;
		end;
		if v10 then
			u20:GiveTask(l__KnitClient__8.Controllers.SprintController:getMovementStatusModifier():addModifier({
				moveSpeedMultiplier = l__BeastKit__9.WALK_SPEED_MULTIPLIER
			}));
			u20:GiveTask(l__Flamework__10.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CooldownId__11.BEAST_ABILITY));
			l__Flamework__10.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__11.BEAST_ABILITY, v9, {
				cooldownBar = {
					color = Color3.fromRGB(79, 110, 56)
				}
			});
		end;
		local u21 = p3.entityInstance:GetDescendants();
		local function v11(p4)
			for v12, v13 in ipairs(u21) do
				if (v13:IsA("BasePart") or v13:IsA("Decal")) and v13.Name ~= "HumanoidRootPart" and not v13:IsA("Texture") then
					local v14 = v13:FindFirstAncestorOfClass("Accessory");
					if not v14 or not l__getItemMeta__12(string.lower(v14.Name)) then
						v13.Transparency = p4;
					end;
				end;
			end;
		end;
		v11(1);
		u20:GiveTask(function()
			v11(0);
		end);
		p3.entityInstance.Humanoid.HipHeight = 2.3;
		local l__HipHeight__22 = p3.entityInstance.Humanoid.HipHeight;
		u20:GiveTask(function()
			p3.entityInstance.Humanoid.HipHeight = l__HipHeight__22;
		end);
		local v15 = u13("Folder", {
			Name = "ExtraCharacterParts", 
			Parent = p3.entityInstance
		});
		u20:GiveTask(v15);
		local v16 = l__ReplicatedStorage__14.Assets.Effects.BeastActivated:Clone();
		v16:SetPrimaryPartCFrame(p3.entityInstance:GetPrimaryPartCFrame());
		local v17 = v16:FindFirstChildOfClass("Humanoid");
		if v17 ~= nil then
			v17:Destroy();
		end;
		local l__HumanoidRootPart__18 = v16:FindFirstChild("HumanoidRootPart");
		if l__HumanoidRootPart__18 ~= nil then
			l__HumanoidRootPart__18:Destroy();
		end;
		local l__Animate__19 = v16:FindFirstChild("Animate");
		if l__Animate__19 ~= nil then
			l__Animate__19:Destroy();
		end;
		local v20 = v16:FindFirstAncestorOfClass("BodyColors");
		if v20 ~= nil then
			v20:Destroy();
		end;
		for v21, v22 in ipairs(v16:GetDescendants()) do
			if v22:IsA("BasePart") then
				v22.Massless = true;
				v22.CanCollide = false;
				l__GameQueryUtil__15:setQueryIgnored(v22, true);
			end;
		end;
		v16.Parent = v15;
		for v23, v24 in ipairs(p3.entityInstance:GetChildren()) do
			if v24:IsA("BasePart") and v24.Name ~= "HumanoidRootPart" then
				local v25 = v16:FindFirstChild(v24.Name);
				if v25 and v25:IsA("BasePart") then
					for v26, v27 in ipairs(v25:GetDescendants()) do
						if v27:IsA("Motor6D") then
							v27:Destroy();
						end;
					end;
					v25.Parent = v15;
					u13("Weld", {
						Part0 = v25, 
						Part1 = v24, 
						Parent = v25
					});
				end;
			end;
		end;
		if v10 then
			l__SoundManager__16:playSound(l__GameSound__17.BEAST_ROAR);
		else
			l__SoundManager__16:playSound(l__GameSound__17.BEAST_ROAR, {
				position = p3.entityInstance:GetPrimaryPartCFrame().Position, 
				rollOffMaxDistance = 100
			});
		end;
		local v28 = {};
		for v29, v30 in ipairs(v15:GetDescendants()) do
			if v30:IsA("BasePart") then
				v28[v30] = {
					size = v30.Size, 
					randomOffset = math.random() * 0.1
				};
			end;
		end;
		task.spawn(function()
			l__default__18(0.5, l__InQuad__19, function(p5)
				for v31, v32 in pairs(v28) do
					v31.Size = v32.size * math.clamp(p5 + v32.randomOffset, 0, 1);
				end;
			end, 0.6, 1):Wait();
		end);
	end);
end;
u1 = v3.KnitClient.CreateController;
u1 = u1(v6.new());
return nil;
