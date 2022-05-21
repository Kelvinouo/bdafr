-- Script Hash: b9be45e012f959163ab243752cb534a307f1d95d081963c409252542d0afedad0163175f7dd6719c735aa7b73e3e9509
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CreateRoduxApp__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__ConfirmationModalApp__2 = v1.import(script, script.Parent, "confirmation-modal-base").ConfirmationModalApp;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	local u4 = l__CreateRoduxApp__1("ConfirmationModal", l__ConfirmationModalApp__2, {
		Title = "Delete Clan?", 
		Body = "Are you sure you want to delete this clan? You can't undo this action.", 
		OnButton1Click = function()
			print("yes");
		end, 
		OnButton2Click = function()
			print("no");
		end
	}, {}, {
		Parent = p1
	});
	return function()
		return u3.unmount(u4);
	end;
end;
