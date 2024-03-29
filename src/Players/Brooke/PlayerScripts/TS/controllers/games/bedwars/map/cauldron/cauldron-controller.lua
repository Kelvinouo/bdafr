-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "CauldronController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
function v5.constructor(p1, ...)
	l__KnitController__4.constructor(p1, ...);
	p1.Name = "CauldronController";
	p1.cauldronToMaid = {};
end;
local l__CollectionTagAdded__1 = v2.CollectionTagAdded;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__4 = v2.Empty;
local l__ItemViewport__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport;
local l__ItemType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__Players__7 = v3.Players;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__SoundManager__10 = v2.SoundManager;
local l__GameSound__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__CollectionService__13 = v3.CollectionService;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__CollectionTagAdded__1("cauldron", function(p3)
		local v7 = u2.new();
		p2.cauldronToMaid[p3] = v7;
		local u14 = u3.mount(u3.createElement("BillboardGui", {
			Adornee = p3:WaitForChild("Root"), 
			Size = UDim2.fromScale(2.5, 2.5), 
			LightInfluence = 0, 
			StudsOffsetWorldSpace = Vector3.new(0, 5, 0)
		}, { u3.createElement(l__Empty__4, {
				Size = UDim2.fromScale(1, 1), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.fromScale(0.5, 0.5)
			}, { u3.createElement(l__ItemViewport__5, {
					ItemType = l__ItemType__6.DIAMOND
				}) }) }), l__Players__7.LocalPlayer:WaitForChild("PlayerGui"));
		v7:GiveTask(function()
			u3.unmount(u14);
		end);
		local v8 = u8("ProximityPrompt", {
			Enabled = true, 
			ActionText = "Repair (8 diamonds)", 
			ObjectText = "Cauldron", 
			HoldDuration = 0.3, 
			KeyboardKeyCode = l__Theme__9.promptKeyboardKey, 
			RequiresLineOfSight = false, 
			Parent = p3
		});
		v8.Triggered:Connect(function(p4)
			if p4 == l__Players__7.LocalPlayer and v8.Enabled == true then
				if p3:GetAttribute("Enabled") ~= true then
					l__SoundManager__10:playSound(l__GameSound__11.DEPOSIT_BEE);
					l__default__12.Client:WaitFor("RemoteName"):expect():SendToServer({
						cauldron = p3
					});
					return;
				end;
			else
				return;
			end;
			l__SoundManager__10:playSound(l__GameSound__11.UI_OPEN);
			p2:disableui();
			p2:enableui(p3);
		end);
		p3:GetAttributeChangedSignal("Enabled"):Connect(function()
			if p3:GetAttribute("Enabled") == true then
				v8.ActionText = "Open";
				return;
			end;
			v8.ActionText = "Repair (8 diamonds)";
		end);
	end);
	l__CollectionService__13:GetInstanceRemovedSignal("cauldron"):Connect(function(p5)
		local v9 = p2.cauldronToMaid[p5];
		if v9 ~= nil then
			v9:DoCleaning();
		end;
		p2.cauldronToMaid[p5] = nil;
	end);
	task.spawn(function()
		while true do
			local v10 = task.wait(0.2);
			if v10 == 0 then
				break;
			end;
			if v10 ~= v10 then
				break;
			end;
			if not v10 then
				break;
			end;
			task.spawn(function()
				if p2.active and p2.active.cauldron.ProximityPrompt.MaxActivationDistance < l__Players__7.LocalPlayer:DistanceFromCharacter(p2.active.cauldron:GetPrimaryPartCFrame().Position) then
					p2:disableui();
				end;
			end);		
		end;
	end);
end;
local l__CreateRoduxApp__15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__CauldronWrapper__16 = v1.import(script, script.Parent, "ui", "cauldron-app").CauldronWrapper;
function v5.enableui(p6, p7)
	p7.ProximityPrompt.Enabled = false;
	p6.active = {
		tree = l__CreateRoduxApp__15("cauldron", l__CauldronWrapper__16, {
			cauldron = p7
		}), 
		cauldron = p7
	};
end;
function v5.disableui(p8)
	if p8.active then
		p8.active.cauldron.ProximityPrompt.Enabled = true;
		u3.unmount(p8.active.tree);
		p8.active = nil;
	end;
end;
local v11 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v5.new());
return nil;
