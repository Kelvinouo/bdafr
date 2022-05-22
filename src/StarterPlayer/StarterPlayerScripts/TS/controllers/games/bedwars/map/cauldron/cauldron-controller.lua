-- Script Hash: 60ae057f4884f343fa972f93da4612584830e6b1ceda6afb7582b94d6fed77d3fa1f8cd0febf7561f1ef2b17200e728c
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "CauldronController";
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
	p1.Name = "CauldronController";
	p1.cauldronToMaid = {};
end;
local l__CollectionTagAdded__2 = v2.CollectionTagAdded;
local l__Maid__3 = v3.Maid;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__5 = v2.Empty;
local l__ItemViewport__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport;
local l__ItemType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__Players__8 = v4.Players;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__SoundManager__11 = v2.SoundManager;
local l__GameSound__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__CollectionService__14 = v4.CollectionService;
local l__Thread__15 = v3.Thread;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	l__CollectionTagAdded__2("cauldron", function(p3)
		local v8 = l__Maid__3.new();
		p2.cauldronToMaid[p3] = v8;
		local u16 = u4.mount(u4.createElement("BillboardGui", {
			Adornee = p3:WaitForChild("Root"), 
			Size = UDim2.fromScale(2.5, 2.5), 
			LightInfluence = 0, 
			StudsOffsetWorldSpace = Vector3.new(0, 5, 0)
		}, { u4.createElement(l__Empty__5, {
				Size = UDim2.fromScale(1, 1), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.fromScale(0.5, 0.5)
			}, { u4.createElement(l__ItemViewport__6, {
					ItemType = l__ItemType__7.DIAMOND
				}) }) }), l__Players__8.LocalPlayer:WaitForChild("PlayerGui"));
		v8:GiveTask(function()
			u4.unmount(u16);
		end);
		local v9 = u9("ProximityPrompt", {
			Enabled = true, 
			ActionText = "Repair (8 diamonds)", 
			ObjectText = "Cauldron", 
			HoldDuration = 0.3, 
			KeyboardKeyCode = l__Theme__10.promptKeyboardKey, 
			RequiresLineOfSight = false, 
			Parent = p3
		});
		v9.Triggered:Connect(function(p4)
			if p4 == l__Players__8.LocalPlayer and v9.Enabled == true then
				if p3:GetAttribute("Enabled") ~= true then
					l__SoundManager__11:playSound(l__GameSound__12.DEPOSIT_BEE);
					l__default__13.Client:WaitFor("RemoteName"):expect():SendToServer({
						cauldron = p3
					});
					return;
				end;
			else
				return;
			end;
			l__SoundManager__11:playSound(l__GameSound__12.UI_OPEN);
			p2:disableui();
			p2:enableui(p3);
		end);
		p3:GetAttributeChangedSignal("Enabled"):Connect(function()
			if p3:GetAttribute("Enabled") == true then
				v9.ActionText = "Open";
				return;
			end;
			v9.ActionText = "Repair (8 diamonds)";
		end);
	end);
	l__CollectionService__14:GetInstanceRemovedSignal("cauldron"):Connect(function(p5)
		local v10 = p2.cauldronToMaid[p5];
		if v10 ~= nil then
			v10:DoCleaning();
		end;
		p2.cauldronToMaid[p5] = nil;
	end);
	l__Thread__15.DelayRepeat(0.2, function()
		if p2.active and p2.active.cauldron.ProximityPrompt.MaxActivationDistance < l__Players__8.LocalPlayer:DistanceFromCharacter(p2.active.cauldron:GetPrimaryPartCFrame().Position) then
			p2:disableui();
		end;
	end);
end;
local l__CreateRoduxApp__17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__CauldronWrapper__18 = v1.import(script, script.Parent, "ui", "cauldron-app").CauldronWrapper;
function v6.enableui(p6, p7)
	p7.ProximityPrompt.Enabled = false;
	p6.active = {
		tree = l__CreateRoduxApp__17("cauldron", l__CauldronWrapper__18, {
			cauldron = p7
		}), 
		cauldron = p7
	};
end;
function v6.disableui(p8)
	if p8.active then
		p8.active.cauldron.ProximityPrompt.Enabled = true;
		u4.unmount(p8.active.tree);
		p8.active = nil;
	end;
end;
u1 = v3.KnitClient.CreateController;
u1 = u1(v6.new());
return nil;
