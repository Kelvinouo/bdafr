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
local u1 = l__KnitController__4;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "SnapTrapController";
	p1.preloaded = false;
end;
local l__CollectionTagAdded__2 = v2.CollectionTagAdded;
local l__Players__3 = v3.Players;
local l__SoundManager__4 = v2.SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__GameAnimationUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__default__8 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__OutQuad__9 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).OutQuad;
local l__SnapTrapState__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "trapper", "snap-trap-state").SnapTrapState;
local l__default__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ContentProvider__12 = v3.ContentProvider;
local l__WatchCharacter__13 = v2.WatchCharacter;
local l__KnitClient__14 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__BedwarsImageId__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__CollectionTagAdded__2("snap_trap", function(p3)
		local v7 = p3:GetAttribute("PlacedByUserId");
		local v8 = l__Players__3:GetPlayerByUserId(v7);
		local v9 = p3:GetAttribute("SnapTrapTeamId");
		if v9 == "" or not v9 then
			p3:GetAttributeChangedSignal("SnapTrapTeamId"):Wait();
		end;
		local v10 = l__Players__3.LocalPlayer.Team;
		if v10 ~= nil then
			v10 = v10.Name;
		end;
		local v11 = p3:GetAttribute("SnapTrapTeamId") ~= v10;
		local u16 = v7 == l__Players__3.LocalPlayer.UserId;
		task.spawn(function()
			local v12 = {};
			if u16 then
				local v13 = nil;
			else
				v13 = p3.Position;
			end;
			v12.position = v13;
			l__SoundManager__4:playSound(l__GameSound__5.SNAP_TRAP_SETUP, v12);
		end);
		task.spawn(function()
			local v14 = p3:WaitForChild("Model"):WaitForChild("AnimationController"):WaitForChild("Animator"):LoadAnimation(l__GameAnimationUtil__6.getAnimation(l__AnimationType__7.SNAP_TRAP_SETUP));
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
				l__default__8(0.8, l__OutQuad__9, function(p4)
					for v15, v16 in ipairs(p3.Model:GetDescendants()) do
						if v16:IsA("BasePart") and v16.Transparency < 0.5 then
							v16.Transparency = p4;
						end;
					end;
				end, 0, 0.5);
			end);
			p3.Touched:Connect(function(p5)
				if p3:GetAttribute("SnapTrapState") == l__SnapTrapState__10.ACTIVE and l__Players__3.LocalPlayer.Character and p5.Parent == l__Players__3.LocalPlayer.Character then
					l__default__11.Client:Get("RemoteName"):SendToServer({
						snapTrap = p3
					});
				end;
			end);
		end;
		task.spawn(function()
			if not p2.preloaded then
				p2.preloaded = true;
				l__ContentProvider__12:PreloadAsync({ (l__GameAnimationUtil__6.getAnimation(l__AnimationType__7.SNAP_TRAP_CLOSE)) });
			end;
		end);
	end);
	l__default__11.Client:OnEvent("RemoteName", function(p6)
		local v17 = {};
		if p6.entityInstance == l__Players__3.LocalPlayer.Character then
			local v18 = nil;
		else
			v18 = p6.snapTrap.Position;
		end;
		v17.position = v18;
		l__SoundManager__4:playSound(l__GameSound__5.SNAP_TRAP_CLOSE, v17);
		local v19 = p6.snapTrap:WaitForChild("Model"):WaitForChild("AnimationController"):WaitForChild("Animator"):LoadAnimation(l__GameAnimationUtil__6.getAnimation(l__AnimationType__7.SNAP_TRAP_CLOSE));
		v19.Priority = Enum.AnimationPriority.Action;
		v19:AdjustSpeed(1.5);
		v19:Play();
		v19:GetMarkerReachedSignal("end"):Connect(function()
			v19:AdjustSpeed(0);
		end);
	end);
	l__default__11.Client:OnEvent("RemoteName", function(p7)
		local v20 = true;
		if p7.entity ~= l__Players__3.LocalPlayer.Character then
			v20 = p7.consumer == l__Players__3.LocalPlayer.Character;
		end;
		local v21 = {};
		if v20 then
			local v22 = nil;
		else
			local v23 = p7.entity.PrimaryPart;
			if v23 ~= nil then
				v23 = v23.Position;
			end;
			v22 = v23;
		end;
		v21.position = v22;
		l__SoundManager__4:playSound(l__GameSound__5.SNAP_TRAP_CONSUME_MARK, v21);
	end);
	l__WatchCharacter__13(function(p8, p9)
		p9:GetAttributeChangedSignal("SnapTrapMarked"):Connect(function()
			if p9:GetAttribute("SnapTrapMarked") then
				local u17 = l__KnitClient__14.Controllers.StunController:showStatusBubble(p9, l__BedwarsImageId__15.TRAPPER_MARKED);
				u17:GiveTask(p9:GetAttributeChangedSignal("SnapTrapMarked"):Connect(function()
					u17:DoCleaning();
				end));
			end;
		end);
	end);
end;
u1 = l__KnitClient__14.CreateController;
u1 = u1(v5.new());
return nil;
