-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "BatteryEffectsController";
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
	p1.Name = "BatteryEffectsController";
	p1.batteryIds = {};
	p1.liveBatteries = {};
	p1.batteryEffects = {};
end;
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__BedwarsKit__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__WatchPlayerCharacter__6 = v2.WatchPlayerCharacter;
local l__ReplicatedStorage__7 = v3.ReplicatedStorage;
local l__WeldUtil__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local l__default__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__GameQueryUtil__10 = v2.GameQueryUtil;
local l__BLOCK_SIZE__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local l__Workspace__12 = v3.Workspace;
local l__SoundManager__13 = v2.SoundManager;
local l__Players__14 = v3.Players;
local l__EffectUtil__15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__BatteryUtil__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "battery", "battery-util").BatteryUtil;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__KnitClient__2.Controllers.KitController:watchKit(function(p3, p4)
		if p4 == l__BedwarsKit__3.BATTERY then
			l__KnitClient__2.Controllers.PreloadController:runPreload({
				sounds = { l__GameSound__4.OVERLOAD_BEEP, l__GameSound__4.OVERLOAD_LOOP, l__GameSound__4.MIDNIGHT_ATTACK_3, l__GameSound__4.ANGEL_VOID_ORB_HEAL }
			});
		end;
	end);
	l__KnitClient__2.Controllers.KitController:watchKit(function(p5, p6)
		local v7 = p2.batteryEffects[p5];
		if v7 ~= nil then
			v7:DoCleaning();
		end;
		if p6 ~= l__BedwarsKit__3.BATTERY then
			return nil;
		end;
		local v8 = u5.new();
		p2.batteryEffects[p5] = v8;
		v8:GiveTask(l__WatchPlayerCharacter__6(p5, function(p7, p8)
			local v9 = l__ReplicatedStorage__7.Assets.Misc.Battery.battery_pack:Clone();
			v9.Parent = p7;
			l__WeldUtil__8.weldCharacterAccessories(p7);
			p8:GiveTask(p7:GetAttributeChangedSignal("ActiveBatteries"):Connect(function()
				local v10 = p7:GetAttribute("ActiveBatteries");
				if v10 == nil then
					v10 = 0;
				end;
				local v11 = 0;
				local v12 = false;
				while true do
					if v12 then
						v11 = v11 + 1;
					else
						v12 = true;
					end;
					if not (v11 < 3) then
						break;
					end;
					local u17 = v11 < v10;
					for v13, v14 in ipairs({ "Battery" .. tostring(v11 + 1), "Neon" .. tostring(v11 + 1) }) do
						if u17 then
							local v15 = 0;
						else
							v15 = 1;
						end;
						v9:FindFirstChild("Handle"):FindFirstChild(v14).Transparency = v15;
					end;				
				end;
			end));
		end));
	end);
	l__default__9.Client:WaitFor("RemoteName"):expect():Connect(function(p9)
		local v16 = u5.new();
		local u18 = true;
		v16:GiveTask(function()
			u18 = false;
		end);
		local v17 = l__ReplicatedStorage__7.Assets.Misc.Battery.Closed:Clone();
		v16:GiveTask(v17);
		p2.liveBatteries[p9.batteryId] = {
			maid = v16, 
			activateTime = p9.activateTime, 
			consumeTime = 0, 
			position = p9.position
		};
		v16:GiveTask(function()
			p2.liveBatteries[p9.batteryId] = nil;
		end);
		l__GameQueryUtil__10:setQueryIgnored(v17, true);
		v17:SetPrimaryPartCFrame(CFrame.new(p9.position - Vector3.new(0, l__BLOCK_SIZE__11 / 2, 0)));
		v17.Parent = l__Workspace__12;
		task.delay(math.max(0, p9.activateTime - l__Workspace__12:GetServerTimeNow()), function()
			if not u18 then
				return nil;
			end;
			l__SoundManager__13:playSound(l__GameSound__4.MIDNIGHT_ATTACK_3, {
				position = v17:GetPrimaryPartCFrame().Position, 
				volumeMultiplier = 0.25
			});
			local v18 = l__ReplicatedStorage__7.Assets.Misc.Battery.Open:Clone();
			v16:GiveTask(v18);
			p2:registerBattery(v18, p9.batteryId);
			l__GameQueryUtil__10:setQueryIgnored(v18, true);
			v18:SetPrimaryPartCFrame(v17:GetPrimaryPartCFrame());
			v17:Destroy();
			v18.Parent = l__Workspace__12;
		end);
		task.delay(math.max(0, p9.despawnTime - l__Workspace__12:GetServerTimeNow()), function()
			v16:DoCleaning();
		end);
	end);
	l__default__9.Client:WaitFor("RemoteName"):expect():Connect(function(p10)
		local v19 = p2.liveBatteries[p10.batteryId];
		if v19 then
			v19.maid:DoCleaning();
			local v20 = {};
			if p10.player == l__Players__14.LocalPlayer then
				local v21 = nil;
			else
				v21 = v19.position;
			end;
			v20.position = v21;
			l__SoundManager__13:playSound(l__GameSound__4.ANGEL_VOID_ORB_HEAL, v20);
			local v22 = l__ReplicatedStorage__7.Assets.Misc.Battery.BatteryPop:Clone();
			v22.Position = v19.position;
			v22.Parent = l__Workspace__12;
			l__EffectUtil__15:playEffects({ v22 }, nil, {
				destroyAfterSec = 4
			});
		end;
		p2.liveBatteries[p10.batteryId] = nil;
	end);
	l__default__9.Client:WaitFor("RemoteName"):expect():Connect(function(p11)
		local v23 = p11.endTime - l__Workspace__12:GetServerTimeNow();
		local v24 = p11.character == l__Players__14.LocalPlayer.Character;
		local v25 = u5.new();
		local u19 = true;
		v25:GiveTask(function()
			u19 = false;
		end);
		if v24 then
			v25:GiveTask(l__KnitClient__2.Controllers.SprintController:getMovementStatusModifier():addModifier({
				moveSpeedMultiplier = l__BatteryUtil__16.OVERLOAD_SPEED_MULT
			}));
		end;
		if v24 or p11.character.PrimaryPart then
			local v26 = {};
			if v24 then
				local v27 = nil;
			else
				v27 = p11.character.PrimaryPart;
			end;
			v26.parent = v27;
			v26.volumeMultiplier = 0.2;
			local u20 = l__SoundManager__13:playSound(l__GameSound__4.OVERLOAD_LOOP, v26);
			task.delay(v23 - 2, function()
				if u20 then
					l__SoundManager__13:tweenSoundVolume(u20, 0, 2);
				end;
			end);
		end;
		local u21 = {};
		for v28, v29 in ipairs(p11.character:GetDescendants()) do
			if v29:IsA("BasePart") and v29.Material == Enum.Material.Neon and v29.Color == l__BatteryUtil__16.BATTERY_BLUE then
				table.insert(u21, v29);
			end;
		end;
		task.spawn(function()
			while true do
				local v30 = {};
				if p11.character.PrimaryPart and not v24 then
					local v31 = p11.character:GetPrimaryPartCFrame().Position;
				else
					v31 = nil;
				end;
				v30.position = v31;
				v30.volumeMultiplier = 0.2;
				l__SoundManager__13:playSound(l__GameSound__4.OVERLOAD_BEEP, v30);
				p2:flashParts(u21, v25);
				local v32 = task.wait(1.8);
				if v32 ~= 0 and v32 == v32 and v32 then
					v32 = u19;
				end;
				if v32 == 0 then
					break;
				end;
				if v32 ~= v32 then
					break;
				end;
				if not v32 then
					break;
				end;			
			end;
		end);
		task.delay(v23, function()
			v25:DoCleaning();
			for v33, v34 in ipairs(u21) do
				if v34.Parent then
					v34.Color = l__BatteryUtil__16.BATTERY_BLUE;
				end;
			end;
		end);
	end);
end;
local l__TweenService__22 = v3.TweenService;
function v5.flashParts(p12, p13, p14)
	for v35, v36 in ipairs(p13) do
		if v36.Parent then
			v36.Color = Color3.fromRGB(255, 255, 255);
			local v37 = l__TweenService__22:Create(v36, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Color = l__BatteryUtil__16.BATTERY_RED
			});
			v37:Play();
			p14:GiveTask(function()
				v37:Cancel();
			end);
		end;
	end;
end;
function v5.registerBattery(p15, p16, p17)
	for v38, v39 in ipairs(p16:GetDescendants()) do
		if v39:IsA("BasePart") then
			p15.batteryIds[v39] = p17;
			local u23 = nil;
			u23 = v39.AncestryChanged:Connect(function()
				if v39.Parent then
					return nil;
				end;
				p15.batteryIds[v39] = nil;
				u23:Disconnect();
			end);
		end;
	end;
end;
function v5.getBatteryIdFromPart(p18, p19)
	return p18.batteryIds[p19];
end;
function v5.getBatteryInfo(p20, p21)
	return p20.liveBatteries[p21];
end;
u1 = l__KnitClient__2.CreateController;
u1 = u1(v5.new());
return nil;
