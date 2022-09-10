-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__SoundManager__3 = v2.SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__UIUtil__5 = v2.UIUtil;
local l__GlitchedText__6 = v1.import(script, script.Parent, "glitched-text", "glitched-text").GlitchedText;
local l__SpriteSheetPlayer__7 = v2.SpriteSheetPlayer;
local l__Workspace__8 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__BalanceFile__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local l__Empty__11 = v2.Empty;
local l__EngineerFilmEffect__12 = v1.import(script, script.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "watcher", "ui", "engineer-film-effect").EngineerFilmEffect;
return {
	GlitchedMatchAnnouncement = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = u1.createRef();
		local v5 = u1.createRef();
		local v6, v7 = u1.createBinding(1);
		p2.useEffect(function()
			local v8 = u2.new();
			local v9 = v5:getValue();
			if v9 then
				l__SoundManager__3:playSound(l__GameSound__4.ERROR_NOTIFICATION, {
					volumeMultiplier = 0.5
				});
				u1.mount(u1.createElement(l__GlitchedText__6, {
					Text = "CRITICAL ERROR!", 
					FrameProps = {
						AnchorPoint = Vector2.new(0.5, 1), 
						Position = l__UIUtil__5:getActionBarPosition() - UDim2.new(0, 0, 0.1, 0), 
						Size = UDim2.new(0.8, 0, 0.1, 0)
					}, 
					TextLabelProps = {
						AnchorPoint = Vector2.new(0.5, 0.5), 
						Position = UDim2.new(0.5, 0, 0.5, 0), 
						Size = UDim2.new(1, 0, 1, 0), 
						Font = Enum.Font.SciFi, 
						TextColor3 = Color3.fromRGB(255, 255, 255), 
						TextTransparency = 0, 
						TextScaled = true, 
						RichText = true, 
						BackgroundTransparency = 1, 
						ZIndex = 3
					}
				}), v9);
				wait(1);
				task.spawn(function()
					local v10 = 0;
					local v11 = false;
					while true do
						if v11 then
							v10 = v10 + 1;
						else
							v11 = true;
						end;
						if not (v10 < 10) then
							break;
						end;
						local v12 = v10 == 5;
						l__SoundManager__3:playSound(l__GameSound__4.ERROR_NOTIFICATION, {
							volumeMultiplier = 0.5
						});
						local v13 = {
							Text = "CRITICAL ERROR!"
						};
						local v14 = {
							AnchorPoint = Vector2.new(0.5, 1), 
							Position = l__UIUtil__5:getActionBarPosition() - UDim2.new(0, 0, 0.1, 0)
						};
						if v12 then
							local v15 = 0.1;
						else
							v15 = 0.05;
						end;
						v14.Size = UDim2.new(0.8, 0, v15, 0);
						v13.FrameProps = v14;
						local v16 = {
							AnchorPoint = Vector2.new(0.5, 0.5), 
							Position = UDim2.new(0.5, 0, 0.5, 0), 
							Size = UDim2.new(1, 0, 1, 0), 
							Font = Enum.Font.SciFi, 
							TextColor3 = Color3.fromRGB(255, 255, 255)
						};
						if v12 then
							local v17 = 0;
						else
							v17 = 0.3;
						end;
						v16.TextTransparency = v17;
						v16.TextScaled = true;
						v16.RichText = true;
						v16.BackgroundTransparency = 1;
						v16.ZIndex = 3;
						v13.TextLabelProps = v16;
						u1.mount(u1.createElement(l__GlitchedText__6, v13), v9);
						wait(0.05);					
					end;
				end);
			end;
			l__SoundManager__3:playSound(l__GameSound__4.GLITCH_OVERLAY_2, {
				volumeMultiplier = 0.7
			});
			v7(0.9);
			local u13 = l__SoundManager__3:playSound(l__GameSound__4.TV_STATIC, {
				looped = true, 
				volumeMultiplier = 0.4
			});
			v8:GiveTask(function()
				if u13 ~= nil then
					u13:Stop();
				end;
				if u13 ~= nil then
					u13:Destroy();
				end;
			end);
			local v18 = v4:getValue();
			if not v18 then
				return nil;
			end;
			local v19 = l__SpriteSheetPlayer__7.new(v18, {
				image = "rbxassetid://10844183471", 
				imageWidth = 807, 
				imageHeight = 1023, 
				rows = 4, 
				columns = 3, 
				sprites = 12, 
				config = {
					framesPerSecond = 30, 
					numLoops = 2
				}
			});
			v19:play();
			l__SoundManager__3:playSound(l__GameSound__4.GLITCH_OVERLAY);
			local l__CurrentCamera__20 = l__Workspace__8.CurrentCamera;
			if l__CurrentCamera__20 then
				local v21 = u9("BlurEffect", {
					Parent = l__CurrentCamera__20, 
					Name = "GlitchBlur", 
					Size = 24
				});
				v8:GiveTask((u9("DepthOfFieldEffect", {
					Parent = l__CurrentCamera__20, 
					Name = "GlitchDOF", 
					InFocusRadius = 15
				})));
				v8:GiveTask(v21);
			end;
			task.delay(l__BalanceFile__10.GLITCH_LB_ANNOUNCEMENT_DURATION - 0.2, function()
				v7(0.3);
				v19:play();
				l__SoundManager__3:playSound(l__GameSound__4.GLITCH_OVERLAY);
				v8:DoCleaning();
			end);
		end, {});
		return u1.createFragment({ u1.createElement("ImageLabel", {
				Size = UDim2.fromScale(1, 1), 
				[u1.Ref] = v4, 
				BackgroundTransparency = 1, 
				ZIndex = 10
			}), u1.createElement(l__Empty__11, {
				Size = UDim2.fromScale(1, 0.8), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.fromScale(0.5, 0.5), 
				[u1.Ref] = v5
			}, { u1.createElement("UIListLayout", {
					FillDirection = "Vertical", 
					HorizontalAlignment = "Center", 
					Padding = UDim.new(0.03, 0)
				}) }), u1.createElement(l__EngineerFilmEffect__12, {
				transparency = v6
			}) });
	end)
};
