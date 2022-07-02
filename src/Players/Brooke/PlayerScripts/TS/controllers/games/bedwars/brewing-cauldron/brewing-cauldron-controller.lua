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
local l__KnitClient__7 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	for v6, v7 in ipairs((l__CollectionService__2:GetTagged("brewing_cauldron"))) do
		local v8 = print("todo");
	end;
	l__CollectionService__2:GetInstanceRemovedSignal("brewing_cauldron"):Connect(function(p3)
		if p3.Parent == l__Workspace__3 then
			return nil;
		end;
		local l__Position__9 = p3.Position;
		p2.activeBillboards[l__Position__9] = nil;
		p2.activeStatus[l__Position__9] = nil;
	end);
	l__default__4.Client:WaitFor("RemoteName"):andThen(function(p4)
		p4:Connect(function(p5)
			local v10 = nil;
			local l__craftingEntity__11 = p5.craftingEntity;
			v10 = p5.inventory;
			local l__status__12 = p5.status;
			local v13 = p2.activeInteractivePrompts[l__craftingEntity__11.id];
			if v13 == nil then
				return nil;
			end;
			if l__status__12 == l__CraftingStatus__5.standby then
				p2.activeStatus[l__craftingEntity__11.id] = "STANDBY";
				p2:updateBillboard(l__craftingEntity__11, l__status__12, v10);
				p2:updatePrompt(l__craftingEntity__11, "Deposit");
				return;
			end;
			if l__status__12 == l__CraftingStatus__5.validate then
				p2:updateBillboard(l__craftingEntity__11, l__status__12, v10);
				p2:updatePrompt(l__craftingEntity__11, "Deposit");
				p2.activeStatus[l__craftingEntity__11.id] = "VALIDATE";
				return;
			end;
			if l__status__12 == l__CraftingStatus__5.crafting then
				p2.activeStatus[l__craftingEntity__11.id] = "CRAFTING";
				p2:updateBillboard(l__craftingEntity__11, l__CraftingStatus__5.crafting, v10, "Crafting", p5.timeToCraft);
				v13.Enabled = false;
				return;
			end;
			if l__status__12 ~= l__CraftingStatus__5.finished then
				return;
			end;
			v13.Enabled = true;
			p2.activeStatus[l__craftingEntity__11.id] = "FINISHED";
			p2:updateBillboard(l__craftingEntity__11, l__CraftingStatus__5.finished, v10, "Item Collection");
			p2:updatePrompt(l__craftingEntity__11, "Collect");
		end);
	end);
	l__default__4.Client:WaitFor("RemoteName"):andThen(function(p6)
		p6:Connect(function(p7)
			local v14 = {};
			for v15, v16 in pairs(p7.craftingEntity) do
				v14[v15] = v16;
			end;
			local l__LocalPlayer__17 = l__Players__6.LocalPlayer;
			local v18 = l__KnitClient__7.Controllers.KitController:getKit(l__LocalPlayer__17);
			local v19 = false;
			p2.whitelist = p7.whitelist;
			local l__accessLevel__20 = p7.accessLevel;
			if l__accessLevel__20 == "OWNER" then
				if v18 == p7.kit and v14.owner == l__Players__6.LocalPlayer then
					p2:updateBillboard(p7.craftingEntity, l__CraftingStatus__5.standby);
					p2:createPrompts(p7.craftingEntity);
					return;
				end;
			elseif l__accessLevel__20 == "TEAM" then
				local v21 = l__LocalPlayer__17.Team;
				if v21 ~= nil then
					v21 = v21:GetPlayers();
				end;
				if v21 ~= nil then
					for v22, v23 in ipairs(v21) do
						if l__KnitClient__7.Controllers.KitController:getKit(v23) == p7.kit then
							v19 = true;
						end;
					end;
					if v18 == p7.kit or v19 then
						p2:updateBillboard(p7.craftingEntity, l__CraftingStatus__5.standby);
						p2:createPrompts(p7.craftingEntity);
						return;
					end;
				end;
			elseif l__accessLevel__20 == "ANY" then
				if v18 == p7.kit then
					p2:updateBillboard(p7.craftingEntity, l__CraftingStatus__5.standby);
					p2:createPrompts(p7.craftingEntity);
					return;
				end;
			elseif v18 == p7.kit then
				p2:updateBillboard(p7.craftingEntity, l__CraftingStatus__5.standby);
				p2:createPrompts(p7.craftingEntity);
				print("Error: Access Level Not Found.");
			end;
		end);
	end);
