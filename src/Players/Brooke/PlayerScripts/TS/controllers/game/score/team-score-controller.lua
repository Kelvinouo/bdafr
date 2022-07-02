-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "TeamScoreController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__KnitController__2;
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "TeamScoreController";
end;
local l__Workspace__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	local l__TeamScores__5 = l__Workspace__2:WaitForChild("TeamScores");
	local v6 = {};
	for v7, v8 in ipairs(l__TeamScores__5:GetChildren()) do
		p2:hookScoreInstance(v8);
		table.insert(v6, v8);
	end;
	local v9 = {
		type = "GameSetTeamScores"
	};
	local v10 = table.create(#v6);
	for v11, v12 in ipairs(v6) do
		v10[v11] = {
			teamId = v12.Name, 
			score = v12:GetAttribute("Score")
		};
	end;
	v9.teamScores = v10;
	l__ClientStore__3:dispatch(v9);
	l__TeamScores__5.ChildAdded:Connect(function(p3)
		l__ClientStore__3:dispatch({
			type = "GameAddTeamScore", 
			teamId = p3.Name, 
			score = p3:GetAttribute("Score")
		});
		p2:hookScoreInstance(p3);
	end);
end;
function v3.hookScoreInstance(p4, p5)
	p5:GetAttributeChangedSignal("Score"):Connect(function(p6)
		l__ClientStore__3:dispatch({
			type = "GameUpdateTeamScore", 
			teamId = p5.Name, 
			score = p6
		});
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
