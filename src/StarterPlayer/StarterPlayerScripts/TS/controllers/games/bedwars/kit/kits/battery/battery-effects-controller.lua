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
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "BatteryEffectsController";
	p1.batteryIds = {};
	p1.liveBatteries = {};
	p1.batteryEffects = {};
end;
local l__KnitClient__1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__BedwarsKit__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__WatchPlayerCharacter__5 = v2.WatchPlayerCharacter;
local l__ReplicatedStorage__6 = v3.ReplicatedStorage;
local l__WeldUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local l__default__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__GameQueryUtil__9 = v2.GameQueryUtil;
local l__BLOCK_SIZE__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local l__Workspace__11 = v3.Workspace;
local l__SoundManager__12 = v2.SoundManager;
local l__Players__13 = v3.Players;
local l__EffectUtil__14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__BatteryUtil__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "battery", "battery-util").BatteryUtil;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__KnitClient__1.Controllers.KitController:watchKit(function(p3, p4)
		if p4 == l__BedwarsKit__2.BATTERY then
			l__KnitClient__1.Controllers.PreloadController:runPreload({
				sounds = { l__GameSound__3.OVERLOAD_BEEP, l__GameSound__3.OVERLOAD_LOOP, l__GameSound__3.MIDNIGHT_ATTACK_3, l__GameSound__3.ANGEL_VOID_ORB_HEAL }
			});
		end;
	end);
	l__KnitClient__1.Controllers.KitController:watchKit(function(p5, p6)
		local v7 = p2.batteryEffects[p5];
		if v7 ~= nil then
			v7:DoCleaning();
		end;
		if p6 ~= l__BedwarsKit__2.BATTERY then
			return nil;
		end;
		local v8 = u4.new();
		p2.batteryEffects[p5] = v8;
		v8:GiveTask(l__WatchPlayerCharacter__5(p5, function(p7, p8)
			local v9 = l__ReplicatedStorage__6.Assets.Misc.Battery.battery_pack:Clone();
			v9.Parent = p7;
			l__WeldUtil__7.weldCharacterAccessories(p7);
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
					local u16 = v11 < v10;
					local v13, v14, v15 = ipairs({ "Battery" .. tostring(v11 + 1), "Neon" .. tostring(v11 + 1) });
					while true do
						v13(v14, v15);
						if not v13 then
							break;
						end;
						v15 = v13;
						if u16 then
							local v16 = 0;
						else
							v16 = 1;
						end;
						v9:FindFirstChild("Handle"):FindFirstChild(v14).Transparency = v16;					
					end;				
				end;
			end));
		end));
	end);
	l__default__8.Client:WaitFor("RemoteName"):expect():Connect(function(p9)
		local v17 = u4.new();
		local u17 = true;
		v17:GiveTask(function()
			u17 = false;
		end);
		local v18 = l__ReplicatedStorage__6.Assets.Misc.Battery.Closed:Clone();
		v17:GiveTask(v18);
		p2.liveBatteries[p9.batteryId] = {
			maid = v17, 
			activateTime = p9.activateTime, 
			consumeTime = 0, 
			position = p9.position
		};
		v17:GiveTask(function()
			p2.liveBatteries[p9.batteryId] = nil;
		end);
		l__GameQueryUtil__9:setQueryIgnored(v18, true);
		v18:SetPrimaryPartCFrame(CFrame.new(p9.position - Vector3.new(0, l__BLOCK_SIZE__10 / 2, 0)));
		v18.Parent = l__Workspace__11;
		task.delay(math.max(0, p9.activateTime - l__Workspace__11:GetServerTimeNow()), function()
			if not u17 then
				return nil;
			end;
			l__SoundManager__12:playSound(l__GameSound__3.MIDNIGHT_ATTACK_3, {
				position = v18:GetPrimaryPartCFrame().Position, 
				volumeMultiplier = 0.25
			});
			local v19 = l__ReplicatedStorage__6.Assets.Misc.Battery.Open:Clone();
			v17:GiveTask(v19);
			p2:registerBattery(v19, p9.batteryId);
			l__GameQueryUtil__9:setQueryIgnored(v19, true);
			v19:SetPrimaryPartCFrame(v18:GetPrimaryPartCFrame());
			v18:Destroy();
			v19.Parent = l__Workspace__11;
		end);
		task.delay(math.max(0, p9.despawnTime - l__Workspace__11:GetServerTimeNow()), function()
			v17:DoCleaning();
		end);
	end);
	l__default__8.Client:WaitFor("RemoteName"):expect():Connect(function(p10)
		local v20 = p2.liveBatteries[p10.batteryId];
		if v20 then
			v20.maid:DoCleaning();
			local v21 = {};
			if p10.player == l__Players__13.LocalPlayer then
				local v22 = nil;
			else
				v22 = v20.position;
			end;
			v21.position = v22;
			l__SoundManager__12:playSound(l__GameSound__3.ANGEL_VOID_ORB_HEAL, v21);
			local v23 = l__ReplicatedStorage__6.Assets.Misc.Battery.BatteryPop:Clone();
			v23.Position = v20.position;
			v23.Parent = l__Workspace__11;
			l__EffectUtil__14:playEffects({ v23 }, nil, {
				destroyAfterSec = 4
			});
		end;
		p2.liveBatteries[p10.batteryId] = nil;
	end);
	l__default__8.Client:WaitFor("RemoteName"):expect():Connect(function(p11)
		local v24 = p11.endTime - l__Workspace__11:GetServerTimeNow();
		local v25 = p11.character == l__Players__13.LocalPlayer.Character;
		local v26 = u4.new();
		local u18 = true;
		v26:GiveTask(function()
			u18 = false;
		end);
		if v25 then
			v26:GiveTask(l__KnitClient__1.Controllers.SprintController:getMovementStatusModifier():addModifier({
				moveSpeedMultiplier = l__BatteryUtil__15.OVERLOAD_SPEED_MULT
			}));
		end;
		if v25 or p11.character.PrimaryPart then
			local v27 = {};
			if v25 then
				local v28 = nil;
			else
				v28 = p11.character.PrimaryPart;
			end;
			v27.parent = v28;
			v27.volumeMultiplier = 0.2;
			local u19 = l__SoundManager__12:playSound(l__GameSound__3.OVERLOAD_LOOP, v27);
			task.delay(v24 - 2, function()
				if u19 then
					l__SoundManager__12:tweenSoundVolume(u19, 0, 2);
				end;
			end);
		end;
		local u20 = {};
		local v29, v30, v31 = ipairs(p11.character:GetDescendants());
		while true do
			v29(v30, v31);
			if not v29 then
				break;
			end;
			v31 = v29;
			if v30:IsA("BasePart") and v30.Material == Enum.Material.Neon and v30.Color == l__BatteryUtil__15.BATTERY_BLUE then
				table.insert(u20, v30);
			end;		
		end;
		task.spawn(function()
			while true do
				local v32 = {};
				if p11.character.PrimaryPart and not v25 then
					local v33 = p11.character:GetPrimaryPartCFrame().Position;
				else
					v33 = nil;
				end;
				v32.position = v33;
				v32.volumeMultiplier = 0.2;
				l__SoundManager__12:playSound(l__GameSound__3.OVERLOAD_BEEP, v32);
				p2:flashParts(u20, v26);
				local v34 = task.wait(1.8);
				if v34 ~= 0 and v34 == v34 and v34 then
					v34 = u18;
				end;
				if v34 == 0 then
					break;
				end;
				if v34 ~= v34 then
					break;
				end;
				if not v34 then
					break;
				end;			
			end;
		end);
		task.delay(v24, function()
			v26:DoCleaning();
			local v35, v36, v37 = ipairs(u20);
			while true do
				v35(v36, v37);
				if not v35 then
					break;
				end;
				v37 = v35;
				if v36.Parent then
					v36.Color = l__BatteryUtil__15.BATTERY_BLUE;
				end;			
			end;
		end);
	end);
end;
local l__TweenService__21 = v3.TweenService;
function v5.flashParts(p12, p13, p14)
	local v38, v39, v40 = ipairs(p13);
	while true do
		v38(v39, v40);
		if not v38 then
			break;
		end;
		v40 = v38;
		if v39.Parent then
			v39.Color = Color3.fromRGB(255, 255, 255);
			local v41 = l__TweenService__21:Create(v39, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Color = l__BatteryUtil__15.BATTERY_RED
			});
			v41:Play();
			p14:GiveTask(function()
				v41:Cancel();
			end);
		end;	
	end;
end;
function v5.registerBattery(p15, p16, p17)
	local v42, v43, v44 = ipairs(p16:GetDescendants());
	while true do
		v42(v43, v44);
		if not v42 then
			break;
		end;
		v44 = v42;
		if v43:IsA("BasePart") then
			p15.batteryIds[v43] = p17;
			local u22 = nil;
			u22 = v43.AncestryChanged:Connect(function()
				if v43.Parent then
					return nil;
				end;
				p15.batteryIds[v43] = nil;
				u22:Disconnect();
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
local v45 = l__KnitClient__1.CreateController(v5.new());
return nil;