end;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__BrewingCauldron__9 = v1.import(script, script.Parent, "ui", "brewing-cauldron").BrewingCauldron;
function v4.updateBillboard(p8, p9, p10, p11, p12, p13)
	local v24 = p8.activeBillboards[p9.id];
	local v25 = p11 or {};
	if p12 == nil then
		p12 = "Ingredients";
	end;
	if p13 == nil then
		p13 = 8;
	end;
	if v24 then
		u8.update(v24, u8.createElement(l__BrewingCauldron__9, {
			Inventory = v25, 
			CraftingStatus = p10, 
			Text = p12, 
			timeToCraft = p13
		}));
		return;
	end;
	p8.activeBillboards[p9.id] = u8.mount(u8.createElement(l__BrewingCauldron__9, {
		Inventory = v25, 
		Text = "Deposit Ingredients", 
		CraftingStatus = p10, 
		timeToCraft = p13
	}), p9.craftingBlock);
end;
local l__EntityUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
function v4.updatePrompt(p14, p15, p16)
	local v26 = p14.activeInteractivePrompts[p15.id];
	if v26 == nil then
		return nil;
	end;
	v26.ActionText = p16;
	local v27 = l__EntityUtil__10:getEntity(l__Players__6.LocalPlayer);
	if v27 == nil then
		return nil;
	end;
	local v28 = v27:getItemInHand();
	if v28 ~= nil then
		v28 = v28.Name;
	end;
	if v28 == nil then
		return nil;
	end;
	if p14.activeStatus[p15.id] == "STANDBY" then
		p14:TogglePrompt(p15.id, v28, v26);
	end;
end;
local l__WatchCharacter__11 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCharacter;
function v4.onItemSwap(p17, p18)
	l__WatchCharacter__11(function(p19, p20)
		if p19 ~= l__Players__6.LocalPlayer then
			return nil;
		end;
		local v29 = l__EntityUtil__10:getEntity(p19);
		if not v29 then
			return nil;
		end;
		task.spawn(function()
			v29:getInstance():WaitForChild("HandInvItem");
			v29:getInstance().HandInvItem.Changed:Connect(function(p21)
				local v30 = nil;
				v30 = p17.activeInteractivePrompts[p18];
				if p21 == nil or v30 == nil then
					return nil;
				end;
				p17:TogglePrompt(p18, p21.Name, v30);
			end);
		end);
	end);
end;
function v4.TogglePrompt(p22, p23, p24, p25)
	if p22.activeStatus[p23] == "CRAFTING" or p22.activeStatus[p23] == "VALIDATE" then
		p25.Enabled = false;
		return;
	end;
	if p22.activeStatus[p23] ~= "STANDBY" then
		p25.Enabled = true;
		return;
	end;
	if table.find(p22.whitelist, p24) ~= nil then
		p25.Enabled = true;
		return;
	end;
	p25.Enabled = false;
end;
local u12 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__InventoryUtil__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__GameAnimationUtil__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v4.createPrompts(p26, p27)
	local v31 = u12("ProximityPrompt", {
		Name = "InteractPrompt", 
		KeyboardKeyCode = l__Theme__13.promptKeyboardKey, 
		RequiresLineOfSight = false, 
		MaxActivationDistance = 6, 
		ActionText = "Deposit", 
		ClickablePrompt = false, 
		Parent = p27.craftingBlock
	});
	v31.Enabled = false;
	v31.Triggered:Connect(function(p28)
		if p28 == l__Players__6.LocalPlayer then
			local v32 = l__InventoryUtil__14.getInventory(p28).hand;
			if v32 ~= nil then
				v32 = v32.itemType;
			end;
			l__GameAnimationUtil__15.playAnimation(p28, l__AnimationType__16.PUNCH);
			l__KnitClient__7.Controllers.ViewmodelController:playAnimation(l__AnimationType__16.FP_USE_ITEM);
			l__default__4.Client:Get("RemoteName"):SendToServer({
				craftingEntity = p27, 
				itemInHand = v32
			});
		end;
	end);
	p26.activeInteractivePrompts[p27.id] = v31;
	p26.activeStatus[p27.id] = "STANDBY";
	p26:onItemSwap(p27.id);
end;
u1 = l__KnitClient__7.CreateController;
u1 = u1(v4.new());
return nil;
