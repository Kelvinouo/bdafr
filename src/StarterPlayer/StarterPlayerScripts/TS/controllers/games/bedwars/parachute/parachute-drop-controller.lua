-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "ParachuteDropController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "ParachuteDropController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Tween__2 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).Tween;
local l__Workspace__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
local l__Linear__4 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).Linear;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	l__default__1.Client:OnEvent("RemoteName", function(p3)
		local v5, v6, v7 = ipairs(p3);
		while true do
			v5(v6, v7);
			if not v5 then
				break;
			end;
			v7 = v5;
			task.spawn(function()
				if v6.model.PrimaryPart == nil then
					v6.model:GetPropertyChangedSignal("PrimaryPart"):Wait();
				end;
				l__Tween__2(v6.arriveTime - 0.1 - l__Workspace__3:GetServerTimeNow(), l__Linear__4, function(p4)
					if v6.model.PrimaryPart then
						v6.model:SetPrimaryPartCFrame(CFrame.new(p4));
					end;
				end, v6.model:GetPrimaryPartCFrame().Position, v6.position);
			end);		
		end;
	end);
end;
local v8 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
