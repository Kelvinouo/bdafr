
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "LockerController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
local u2 = l__KnitController__2;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "LockerController";
	p1.namespace = l__default__3.Client:GetNamespace("Locker");
end;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function u1.KnitStart(p2)
	p2.namespace:WaitFor("GetLocker"):andThen(function(p3)
		l__ClientStore__4:dispatch({
			type = "LockerUpdateAll", 
			locker = p3:CallServer()
		});
	end);
	p2.namespace:WaitFor("LockerUpdate"):andThen(function(p4)
		p4:Connect(function(p5)
			l__ClientStore__4:dispatch({
				type = "LockerUpdateAll", 
				locker = p5.locker
			});
		end);
	end);
end;
function u1.setLockerItem(p6, p7)

end;
function u1.setSpray(p8, p9)
	if p8.namespace:Get("SetSpray"):CallServer({
		spray = p9
	}) then
		l__ClientStore__4:dispatch({
			type = "LockerSetSpray", 
			spray = p9
		});
	end;
end;
function u1.setKillEffect(p10, p11)
	if p10.namespace:Get("SetKillEffect"):CallServer({
		killEffect = p11
	}) then
		l__ClientStore__4:dispatch({
			type = "LockerSetKillEffect", 
			killEffect = p11
		});
	end;
end;
function u1.setTitle(p12, p13)
	if p12.namespace:Get("SetTitle"):CallServer({
		title = p13
	}) then
		l__ClientStore__4:dispatch({
			type = "LockerSetTitle", 
			title = p13
		});
	end;
end;
function u1.setLobbyGadget(p14, p15)
	if p14.namespace:Get("SetLobbyGadget"):CallServer({
		lobbyGadget = p15
	}) then
		l__ClientStore__4:dispatch({
			type = "LockerSetLobbyGadget", 
			lobbyGadget = p15
		});
	end;
end;
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;

