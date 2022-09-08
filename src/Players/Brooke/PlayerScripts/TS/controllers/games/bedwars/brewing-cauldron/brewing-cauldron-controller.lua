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
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "BrewingCauldronController";
	p1.whitelist = {};
	p1.activeBillboards = {};
	p1.activeInteractivePrompts = {};
	p1.activeStatus = {};
end;
local l__CollectionService__1 = v2.CollectionService;
local l__Workspace__2 = v2.Workspace;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__CraftingStatus__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "crafting-entity", "crafting-entity-types").CraftingStatus;
local l__Players__5 = v2.Players;
local l__KnitClient__6 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	local v6, v7, v8 = ipairs((l__CollectionService__1:GetTagged("brewing_cauldron")));
	while true do
		v6(v7, v8);
		if not v6 then
			break;
		end;
		v8 = v6;
		local v9 = print("todo");	
	end;
	l__CollectionService__1:GetInstanceRemovedSignal("brewing_cauldron"):Connect(function(p3)
		if p3.Parent == l__Workspace__2 then
			return nil;
		end;
		local l__Position__10 = p3.Position;
		p2.activeBillboards[l__Position__10] = nil;
		p2.activeStatus[l__Position__10] = nil;
	end);
	l__default__3.Client:WaitFor("RemoteName"):andThen(function(p4)
		p4:Connect(function(p5)
			local v11 = nil;
			local l__craftingEntity__12 = p5.craftingEntity;
			v11 = p5.inventory;
			local l__status__13 = p5.status;
			local v14 = p2.activeInteractivePrompts[l__craftingEntity__12.id];
			if v14 == nil then
				return nil;
			end;
			if l__status__13 == l__CraftingStatus__4.standby then
				p2.activeStatus[l__craftingEntity__12.id] = "STANDBY";
				p2:updateBillboard(l__craftingEntity__12, l__status__13, v11);
				p2:updatePrompt(l__craftingEntity__12, "Deposit");
				return;
			end;
			if l__status__13 == l__CraftingStatus__4.validate then
				p2:updateBillboard(l__craftingEntity__12, l__status__13, v11);
				p2:updatePrompt(l__craftingEntity__12, "Deposit");
				p2.activeStatus[l__craftingEntity__12.id] = "VALIDATE";
				return;
			end;
			if l__status__13 == l__CraftingStatus__4.crafting then
				p2.activeStatus[l__craftingEntity__12.id] = "CRAFTING";
				p2:updateBillboard(l__craftingEntity__12, l__CraftingStatus__4.crafting, v11, "Crafting", p5.timeToCraft);
				v14.Enabled = false;
				return;
			end;
			if l__status__13 ~= l__CraftingStatus__4.finished then
				return;
			end;
			v14.Enabled = true;
			p2.activeStatus[l__craftingEntity__12.id] = "FINISHED";
			p2:updateBillboard(l__craftingEntity__12, l__CraftingStatus__4.finished, v11, "Item Collection");
			p2:updatePrompt(l__craftingEntity__12, "Collect");
		end);
	end);
	l__default__3.Client:WaitFor("RemoteName"):andThen(function(p6)
		p6:Connect(function(p7)
			local v15 = {};
			for v16, v17 in pairs(p7.craftingEntity) do
				v15[v16] = v17;
			end;
			local l__LocalPlayer__18 = l__Players__5.LocalPlayer;
			local v19 = l__KnitClient__6.Controllers.KitController:getKit(l__LocalPlayer__18);
			local v20 = false;
			p2.whitelist = p7.whitelist;
			local l__accessLevel__21 = p7.accessLevel;
			if l__accessLevel__21 == "OWNER" then
				if v19 == p7.kit and v15.owner == l__Players__5.LocalPlayer then
					p2:updateBillboard(p7.craftingEntity, l__CraftingStatus__4.standby);
					p2:createPrompts(p7.craftingEntity);
					return;
				end;
			elseif l__accessLevel__21 == "TEAM" then
				local v22 = l__LocalPlayer__18.Team;
				if v22 ~= nil then
					v22 = v22:GetPlayers();
				end;
				if v22 ~= nil then
					local v23, v24, v25 = ipairs(v22);
					while true do
						v23(v24, v25);
						if not v23 then
							break;
						end;
						v25 = v23;
						if l__KnitClient__6.Controllers.KitController:getKit(v24) == p7.kit then
							v20 = true;
						end;					
					end;
					if v19 == p7.kit or v20 then
						p2:updateBillboard(p7.craftingEntity, l__CraftingStatus__4.standby);
						p2:createPrompts(p7.craftingEntity);
						return;
					end;
				end;
			elseif l__accessLevel__21 == "ANY" then
				if v19 == p7.kit then
					p2:updateBillboard(p7.craftingEntity, l__CraftingStatus__4.standby);
					p2:createPrompts(p7.craftingEntity);
					return;
				end;
			elseif v19 == p7.kit then
				p2:updateBillboard(p7.craftingEntity, l__CraftingStatus__4.standby);
				p2:createPrompts(p7.craftingEntity);
				print("Error: Access Level Not Found.");
			end;
		end);
	end);
