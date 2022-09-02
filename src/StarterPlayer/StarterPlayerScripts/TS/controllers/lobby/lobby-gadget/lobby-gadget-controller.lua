-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "LobbyGadgetController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "LobbyGadgetController";
	p1.lockerNamespace = l__default__1.Client:GetNamespace("Locker");
	p1.refillSet = {};
end;
local l__Players__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	local l__LocalPlayer__5 = l__Players__2.LocalPlayer;
	if l__LocalPlayer__5:GetAttribute("LobbyGadgetType") ~= nil then
		local v6 = l__LocalPlayer__5:GetAttribute("LobbyGadgetType");
		p2.lockerNamespace:Get("GiveLobbyGadget"):CallServer({
			lobbyGadget = v6
		});
		p2:setupGadgetRefill(l__LocalPlayer__5, v6);
	end;
	l__LocalPlayer__5:GetAttributeChangedSignal("LobbyGadgetType"):Connect(function()
		p2:setupGadgetRefill(l__LocalPlayer__5, (l__LocalPlayer__5:GetAttribute("LobbyGadgetType")));
	end);
end;
local l__LobbyGadgetMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-meta").LobbyGadgetMeta;
function v3.setupGadgetRefill(p3, p4, p5)
	local v7 = {};
	local l__items__8 = l__LobbyGadgetMeta__3[p5].items;
	if l__items__8 ~= nil then
		local v9, v10, v11 = ipairs(l__items__8);
		while true do
			v9(v10, v11);
			if not v9 then
				break;
			end;
			v11 = v9;
			if v10.refillable then
				table.insert(v7, v10);
			end;		
		end;
	end;
	if #v7 ~= 0 and p3.refillSet[p5] == nil then
		p3.refillSet[p5] = true;
		local v12, v13, v14 = ipairs(v7);
		while true do
			v12(v13, v14);
			if not v12 then
				break;
			end;
			v14 = v12;
			p3:refillItemLoop(p4, v13, p5);		
		end;
	end;
end;
local l__InventoryUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
function v3.refillItemLoop(p6, p7, p8, p9)
	local v15 = p8.refillCooldown;
	if v15 == nil then
		v15 = 4;
	end;
	task.defer(function()
		while { wait(v15) } do
			if p7:GetAttribute("LobbyGadgetType") ~= p9 then
				p6.refillSet[p9] = nil;
				return nil;
			end;
			local v16 = nil;
			local v17, v18, v19 = ipairs(l__InventoryUtil__4.getInventory(p7).items);
			while true do
				v17(v18, v19);
				if not v17 then
					break;
				end;
				v19 = v17;
				if v18.itemType == p8.itemType == true then
					v16 = v18;
					break;
				end;			
			end;
			local v20 = not v16;
			if not v20 then
				local v21 = p8.amount;
				if v21 == nil then
					v21 = 1;
				end;
				v20 = v16.amount < v21;
			end;
			if v20 then
				local v22 = p6.lockerNamespace:Get("RefillLobbyGadgetItem"):CallServer({
					lobbyGadgetItem = p8
				});
			end;		
		end;
	end);
end;
local v23 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
