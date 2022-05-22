-- Script Hash: fdcb6496feacb4aac73ba01f5b9756e81bae3740db26c23b4c71956aff35b27dd3b9e60ae9c904e8fa4583e2d81a94d9
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "BrewingCauldronController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "BrewingCauldronController";
	p1.whitelist = {};
	p1.activeBillboards = {};
	p1.activeInteractivePrompts = {};
	p1.activeStatus = {};
end;
local l__CollectionService__2 = v2.CollectionService;
local l__Workspace__3 = v2.Workspace;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__CraftingStatus__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "crafting-entity", "crafting-entity-types").CraftingStatus;
local l__Players__6 = v2.Players;
local l__KnitClient__7 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	local v6 = l__CollectionService__2:GetTagged("brewing_cauldron");
	local function v7(p3)
		return print("todo");
	end;
	for v8, v9 in ipairs(v6) do
		v7(v9, v8 - 1, v6);
	end;
	l__CollectionService__2:GetInstanceRemovedSignal("brewing_cauldron"):Connect(function(p4)
		if p4.Parent == l__Workspace__3 then
			return nil;
		end;
		local l__Position__10 = p4.Position;
		p2.activeBillboards[l__Position__10] = nil;
		p2.activeStatus[l__Position__10] = nil;
	end);
	l__default__4.Client:WaitFor("RemoteName"):andThen(function(p5)
		p5:Connect(function(p6)
			local v11 = nil;
			local l__craftingEntity__12 = p6.craftingEntity;
			v11 = p6.inventory;
			local l__status__13 = p6.status;
			local v14 = p2.activeInteractivePrompts[l__craftingEntity__12.id];
			if v14 == nil then
				return nil;
			end;
			if l__status__13 == l__CraftingStatus__5.standby then
				p2.activeStatus[l__craftingEntity__12.id] = "STANDBY";
				p2:updateBillboard(l__craftingEntity__12, l__status__13, v11);
				p2:updatePrompt(l__craftingEntity__12, "Deposit");
				return;
			end;
			if l__status__13 == l__CraftingStatus__5.validate then
				p2:updateBillboard(l__craftingEntity__12, l__status__13, v11);
				p2:updatePrompt(l__craftingEntity__12, "Deposit");
				p2.activeStatus[l__craftingEntity__12.id] = "VALIDATE";
				return;
			end;
			if l__status__13 == l__CraftingStatus__5.crafting then
				p2.activeStatus[l__craftingEntity__12.id] = "CRAFTING";
				p2:updateBillboard(l__craftingEntity__12, l__CraftingStatus__5.crafting, v11, "Crafting", p6.timeToCraft);
				v14.Enabled = false;
				return;
			end;
			if l__status__13 ~= l__CraftingStatus__5.finished then
				return;
			end;
			v14.Enabled = true;
			p2.activeStatus[l__craftingEntity__12.id] = "FINISHED";
			p2:updateBillboard(l__craftingEntity__12, l__CraftingStatus__5.finished, v11, "Item Collection");
			p2:updatePrompt(l__craftingEntity__12, "Collect");
		end);
	end);
	l__default__4.Client:WaitFor("RemoteName"):andThen(function(p7)
		p7:Connect(function(p8)
			local v15 = {};
			for v16, v17 in pairs(p8.craftingEntity) do
				v15[v16] = v17;
			end;
			local l__LocalPlayer__18 = l__Players__6.LocalPlayer;
			local v19 = l__KnitClient__7.Controllers.KitController:getKit(l__LocalPlayer__18);
			local v20 = false;
			p2.whitelist = p8.whitelist;
			local l__accessLevel__21 = p8.accessLevel;
			if l__accessLevel__21 == "OWNER" then
				if v19 == p8.kit and v15.owner == l__Players__6.LocalPlayer then
					p2:updateBillboard(p8.craftingEntity, l__CraftingStatus__5.standby);
					p2:createPrompts(p8.craftingEntity);
					return;
				end;
			elseif l__accessLevel__21 == "TEAM" then
				local v22 = l__LocalPlayer__18.Team;
				if v22 ~= nil then
					v22 = v22:GetPlayers();
				end;
				if v22 ~= nil then
					for v23, v24 in ipairs(v22) do
						if l__KnitClient__7.Controllers.KitController:getKit(v24) == p8.kit then
							v20 = true;
						end;
					end;
					if v19 == p8.kit or v20 then
						p2:updateBillboard(p8.craftingEntity, l__CraftingStatus__5.standby);
						p2:createPrompts(p8.craftingEntity);
						return;
					end;
				end;
			elseif l__accessLevel__21 == "ANY" then
				if v19 == p8.kit then
					p2:updateBillboard(p8.craftingEntity, l__CraftingStatus__5.standby);
					p2:createPrompts(p8.craftingEntity);
					return;
				end;
			elseif v19 == p8.kit then
				p2:updateBillboard(p8.craftingEntity, l__CraftingStatus__5.standby);
				p2:createPrompts(p8.craftingEntity);
				print("Error: Access Level Not Found.");
			end;
		end);
	end);