end;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__BrewingCauldron__8 = v1.import(script, script.Parent, "ui", "brewing-cauldron").BrewingCauldron;
function v4.updateBillboard(p8, p9, p10, p11, p12, p13)
	local v26 = p8.activeBillboards[p9.id];
	local v27 = p11 or {};
	if p12 == nil then
		p12 = "Ingredients";
	end;
	if p13 == nil then
		p13 = 8;
	end;
	if v26 then
		u7.update(v26, u7.createElement(l__BrewingCauldron__8, {
			Inventory = v27, 
			CraftingStatus = p10, 
			Text = p12, 
			timeToCraft = p13
		}));
		return;
	end;
	p8.activeBillboards[p9.id] = u7.mount(u7.createElement(l__BrewingCauldron__8, {
		Inventory = v27, 
		Text = "Deposit Ingredients", 
		CraftingStatus = p10, 
		timeToCraft = p13
	}), p9.craftingBlock);
end;
local l__EntityUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
function v4.updatePrompt(p14, p15, p16)
	local v28 = p14.activeInteractivePrompts[p15.id];
	if v28 == nil then
		return nil;
	end;
	v28.ActionText = p16;
	local v29 = l__EntityUtil__9:getEntity(l__Players__5.LocalPlayer);
	if v29 == nil then
		return nil;
	end;
	local v30 = v29:getItemInHand();
	if v30 ~= nil then
		v30 = v30.Name;
	end;
	if v30 == nil then
		return nil;
	end;
	if p14.activeStatus[p15.id] == "STANDBY" then
		p14:TogglePrompt(p15.id, v30, v28);
	end;
end;
local l__WatchCharacter__10 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCharacter;
function v4.onItemSwap(p17, p18)
	l__WatchCharacter__10(function(p19, p20)
		if p19 ~= l__Players__5.LocalPlayer then
			return nil;
		end;
		local v31 = l__EntityUtil__9:getEntity(p19);
		if not v31 then
			return nil;
		end;
		task.spawn(function()
			v31:getInstance():WaitForChild("HandInvItem");
			v31:getInstance().HandInvItem.Changed:Connect(function(p21)
				local v32 = nil;
				v32 = p17.activeInteractivePrompts[p18];
				if p21 == nil or v32 == nil then
					return nil;
				end;
				p17:TogglePrompt(p18, p21.Name, v32);
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
local u11 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__InventoryUtil__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__GameAnimationUtil__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v4.createPrompts(p26, p27)
	local v33 = u11("ProximityPrompt", {
		Name = "InteractPrompt", 
		KeyboardKeyCode = l__Theme__12.promptKeyboardKey, 
		RequiresLineOfSight = false, 
		MaxActivationDistance = 6, 
		ActionText = "Deposit", 
		ClickablePrompt = false, 
		Parent = p27.craftingBlock
	});
	v33.Enabled = false;
	v33.Triggered:Connect(function(p28)
		if p28 == l__Players__5.LocalPlayer then
			local v34 = l__InventoryUtil__13.getInventory(p28).hand;
			if v34 ~= nil then
				v34 = v34.itemType;
			end;
			l__GameAnimationUtil__14.playAnimation(p28, l__AnimationType__15.PUNCH);
			l__KnitClient__6.Controllers.ViewmodelController:playAnimation(l__AnimationType__15.FP_USE_ITEM);
			l__default__3.Client:Get("RemoteName"):SendToServer({
				craftingEntity = p27, 
				itemInHand = v34
			});
		end;
	end);
	p26.activeInteractivePrompts[p27.id] = v33;
	p26.activeStatus[p27.id] = "STANDBY";
	p26:onItemSwap(p27.id);
end;
local v35 = l__KnitClient__6.CreateController(v4.new());
return nil;
