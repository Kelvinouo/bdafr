-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "SnapTrapController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "SnapTrapController";
	p1.preloaded = false;
end;
local l__CollectionTagAdded__1 = v2.CollectionTagAdded;
local l__Players__2 = v3.Players;
local l__SoundManager__3 = v2.SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__GameAnimationUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__default__7 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__OutQuad__8 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).OutQuad;
local l__SnapTrapState__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "trapper", "snap-trap-state").SnapTrapState;
local l__default__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ContentProvider__11 = v3.ContentProvider;
local l__WatchCharacter__12 = v2.WatchCharacter;
local l__KnitClient__13 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__BedwarsImageId__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__CollectionTagAdded__1("snap_trap", function(p3)
		local v7 = p3:GetAttribute("PlacedByUserId");
		local v8 = l__Players__2:GetPlayerByUserId(v7);
		local v9 = p3:GetAttribute("SnapTrapTeamId");
		if v9 == "" or not v9 then
			p3:GetAttributeChangedSignal("SnapTrapTeamId"):Wait();
		end;
		local v10 = l__Players__2.LocalPlayer.Team;
		if v10 ~= nil then
			v10 = v10.Name;
		end;
		local v11 = p3:GetAttribute("SnapTrapTeamId") ~= v10;
		local u15 = v7 == l__Players__2.LocalPlayer.UserId;
		task.spawn(function()
			local v12 = {};
			if u15 then
				local v13 = nil;
			else
				v13 = p3.Position;
			end;
			v12.position = v13;
			l__SoundManager__3:playSound(l__GameSound__4.SNAP_TRAP_SETUP, v12);
		end);
		task.spawn(function()
			local v14 = p3:WaitForChild("Model"):WaitForChild("AnimationController"):WaitForChild("Animator"):LoadAnimation(l__GameAnimationUtil__5.getAnimation(l__AnimationType__6.SNAP_TRAP_SETUP));
			v14.Priority = Enum.AnimationPriority.Idle;
			wait(0.1);
			v14:Play();
			v14:GetMarkerReachedSignal("end"):Connect(function()
				v14:AdjustSpeed(0);
				p3:GetAttributeChangedSignal("SnapTrapState"):Connect(function()

				end);
			end);
		end);
		if v11 then
			task.spawn(function()
				task.wait(0.5);
				l__default__7(0.8, l__OutQuad__8, function(p4)
					local v15, v16, v17 = ipairs(p3.Model:GetDescendants());
					while true do
						v15(v16, v17);
						if not v15 then
							break;
						end;
						v17 = v15;
						if v16:IsA("BasePart") and v16.Transparency < 0.5 then
							v16.Transparency = p4;
						end;					
					end;
				end, 0, 0.5);
			end);
			p3.Touched:Connect(function(p5)
				if p3:GetAttribute("SnapTrapState") == l__SnapTrapState__9.ACTIVE and l__Players__2.LocalPlayer.Character and p5.Parent == l__Players__2.LocalPlayer.Character then
					l__default__10.Client:Get("RemoteName"):SendToServer({
						snapTrap = p3
					});
				end;
			end);
		end;
		task.spawn(function()
			if not p2.preloaded then
				p2.preloaded = true;
				l__ContentProvider__11:PreloadAsync({ (l__GameAnimationUtil__5.getAnimation(l__AnimationType__6.SNAP_TRAP_CLOSE)) });
			end;
		end);
	end);
	l__default__10.Client:OnEvent("RemoteName", function(p6)
		local v18 = {};
		if p6.entityInstance == l__Players__2.LocalPlayer.Character then
			local v19 = nil;
		else
			v19 = p6.snapTrap.Position;
		end;
		v18.position = v19;
		l__SoundManager__3:playSound(l__GameSound__4.SNAP_TRAP_CLOSE, v18);
		local v20 = p6.snapTrap:WaitForChild("Model"):WaitForChild("AnimationController"):WaitForChild("Animator"):LoadAnimation(l__GameAnimationUtil__5.getAnimation(l__AnimationType__6.SNAP_TRAP_CLOSE));
		v20.Priority = Enum.AnimationPriority.Action;
		v20:AdjustSpeed(1.5);
		v20:Play();
		v20:GetMarkerReachedSignal("end"):Connect(function()
			v20:AdjustSpeed(0);
		end);
	end);
	l__default__10.Client:OnEvent("RemoteName", function(p7)
		local v21 = true;
		if p7.entity ~= l__Players__2.LocalPlayer.Character then
			v21 = p7.consumer == l__Players__2.LocalPlayer.Character;
		end;
		local v22 = {};
		if v21 then
			local v23 = nil;
		else
			local v24 = p7.entity.PrimaryPart;
			if v24 ~= nil then
				v24 = v24.Position;
			end;
			v23 = v24;
		end;
		v22.position = v23;
		l__SoundManager__3:playSound(l__GameSound__4.SNAP_TRAP_CONSUME_MARK, v22);
	end);
	l__WatchCharacter__12(function(p8, p9)
		p9:GetAttributeChangedSignal("SnapTrapMarked"):Connect(function()
			if p9:GetAttribute("SnapTrapMarked") then
				local u16 = l__KnitClient__13.Controllers.StunController:showStatusBubble(p9, l__BedwarsImageId__14.TRAPPER_MARKED);
				u16:GiveTask(p9:GetAttributeChangedSignal("SnapTrapMarked"):Connect(function()
					u16:DoCleaning();
				end));
			end;
		end);
	end);
end;
local v25 = l__KnitClient__13.CreateController(v5.new());
return nil;
