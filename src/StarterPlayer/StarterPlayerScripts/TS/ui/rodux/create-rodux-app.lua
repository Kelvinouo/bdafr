-- Script Hash: 48bf0040c59e1f68b256c761f1ecabaab24d07fa5bbad3e2ff1a76c160194dbafe8cf20c1bfa2f54a1266b8194c2041d
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__StoreProvider__2 = v2.StoreProvider;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent, "store").ClientStore;
local l__Players__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
return {
	BuildRoduxApp = function(p1, p2, p3, p4)
		if p2 == nil then
			p2 = {};
		end;
		if p3 == nil then
			p3 = {};
		end;
		return u1.createElement(l__StoreProvider__2, {
			store = l__ClientStore__3
		}, { u1.createElement((v2.connect(function(p5)
				local v3 = p4;
				if v3 ~= nil then
					v3 = v3.disableStore;
				end;
				if v3 == false then
					local v4 = nil;
				else
					v4 = p5;
				end;
				local v5 = {
					store = v4
				};
				for v6, v7 in pairs(p2) do
					v5[v6] = v7;
				end;
				return v5;
			end, function()
				local v8 = {};
				for v9, v10 in pairs(p3) do
					v8[v9] = v10;
				end;
				return v8;
			end)(p1))) });
	end, 
	CreateRoduxApp = function(p6, p7, p8, p9, p10)
		if p8 == nil then
			p8 = {};
		end;
		if p9 == nil then
			p9 = {};
		end;
		local v11 = p10;
		if v11 ~= nil then
			v11 = v11.Parent;
		end;
		local v12 = v11;
		if v12 == nil then
			v12 = l__Players__4.LocalPlayer:WaitForChild("PlayerGui");
		end;
		return u1.mount(u1.createElement(l__StoreProvider__2, {
			store = l__ClientStore__3
		}, { u1.createElement((v2.connect(function(p11)
				local v13 = p10;
				if v13 ~= nil then
					v13 = v13.disableStore;
				end;
				if v13 == false then
					local v14 = nil;
				else
					v14 = p11;
				end;
				local v15 = {
					store = v14
				};
				for v16, v17 in pairs(p8) do
					v15[v16] = v17;
				end;
				return v15;
			end, function()
				local v18 = {};
				for v19, v20 in pairs(p9) do
					v18[v19] = v20;
				end;
				return v18;
			end)(p7))) }), v12, p6);
	end
};
