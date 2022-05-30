-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Toggle__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).Toggle;
local l__UserInputService__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).UserInputService;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
return {
	KitShopKitSkinToggle = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local v3 = {};
		if l__UserInputService__3.GamepadEnabled then
			local v4 = " (X)";
		else
			v4 = "";
		end;
		v3.Text = "<b>USE KIT SKIN" .. v4 .. "</b>";
		v3.Value = p1.UseKitSkin;
		function v3.SetValue(p3)
			l__default__4.Client:Get("RemoteName"):CallServerAsync({
				useKitSkin = p3
			}):andThen(function()

			end):catch(function(p4)
				warn(p4);
			end);
			l__ClientStore__5:dispatch({
				type = "SetUseKitSkin", 
				useKitSkin = p3
			});
		end;
		v3.AspectRatio = 4.85;
		v3.Size = p1.Size;
		v3.Selectable = false;
		v3.LayoutOrder = p1.LayoutOrder;
		return u1.createElement(l__Toggle__2, v3);
	end)
};
