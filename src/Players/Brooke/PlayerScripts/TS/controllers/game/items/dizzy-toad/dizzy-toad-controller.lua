-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "DizzyToadController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "DizzyToadController";
	p1.dizzyMaid = u2.new();
	p1.dizzinessAngle = 0;
end;
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__ItemType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ClientSyncEvents__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__StatusEffectType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local l__Players__8 = v2.Players;
local l__RunService__9 = v2.RunService;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__KnitClient__3.Controllers.PreloadController:preloadForItemType(l__ItemType__4.DIZZY_TOAD, {
		sounds = { l__GameSound__5.TOAD_CROAK }
	});
	l__ClientSyncEvents__6.StatusEffectAdded:connect(function(p3)
		if p3.statusEffect ~= l__StatusEffectType__7.DIZZY then
			return nil;
		end;
		if p3.entityInstance == l__Players__8.LocalPlayer.Character then
			p2.dizzinessAngle = 0;
			l__RunService__9:BindToRenderStep("dizzy-status", Enum.RenderPriority.Character.Value + 1, function(p4)
				p2.dizzinessAngle = p2.dizzinessAngle + p4 * math.random() * 2;
				local v6 = l__Players__8.LocalPlayer.Character;
				if v6 ~= nil then
					v6 = v6:FindFirstChild("Humanoid");
				end;
				if not v6 or v6.MoveDirection.Magnitude == 0 then
					return nil;
				end;
				v6:Move(CFrame.Angles(0, math.rad(30) * math.sin(p2.dizzinessAngle * 2 * math.pi / 1.2), 0) * v6.MoveDirection);
			end);
			p2.dizzyMaid:GiveTask(function()
				return l__RunService__9:UnbindFromRenderStep("dizzy-status");
			end);
		end;
	end);
	l__ClientSyncEvents__6.StatusEffectRemoved:connect(function(p5)
		if p5.statusEffect ~= l__StatusEffectType__7.DIZZY then
			return nil;
		end;
		if p5.entityInstance ~= l__Players__8.LocalPlayer.Character then
			return nil;
		end;
		p2.dizzyMaid:DoCleaning();
	end);
end;
u1 = l__KnitClient__3.CreateController;
u1 = u1(v4.new());
return nil;
