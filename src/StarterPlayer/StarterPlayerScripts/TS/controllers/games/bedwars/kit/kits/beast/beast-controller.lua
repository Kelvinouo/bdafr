-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
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
function v6.constructor(p1)
	l__KnitController__5.constructor(p1);
	p1.Name = "BeastController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__EntityUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__Workspace__3 = v4.Workspace;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__PlayerEntity__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local l__Players__6 = v4.Players;
local l__KnitClient__7 = v3.KnitClient;
local l__BeastKit__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "beast", "beast-util").BeastKit;
local l__Flamework__9 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CooldownId__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local l__getItemMeta__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local u12 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__ReplicatedStorage__13 = v4.ReplicatedStorage;
local l__GameQueryUtil__14 = v2.GameQueryUtil;
local l__SoundManager__15 = v2.SoundManager;
local l__GameSound__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__17 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__InQuad__18 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).InQuad;
function v6.KnitStart(p2)
	l__KnitController__5.KnitStart(p2);
	l__default__1.Client:OnEvent("RemoteName", function(p3)
		local v8 = l__EntityUtil__2:getEntity(p3.entityInstance);
		if v8 == nil then
			return nil;
		end;
		local v9 = p3.expirationTime - l__Workspace__3:GetServerTimeNow();
		local u19 = u4.new();
		task.delay(v9, function()
			u19:DoCleaning();
		end);
		if v1.instanceof(v8, l__PlayerEntity__5) then
			local v10 = v8:getPlayer() == l__Players__6.LocalPlayer;
		else
			v10 = false;
		end;
		if v10 then
			u19:GiveTask(l__KnitClient__7.Controllers.SprintController:getMovementStatusModifier():addModifier({
				moveSpeedMultiplier = l__BeastKit__8.WALK_SPEED_MULTIPLIER
			}));
			u19:GiveTask(l__Flamework__9.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CooldownId__10.BEAST_ABILITY));
			l__Flamework__9.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__10.BEAST_ABILITY, v9, {
				cooldownBar = {
					color = Color3.fromRGB(79, 110, 56)
				}
			});
		end;
		local u20 = p3.entityInstance:GetDescendants();
		local function v11(p4)
			local v12, v13, v14 = ipairs(u20);
			while true do
				v12(v13, v14);
				if not v12 then
					break;
				end;
				v14 = v12;
				if (v13:IsA("BasePart") or v13:IsA("Decal")) and v13.Name ~= "HumanoidRootPart" and not v13:IsA("Texture") then
					local v15 = v13:FindFirstAncestorOfClass("Accessory");
					if not v15 or not l__getItemMeta__11(string.lower(v15.Name)) then
						v13.Transparency = p4;
					end;
				end;			
			end;
		end;
		v11(1);
		u19:GiveTask(function()
			v11(0);
		end);
		p3.entityInstance.Humanoid.HipHeight = 2.3;
		local l__HipHeight__21 = p3.entityInstance.Humanoid.HipHeight;
		u19:GiveTask(function()
			p3.entityInstance.Humanoid.HipHeight = l__HipHeight__21;
		end);
		local v16 = u12("Folder", {
			Name = "ExtraCharacterParts", 
			Parent = p3.entityInstance
		});
		u19:GiveTask(v16);
		local v17 = l__ReplicatedStorage__13.Assets.Effects.BeastActivated:Clone();
		v17:SetPrimaryPartCFrame(p3.entityInstance:GetPrimaryPartCFrame());
		local v18 = v17:FindFirstChildOfClass("Humanoid");
		if v18 ~= nil then
			v18:Destroy();
		end;
		local l__HumanoidRootPart__19 = v17:FindFirstChild("HumanoidRootPart");
		if l__HumanoidRootPart__19 ~= nil then
			l__HumanoidRootPart__19:Destroy();
		end;
		local l__Animate__20 = v17:FindFirstChild("Animate");
		if l__Animate__20 ~= nil then
			l__Animate__20:Destroy();
		end;
		local v21 = v17:FindFirstAncestorOfClass("BodyColors");
		if v21 ~= nil then
			v21:Destroy();
		end;
		local v22, v23, v24 = ipairs(v17:GetDescendants());
		while true do
			v22(v23, v24);
			if not v22 then
				break;
			end;
			v24 = v22;
			if v23:IsA("BasePart") then
				v23.Massless = true;
				v23.CanCollide = false;
				l__GameQueryUtil__14:setQueryIgnored(v23, true);
			end;		
		end;
		v17.Parent = v16;
		local v25, v26, v27 = ipairs(p3.entityInstance:GetChildren());
		while true do
			v25(v26, v27);
			if not v25 then
				break;
			end;
			v27 = v25;
			if v26:IsA("BasePart") and v26.Name ~= "HumanoidRootPart" then
				local v28 = v17:FindFirstChild(v26.Name);
				if v28 and v28:IsA("BasePart") then
					local v29, v30, v31 = ipairs(v28:GetDescendants());
					while true do
						v29(v30, v31);
						if not v29 then
							break;
						end;
						v31 = v29;
						if v30:IsA("Motor6D") then
							v30:Destroy();
						end;					
					end;
					v28.Parent = v16;
					u12("Weld", {
						Part0 = v28, 
						Part1 = v26, 
						Parent = v28
					});
				end;
			end;		
		end;
		if v10 then
			l__SoundManager__15:playSound(l__GameSound__16.BEAST_ROAR);
		else
			l__SoundManager__15:playSound(l__GameSound__16.BEAST_ROAR, {
				position = p3.entityInstance:GetPrimaryPartCFrame().Position, 
				rollOffMaxDistance = 100
			});
		end;
		local v32 = {};
		local v33, v34, v35 = ipairs(v16:GetDescendants());
		while true do
			v33(v34, v35);
			if not v33 then
				break;
			end;
			v35 = v33;
			if v34:IsA("BasePart") then
				v32[v34] = {
					size = v34.Size, 
					randomOffset = math.random() * 0.1
				};
			end;		
		end;
		task.spawn(function()
			l__default__17(0.5, l__InQuad__18, function(p5)
				for v36, v37 in pairs(v32) do
					v36.Size = v37.size * math.clamp(p5 + v37.randomOffset, 0, 1);
				end;
			end, 0.6, 1):Wait();
		end);
	end);
end;
local v38 = v3.KnitClient.CreateController(v6.new());
return nil;