end;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__BrewingCauldron__9 = v1.import(script, script.Parent, "ui", "brewing-cauldron").BrewingCauldron;
function v4.updateBillboard(p9, p10, p11, p12, p13, p14)
	local v25 = p9.activeBillboards[p10.id];
	local v26 = p12 or {};
	if p13 == nil then
		p13 = "Ingredients";
	end;
	if p14 == nil then
		p14 = 8;
	end;
	if v25 then
		u8.update(v25, u8.createElement(l__BrewingCauldron__9, {
			Inventory = v26, 
			CraftingStatus = p11, 
			Text = p13, 
			timeToCraft = p14
		}));
		return;
	end;
	p9.activeBillboards[p10.id] = u8.mount(u8.createElement(l__BrewingCauldron__9, {
		Inventory = v26, 
		Text = "Deposit Ingredients", 
		CraftingStatus = p11, 
		timeToCraft = p14
	}), p10.craftingBlock);
end;
local l__EntityUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
function v4.updatePrompt(p15, p16, p17)
	local v27 = p15.activeInteractivePrompts[p16.id];
	if v27 == nil then
		return nil;
	end;
	v27.ActionText = p17;
	local v28 = l__EntityUtil__10:getEntity(l__Players__6.LocalPlayer);
	if v28 == nil then
		return nil;
	end;
	local v29 = v28:getItemInHand();
	if v29 ~= nil then
		v29 = v29.Name;
	end;
	if v29 == nil then
		return nil;
	end;
	if p15.activeStatus[p16.id] == "STANDBY" then
		p15:TogglePrompt(p16.id, v29, v27);
	end;
end;
local l__WatchCharacter__11 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCharacter;
function v4.onItemSwap(p18, p19)
	l__WatchCharacter__11(function(p20, p21)
		if p20 ~= l__Players__6.LocalPlayer then
			return nil;
		end;
		local v30 = l__EntityUtil__10:getEntity(p20);
		if not v30 then
			return nil;
		end;
		task.spawn(function()
			v30:getInstance():WaitForChild("HandInvItem");
			v30:getInstance().HandInvItem.Changed:Connect(function(p22)
				local v31 = nil;
				v31 = p18.activeInteractivePrompts[p19];
				if p22 == nil or v31 == nil then
					return nil;
				end;
				p18:TogglePrompt(p19, p22.Name, v31);
			end);
		end);
	end);
end;
function v4.TogglePrompt(p23, p24, p25, p26)
	if p23.activeStatus[p24] == "CRAFTING" or p23.activeStatus[p24] == "VALIDATE" then
		p26.Enabled = false;
		return;
	end;
	if p23.activeStatus[p24] ~= "STANDBY" then
		p26.Enabled = true;
		return;
	end;
	if table.find(p23.whitelist, p25) ~= nil then
		p26.Enabled = true;
		return;
	end;
	p26.Enabled = false;
end;
local u12 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__InventoryUtil__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__GameAnimationUtil__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v4.createPrompts(p27, p28)
	local v32 = u12("ProximityPrompt", {
		Name = "InteractPrompt", 
		KeyboardKeyCode = l__Theme__13.promptKeyboardKey, 
		RequiresLineOfSight = false, 
		MaxActivationDistance = 6, 
		ActionText = "Deposit", 
		ClickablePrompt = false, 
		Parent = p28.craftingBlock
	});
	v32.Enabled = false;
	v32.Triggered:Connect(function(p29)
		if p29 == l__Players__6.LocalPlayer then
			local v33 = l__InventoryUtil__14.getInventory(p29).hand;
			if v33 ~= nil then
				v33 = v33.itemType;
			end;
			l__GameAnimationUtil__15.playAnimation(p29, l__AnimationType__16.PUNCH);
			l__KnitClient__7.Controllers.ViewmodelController:playAnimation(l__AnimationType__16.FP_USE_ITEM);
			l__default__4.Client:Get("RemoteName"):SendToServer({
				craftingEntity = p28, 
				itemInHand = v33
			});
		end;
	end);
	p27.activeInteractivePrompts[p28.id] = v32;
	p27.activeStatus[p28.id] = "STANDBY";
	p27:onItemSwap(p28.id);
end;
u1 = l__KnitClient__7.CreateController;
u1 = u1(v4.new());
return nil;
