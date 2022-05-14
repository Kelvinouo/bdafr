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
		local function v9(p6)
			if not p6.refillable then
				return;
			end;
			table.insert(v7, p6);
			return nil;
		end;
		for v10, v11 in ipairs(l__items__8) do
			v9(v11, v10 - 1, l__items__8);
		end;
	end;
	if #v7 ~= 0 and p3.refillSet[p5] == nil then
		p3.refillSet[p5] = true;
		local function v12(p7)
			p3:refillItemLoop(p4, p7, p5);
		end;
		for v13, v14 in ipairs(v7) do
			v12(v14, v13 - 1, v7);
		end;
	end;
end;
local l__InventoryUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
function v3.refillItemLoop(p8, p9, p10, p11)
	local v15 = p10.refillCooldown;
	if v15 == nil then
		v15 = 4;
	end;
	task.defer(function()
		while { wait(v15) } do
			if p9:GetAttribute("LobbyGadgetType") ~= p11 then
				p8.refillSet[p11] = nil;
				return nil;
			end;
			local l__items__16 = l__InventoryUtil__5.getInventory(p9).items;
			local function v17(p12)
				return p12.itemType == p10.itemType;
			end;
			local v18 = nil;
			for v19, v20 in ipairs(l__items__16) do
				if v17(v20, v19 - 1, l__items__16) == true then
					v18 = v20;
					break;
				end;
			end;
			local v21 = not v18;
			if not v21 then
				local v22 = p10.amount;
				if v22 == nil then
					v22 = 1;
				end;
				v21 = v18.amount < v22;
			end;
			if v21 then
				local v23 = p8.lockerNamespace:Get("RefillLobbyGadgetItem"):CallServer({
					lobbyGadgetItem = p10
				});
			end;		
		end;
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
