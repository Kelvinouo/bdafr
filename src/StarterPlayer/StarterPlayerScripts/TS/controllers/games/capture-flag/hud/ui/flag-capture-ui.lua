-- Script Hash: c133e83f530fda006a7bc6037d322c6615192b590c2af3a0497e46ce41d4909e69591f1cfcaabaf85d7920d836c53e53
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.Component:extend("FlagScoreUI");
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v3.init(p1, p2)
	p1.enemyColor = Color3.fromRGB(255, 0, 0);
	p1.connectionMaid = u1.new();
	p1.flagStatusMessage = "";
	p1:getEnemyColor();
	p1:listenToScoreUpdate();
	p1:listenToFlagUpdate();
end;
function v3.render(p3)
	return v2.createFragment({ p3:createYourScore(), p3:displayFlagStatus() });
end;
function v3.willUnmount(p4)
	p4.connectionMaid:DoCleaning();
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function v3.listenToFlagUpdate(p5)
	local u4 = nil;
	u4 = l__default__2.Client:WaitFor("RemoteName"):expect():Connect(function(p6)
		local v4 = l__Players__3.LocalPlayer.Team;
		if v4 ~= nil then
			v4 = v4.Name;
		end;
		if p6.teamColor == v4 then
			if p6.teamFlag == false then
				p5.flagStatusMessage = "Your Flag Has Been Taken!";
			else
				p5.flagStatusMessage = "";
			end;
			p5.props.yourFlag = p6.teamFlag;
			p5:setState({
				yourFlag = p6.teamFlag
			});
		end;
		p5.connectionMaid:GiveTask(u4);
	end);
end;
function v3.listenToScoreUpdate(p7)
	local u5 = 0;
	local u6 = 0;
	local u7 = nil;
	u7 = l__default__2.Client:WaitFor("RemoteName"):expect():Connect(function(p8)
		local v5 = l__Players__3.LocalPlayer.Team;
		if v5 ~= nil then
			v5 = v5.Name;
		end;
		if p8.teamOneColor == v5 then
			u5 = p8.teamOneScore;
			u6 = p8.teamTwoScore;
		else
			u6 = p8.teamOneScore;
			u5 = p8.teamTwoScore;
		end;
		p7.props.yourScore = u5;
		p7.props.enemyScore = u6;
		p7:setState({
			yourScore = u5, 
			enemyScore = u6
		});
		p7.connectionMaid:GiveTask(u7);
	end);
end;
function v3.createYourScore(p9)
	local v6 = {
		Position = UDim2.fromScale(0.4, 0), 
		Size = UDim2.fromScale(0.08, 0.08), 
		BackgroundTransparency = 1, 
		AutomaticSize = Enum.AutomaticSize.X, 
		BorderSizePixel = 0
	};
	local v7 = {};
	local v8 = #v7;
	local v9 = {
		Position = UDim2.fromScale(0, 0), 
		BackgroundTransparency = 1, 
		Size = UDim2.fromScale(1, 1)
	};
	local v10 = l__Players__3.LocalPlayer.Team;
	if v10 ~= nil then
		v10 = v10.TeamColor.Color;
	end;
	v9.TextColor3 = v10;
	v9.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	v9.TextStrokeTransparency = 0;
	v9.RichText = true;
	v9.Font = Enum.Font.LuckiestGuy;
	v9.Text = tostring(p9.props.yourScore);
	v9.TextScaled = true;
	v7[v8 + 1] = v2.createElement("TextLabel", v9);
	v7[v8 + 2] = v2.createElement("TextLabel", {
		Position = UDim2.fromScale(0.5, 0), 
		BackgroundTransparency = 1, 
		Size = UDim2.fromScale(1, 1), 
		TextColor3 = Color3.fromRGB(255, 255, 255), 
		TextStrokeColor3 = Color3.fromRGB(255, 255, 255), 
		TextStrokeTransparency = 0, 
		RichText = true, 
		Font = Enum.Font.LuckiestGuy, 
		Text = ":", 
		TextScaled = true
	});
	v7[v8 + 3] = v2.createElement("TextLabel", {
		Position = UDim2.fromScale(1, 0), 
		BackgroundTransparency = 1, 
		Size = UDim2.fromScale(1, 1), 
		TextColor3 = p9.enemyColor, 
		TextStrokeColor3 = Color3.fromRGB(0, 0, 0), 
		TextStrokeTransparency = 0, 
		RichText = true, 
		Font = Enum.Font.LuckiestGuy, 
		Text = tostring(p9.props.enemyScore), 
		TextScaled = true
	});
	return v2.createElement("Frame", v6, v7);
end;
function v3.displayFlagStatus(p10)
	return v2.createElement("TextLabel", {
		Position = UDim2.fromScale(0.35, 0.1), 
		BackgroundTransparency = 1, 
		Size = UDim2.fromScale(0.3, 0.07), 
		TextColor3 = Color3.fromRGB(255, 36, 36), 
		TextStrokeColor3 = Color3.fromRGB(0, 0, 0), 
		TextStrokeTransparency = 0, 
		RichText = true, 
		Font = Enum.Font.LuckiestGuy, 
		Text = p10.flagStatusMessage, 
		TextScaled = true
	});
end;
function v3.getEnemyColor(p11)
	local v11 = l__Players__3.LocalPlayer.Team;
	if v11 ~= nil then
		v11 = v11.Name;
	end;
	if v11 == "Blue" then
		p11.enemyColor = Color3.fromRGB(255, 237, 0);
		return;
	end;
	p11.enemyColor = Color3.fromRGB(0, 194, 255);
end;
local u8 = {
	yourScore = 0, 
	enemyScore = 0, 
	yourFlag = true, 
	enemyFlag = true
};
return {
	ScoreBoardWrapper = function()
		return v2.createElement("ScreenGui", {
			ResetOnSpawn = false
		}, { v2.createElement(v3, {
				yourScore = u8.yourScore, 
				enemyScore = u8.enemyScore, 
				yourFlag = u8.yourFlag, 
				enemyFlag = u8.enemyFlag
			}) });
	end, 
	FlagScoreUI = v3
};
