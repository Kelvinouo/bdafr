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
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "TeamScoreController";
end;
local l__Workspace__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
local l__ClientStore__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	local l__TeamScores__5 = l__Workspace__1:WaitForChild("TeamScores");
	local v6 = {};
	local v7, v8, v9 = ipairs(l__TeamScores__5:GetChildren());
	while true do
		v7(v8, v9);
		if not v7 then
			break;
		end;
		v9 = v7;
		p2:hookScoreInstance(v8);
		table.insert(v6, v8);	
	end;
	local v10 = {
		type = "GameSetTeamScores"
	};
	local v11 = table.create(#v6);
	local v12, v13, v14 = ipairs(v6);
	while true do
		v12(v13, v14);
		if not v12 then
			break;
		end;
		v14 = v12;
		v11[v12] = {
			teamId = v13.Name, 
			score = v13:GetAttribute("Score")
		};	
	end;
	v10.teamScores = v11;
	l__ClientStore__2:dispatch(v10);
	l__TeamScores__5.ChildAdded:Connect(function(p3)
		l__ClientStore__2:dispatch({
			type = "GameAddTeamScore", 
			teamId = p3.Name, 
			score = p3:GetAttribute("Score")
		});
		p2:hookScoreInstance(p3);
	end);
end;
function v3.hookScoreInstance(p4, p5)
	p5:GetAttributeChangedSignal("Score"):Connect(function(p6)
		l__ClientStore__2:dispatch({
			type = "GameUpdateTeamScore", 
			teamId = p5.Name, 
			score = p6
		});
	end);
end;
local v15 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
