-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "BigmanController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
function u1.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "BigmanController";
end;
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__BedwarsKit__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__WatchPlayerCharacter__4 = v2.WatchPlayerCharacter;
local l__Players__5 = v3.Players;
local l__BedwarsKitSkin__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local l__CollectionService__7 = v3.CollectionService;
local l__default__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ReplicatedStorage__9 = v3.ReplicatedStorage;
local l__GameQueryUtil__10 = v2.GameQueryUtil;
local l__Workspace__11 = v3.Workspace;
local l__CollectionTagAdded__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded;
local u13 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local u14 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__GameAnimationUtil__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__SoundManager__18 = v2.SoundManager;
local l__GameSound__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__TweenService__20 = v3.TweenService;
function u1.KnitStart(p2)
	l__KnitClient__2.Controllers.KitController:watchLocalKit(function(p3)
		if p3 ~= l__BedwarsKit__3.BIGMAN then
			return nil;
		end;
		l__WatchPlayerCharacter__4(l__Players__5.LocalPlayer, function(p4, p5)
			if l__KnitClient__2.Controllers.KitController:getKitSkin(p4) == l__BedwarsKitSkin__6.BIGMAN_SPIRIT and p4 ~= nil then
				local v7, v8, v9 = ipairs((p4:WaitForChild("mesh/uppertorso_particle"):GetDescendants()));
				while true do
					v7(v8, v9);
					if not v7 then
						break;
					end;
					v9 = v7;
					if v8:IsA("ParticleEmitter") then
						l__CollectionService__7:AddTag(v8, "FirstPersonHidden");
					end;				
				end;
			end;
		end);
	end);
	l__default__8.Client:OnEvent("RemoteName", function(p6)
		local v10 = "TreeOrb";
		if p6.skin == l__BedwarsKitSkin__6.BIGMAN_SPIRIT then
			v10 = "SpiritTreeOrb";
		end;
		local v11 = l__ReplicatedStorage__9:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild(v10):Clone();
		v11:SetPrimaryPartCFrame(CFrame.new(p6.position));
		v11:SetAttribute("TreeOrbSecret", p6.treeOrbSecret);
		local v12, v13, v14 = ipairs(v11:GetDescendants());
		while true do
			v12(v13, v14);
			if not v12 then
				break;
			end;
			v14 = v12;
			if v13:IsA("BasePart") then
				l__GameQueryUtil__10:setQueryIgnored(v13, true);
			end;		
		end;
		v11.Parent = l__Workspace__11;
		l__CollectionService__7:AddTag(v11, "treeOrb");
		v1.Promise.delay(150):andThen(function()
			v11:Destroy();
		end);
	end);
	l__CollectionTagAdded__12("treeOrb", function(p7)
		local v15 = u13.new();
		u14("ProximityPrompt", {
			ActionText = "Consume", 
			ObjectText = "Tree Orb", 
			HoldDuration = 0.3, 
			KeyboardKeyCode = l__Theme__15.promptKeyboardKey, 
			Parent = p7, 
			RequiresLineOfSight = false
		}).Triggered:Connect(function(p8)
			if p8 == l__Players__5.LocalPlayer then
				l__GameAnimationUtil__16.playAnimation(p8, l__AnimationType__17.PUNCH);
				l__KnitClient__2.Controllers.ViewmodelController:playAnimation(l__AnimationType__17.FP_USE_ITEM);
				l__SoundManager__18:playSound(l__GameSound__19.CROP_HARVEST);
				if l__default__8.Client:Get("RemoteName"):CallServer({
					treeOrbSecret = p7:GetAttribute("TreeOrbSecret")
				}) then
					p7:Destroy();
				end;
			end;
		end);
		v1.Promise.defer(function()
			local v16 = Instance.new("CFrameValue");
			v16.Value = p7:GetPrimaryPartCFrame();
			v16.Changed:Connect(function(p9)
				if p7.PrimaryPart then
					p7:SetPrimaryPartCFrame(p9);
				end;
			end);
			while p7.PrimaryPart do
				local v17 = l__TweenService__20:Create(v16, TweenInfo.new(2), {
					Value = v16.Value + Vector3.new(0, 2, 0)
				});
				v17:Play();
				v17.Completed:Wait();
				local v18 = l__TweenService__20:Create(v16, TweenInfo.new(2), {
					Value = v16.Value + Vector3.new(0, -2, 0)
				});
				v18:Play();
				v18.Completed:Wait();			
			end;
		end);
		v15:GiveTask(p7.AncestryChanged:Connect(function(p10, p11)
			if p11 == nil then
				v15:DoCleaning();
			end;
		end));
	end);
end;
u1 = l__KnitClient__2.CreateController;
u1 = u1(u1.new());
return nil;
