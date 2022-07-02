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
local u1 = l__KnitController__2;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "LobbyGadgetController";
	p1.lockerNamespace = l__default__2.Client:GetNamespace("Locker");
	p1.refillSet = {};
end;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	local l__LocalPlayer__5 = l__Players__3.LocalPlayer;
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
local l__LobbyGadgetMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-meta").LobbyGadgetMeta;
function v3.setupGadgetRefill(p3, p4, p5)
	local v7 = {};
	local l__items__8 = l__LobbyGadgetMeta__4[p5].items;
	if l__items__8 ~= nil then
		for v9, v10 in ipairs(l__items__8) do
			if v10.refillable then
				table.insert(v7, v10);
			end;
		end;
	end;
	if #v7 ~= 0 and p3.refillSet[p5] == nil then
		p3.refillSet[p5] = true;
		for v11, v12 in ipairs(v7) do
			p3:refillItemLoop(p4, v12, p5);
		end;
	end;
end;
local l__InventoryUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
function v3.refillItemLoop(p6, p7, p8, p9)
	local v13 = p8.refillCooldown;
	if v13 == nil then
		v13 = 4;
	end;
	task.defer(function()
		while { wait(v13) } do
			if p7:GetAttribute("LobbyGadgetType") ~= p9 then
				p6.refillSet[p9] = nil;
				return nil;
			end;
			local v14 = nil;
			for v15, v16 in ipairs(l__InventoryUtil__5.getInventory(p7).items) do
				if v16.itemType == p8.itemType == true then
					v14 = v16;
					break;
				end;
			end;
			local v17 = not v14;
			if not v17 then
				local v18 = p8.amount;
				if v18 == nil then
					v18 = 1;
				end;
				v17 = v14.amount < v18;
			end;
			if v17 then
				local v19 = p6.lockerNamespace:Get("RefillLobbyGadgetItem"):CallServer({
					lobbyGadgetItem = p8
				});
			end;		
		end;
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
