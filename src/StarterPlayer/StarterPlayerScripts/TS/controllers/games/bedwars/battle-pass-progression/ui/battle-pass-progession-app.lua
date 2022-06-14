-- Script Hash: d3be60787726fd1278ffef1030d9dc563ff0e7f0d98e56ad6a12d42451668009864ef62f6dc9b76c408c84afe68349ec
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__BattlePassUtils__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__TweenService__3 = v3.TweenService;
local l__RunService__4 = v3.RunService;
local l__ClientSyncEvents__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__KnitClient__6 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__SlideIn__7 = v2.SlideIn;
local l__ScaleComponent__8 = v2.ScaleComponent;
local l__DeviceUtil__9 = v2.DeviceUtil;
local l__ColorUtil__10 = v2.ColorUtil;
local l__XPProgressBar__11 = v1.import(script, script.Parent, "xp-progress-bar").XPProgressBar;
local l__TotalXpGained__12 = v1.import(script, script.Parent, "total-xp-gained").TotalXpGained;
local u13 = nil;
u13 = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
	local l__useState__4 = p2.useState;
	local v5 = p1.AnchorPoint;
	if v5 == nil then
		v5 = Vector2.new(0.5, 0.5);
	end;
	local v6 = p1.Position;
	if v6 == nil then
		v6 = UDim2.fromScale(0.5, 0.5);
	end;
	local v7, v8 = l__useState__4(p1.MatchExperienceEarned.reasons[1]);
	local v9, v10 = l__useState__4(0);
	local v11, v12 = l__useState__4(l__BattlePassUtils__1.getCurrExperienceProgression(p1.MatchExperienceEarned.startingExperience, l__BattlePassUtils__1.getLevelFromExperience(p1.MatchExperienceEarned.startingExperience)));
	local u14 = u2.createRef();
	local u15 = u2.createRef();
	p2.useEffect(function()
		local l__reasons__16 = p1.MatchExperienceEarned.reasons;
		local u17 = 0;
		local u18 = 0;
		local u19 = v11;
		local u20 = l__TweenService__3:Create(u14:getValue(), TweenInfo.new(0.25), {
			Position = UDim2.fromScale(0, 0), 
			TextTransparency = 0
		});
		local u21 = nil;
		local u22 = 0;
		local u23 = true;
		local function u24()
			v8(l__reasons__16[u17 + 1]);
			u18 = u18 + l__reasons__16[u17 + 1].experience;
			v10(u18);
			u19 = u19 + l__reasons__16[u17 + 1].experience;
			v12(u19);
			u20:Play();
		end;
		local u25 = l__TweenService__3:Create(u14:getValue(), TweenInfo.new(0.001), {
			Position = UDim2.fromScale(0.1, 0), 
			TextTransparency = 1
		});
		local u26 = l__TweenService__3:Create(u15:getValue(), TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			Position = UDim2.fromScale(3, 0)
		});
		u21 = l__RunService__4.Heartbeat:Connect(function(p3)
			if u17 == #l__reasons__16 then
				u21:Disconnect();
			end;
			u22 = u22 + p3;
			if u22 >= 1.5 and u23 then
				u22 = u22 - 1.5;
				u24();
				v1.Promise.fromEvent(u20.Completed):andThen(function()
					wait(1.1);
					if u17 ~= #l__reasons__16 then
						u25:Play();
						return;
					end;
					local v13 = p1.AliveSecsAfterEnd;
					if v13 == nil then
						v13 = 4;
					end;
					wait(v13);
					u26:Play();
					u26.Completed:Connect(function()
						l__ClientSyncEvents__5.MatchEndScreenEnd:fire(0);
						l__KnitClient__6.Controllers.MatchEndController:unmountPostGameBattlePassProgressApp();
					end);
				end);
				u17 = u17 + 1;
			end;
		end);
		return function()
			u23 = false;
			u21:Disconnect();
		end;
	end, {});
	local v14 = {};
	local v15 = {};
	local v16 = {};
	if l__DeviceUtil__9.isSmallScreen() then
		local v17 = 340;
	else
		v17 = 440;
	end;
	v16.MaximumSize = Vector2.new(v17, 500);
	v16.PowerRelationshipPastMaximum = 0.8;
	v15[1] = u2.createElement(l__ScaleComponent__8, v16);
	v15[2] = u2.createElement("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5), 
		Size = UDim2.new(1, 0, 0, 400), 
		BackgroundTransparency = 1, 
		[u2.Ref] = u15
	}, {
		ReasonExpDisplayWrapper = u2.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 20), 
			BorderSizePixel = 0, 
			BackgroundTransparency = 1, 
			LayoutOrder = 1
		}, {
			ReasonExpDisplay = u2.createElement("TextLabel", {
				Size = UDim2.new(1, 0, 0, 20), 
				Position = UDim2.fromScale(0.1, 0), 
				BackgroundTransparency = 1, 
				Text = "<b>" .. string.upper(v7.name) .. " <font color=\"#FFF06B\">+" .. tostring(math.ceil(v7.experience)) .. "</font></b>", 
				TextColor3 = l__ColorUtil__10.WHITE, 
				TextTransparency = 1, 
				RichText = true, 
				Font = Enum.Font.Roboto, 
				TextSize = 24, 
				[u2.Ref] = u14
			})
		}),
		u2.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical, 
			HorizontalAlignment = Enum.HorizontalAlignment.Left, 
			VerticalAlignment = Enum.VerticalAlignment.Top, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 10)
		}), u2.createElement(l__XPProgressBar__11, {
			PastTotalProgressExp = v11 - v7.experience, 
			TotalProgressExp = v11, 
			LayoutOrder = 2, 
			MatchExperienceEarned = p1.MatchExperienceEarned
		}), u2.createElement(l__TotalXpGained__12, {
			TotalExpGained = v9, 
			LayoutOrder = 3
		})
	});
	v14.BattlepassProgressApp = u2.createElement("Frame", {
		AnchorPoint = v5, 
		Position = v6, 
		Size = UDim2.fromOffset(840, 0), 
		BackgroundTransparency = 1
	}, v15);
	return u2.createElement(l__SlideIn__7, {}, v14);
end);
return {
	BattlePassProgressionAppWrapper = function(p4)
		local v18 = {};
		local v19 = {};
		for v20, v21 in pairs(p4) do
			v19[v20] = v21;
		end;
		v18[#v18 + 1] = u2.createElement(u13, v19);
		return u2.createElement("ScreenGui", {
			ResetOnSpawn = false, 
			IgnoreGuiInset = true
		}, v18);
	end, 
	BattlePassProgressionApp = u13
};
