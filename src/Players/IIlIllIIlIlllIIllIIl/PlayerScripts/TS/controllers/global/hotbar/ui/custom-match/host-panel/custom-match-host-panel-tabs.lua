-- Script Hash: cfaa2692f2555b6efd27ebc6265b41c319b5162d92c1ae96af3383904945de8d4eb6f874ea606843b004f61ac26a20bb
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__Maid__1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).Maid;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__3 = v2.ColorUtil;
local l__SoundManager__4 = v2.SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__TweenService__6 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
return {
	CustomMatchHostPanelTabs = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = p1.Tab == p1.ActiveTab;
		local v5 = {
			Size = UDim2.new(0.8, 0, 0, 30), 
			BackgroundColor3 = l__ColorUtil__3.BLACK
		};
		if v4 then
			local v6 = 0.7;
		else
			v6 = 1;
		end;
		v5.BackgroundTransparency = v6;
		v5.Font = "Roboto";
		v5.Text = "<b>" .. p1.Name .. "</b>";
		v5.TextColor3 = l__ColorUtil__3.WHITE;
		v5.TextScaled = true;
		v5.RichText = true;
		if v4 then
			local v7 = 0;
		else
			v7 = 0.3;
		end;
		v5.TextTransparency = v7;
		v5.TextXAlignment = "Center";
		v5.TextYAlignment = "Center";
		v5[u2.Event.Activated] = function()
			p1.SetTab(p1.Tab);
			l__SoundManager__4:playSound(l__GameSound__5.UI_CLICK);
		end;
		local u7 = l__Maid__1.new();
		v5[u2.Event.MouseEnter] = function(p3)
			if v4 then
				return nil;
			end;
			u7:DoCleaning();
			local v8 = l__TweenService__6:Create(p3, TweenInfo.new(0.12), {
				BackgroundTransparency = 0.8
			});
			v8:Play();
			u7:GiveTask(function()
				v8:Cancel();
			end);
		end;
		v5[u2.Event.MouseLeave] = function(p4)
			if v4 then
				return nil;
			end;
			u7:DoCleaning();
			local v9 = {};
			if v4 then
				local v10 = 0.7;
			else
				v10 = 1;
			end;
			v9.BackgroundTransparency = v10;
			local v11 = l__TweenService__6:Create(p4, TweenInfo.new(0.12), v9);
			v11:Play();
			u7:GiveTask(function()
				v11:Cancel();
			end);
		end;
		v5.LayoutOrder = p1.LayoutOrder;
		return u2.createElement("TextButton", v5, { u2.createElement("UICorner", {
				CornerRadius = UDim.new(0, 5)
			}), u2.createElement("UIPadding", {
				PaddingTop = UDim.new(0.15, 0), 
				PaddingBottom = UDim.new(0.15, 0), 
				PaddingLeft = UDim.new(0.15, 0), 
				PaddingRight = UDim.new(0.15, 0)
			}), u2.createElement("UITextSizeConstraint", {
				MaxTextSize = 18
			}) });
	end)
};
