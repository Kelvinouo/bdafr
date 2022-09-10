-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "GlitchedLuckyBlockController";
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
	p1.Name = "GlitchedLuckyBlockController";
end;
local l__KnitClient__1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local u6 = v1.import(script, script.Parent, "glitched-match-announcement").GlitchedMatchAnnouncement;
local l__Players__7 = v3.Players;
local l__BalanceFile__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local l__SoundManager__9 = v2.SoundManager;
local l__WatchCollectionTag__10 = v2.WatchCollectionTag;
local l__LuckyBlockCategory__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block", "lucky-block-enums").LuckyBlockCategory;
local l__ClientSyncEvents__12 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__KnitClient__1.Controllers.PreloadController:preloadForItemType(l__ItemType__2.GLITCHED_LUCKY_BLOCK, {
		sounds = { l__GameSound__3.TV_STATIC, l__GameSound__3.GLITCHED_LUCKY_BLOCK_DAMAGE, l__GameSound__3.GLITCHED_LUCKY_BLOCK_TELEPORT, l__GameSound__3.GLITCH_OVERLAY, l__GameSound__3.GLITCH_OVERLAY_2 }
	});
	l__default__4.Client:WaitFor("RemoteName"):expect():Connect(function()
		local u13 = u5.mount(u5.createElement("ScreenGui", {}, { u5.createElement(u6) }), l__Players__7.LocalPlayer:FindFirstChildOfClass("PlayerGui"));
		task.delay(l__BalanceFile__8.GLITCH_LB_ANNOUNCEMENT_DURATION, function()
			l__SoundManager__9:playSound(l__GameSound__3.GLITCH_OVERLAY_2, {
				volumeMultiplier = 0.7
			});
			u5.unmount(u13);
		end);
	end);
	l__WatchCollectionTag__10("GlitchedLuckyBlock", function(p3)
		p2:playGlitchOverlayEffect(p3);
		p2:loopGlitchParticlesOnBlock(p3);
	end);
	l__default__4.Client:OnEvent("RemoteName", function(p4)
		if p4.category ~= l__LuckyBlockCategory__11.GLITCHED then
			return nil;
		end;
		l__SoundManager__9:playSound(l__GameSound__3.GLITCHED_LUCKY_BLOCK_DAMAGE);
		p2:playGlitchParticlesOnBlock(p4.blockPosition);
	end);
	l__ClientSyncEvents__12.PlaceBlock:connect(function(p5)
		if p5.blockType ~= l__ItemType__2.GLITCHED_LUCKY_BLOCK then
			return nil;
		end;
		p2:playGlitchParticlesOnBlock(p5.blockPosition);
		l__SoundManager__9:playSound(l__GameSound__3.TV_STATIC, {
			playbackSpeedMultiplier = math.random(0.5, 1.5), 
			volumeMultiplier = 0.05
		});
	end);
	l__ClientSyncEvents__12.DamageBlock:connect(function(p6)
		if p6.blockType ~= l__ItemType__2.GLITCHED_LUCKY_BLOCK then
			return nil;
		end;
		l__SoundManager__9:playSound(l__GameSound__3.TV_STATIC, {
			playbackSpeedMultiplier = math.random(0.5, 1.5), 
			volumeMultiplier = 0.05
		});
		l__SoundManager__9:playSound(l__GameSound__3.GLITCHED_LUCKY_BLOCK_DAMAGE);
		p2:playGlitchParticlesOnBlock(p6.blockPosition);
	end);
	l__default__4.Client:OnEvent("RemoteName", function(p7)
		l__SoundManager__9:playSound(l__GameSound__3.GLITCHED_LUCKY_BLOCK_DAMAGE);
		p2:playGlitchedLuckyBlockCloneEffect(p7.initialPosition, true);
		wait(l__BalanceFile__8.GLITCH_LB_TELEPORT_DURATION);
		l__SoundManager__9:playSound(l__GameSound__3.GLITCHED_LUCKY_BLOCK_TELEPORT);
		p2:playGlitchedLuckyBlockCloneEffect(p7.newPosition, false);
	end);
end;
local u14 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__SpriteSheetPlayer__15 = v2.SpriteSheetPlayer;
local l__RandomUtil__16 = v2.RandomUtil;
function v5.playGlitchOverlayEffect(p8, p9)
	local v7 = Enum.NormalId:GetEnumItems();
	local u17 = { {
			image = "rbxassetid://10844183211", 
			imageWidth = 1024, 
			imageHeight = 769, 
			rows = 8, 
			columns = 4, 
			sprites = 31, 
			config = {
				framesPerSecond = 30, 
				loopDelay = 5
			}
		}, {
			image = "rbxassetid://10844183471", 
			imageWidth = 807, 
			imageHeight = 1023, 
			rows = 4, 
			columns = 3, 
			sprites = 12, 
			config = {
				framesPerSecond = 30, 
				loopDelay = 5
			}
		} };
	local u18 = Random.new();
	local function v8(p10)
		local u19 = l__SpriteSheetPlayer__15.new(u14("ImageLabel", {
			Size = UDim2.fromScale(1, 1), 
			BackgroundTransparency = 1, 
			Parent = u14("SurfaceGui", {
				Name = "SpriteSheet_Player_" .. p10.Name, 
				Face = p10, 
				Brightness = 3, 
				Parent = p9
			})
		}), l__RandomUtil__16.randomArraySelectN(u17, 1)[1]);
		task.delay(u18:NextNumber(0, 2), function()
			u19:play();
		end);
	end;
	local v9, v10, v11 = ipairs(v7);
	while true do
		v9(v10, v11);
		if not v9 then
			break;
		end;
		v11 = v9;
		v8(v10, v9 - 1, v7);	
	end;
	local v12 = Enum.NormalId:GetEnumItems();
	local u20 = u14("Part", {
		Name = "Floating_Pixels_Layer", 
		Size = Vector3.new(3.2, 3.2, 3.2), 
		Position = p9.Position, 
		Transparency = 1, 
		Anchored = true, 
		CanCollide = false, 
		CanQuery = false, 
		Parent = p9
	});
	local function v13(p11)
		local v14 = u14("SurfaceGui", {
			Name = "Floating_Layer_" .. p11.Name, 
			Face = p11, 
			Parent = u20, 
			SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud, 
			PixelsPerStud = 3
		});
		local v15 = { Color3.fromHex("#3ca7bf"), Color3.fromHex("#62197c"), Color3.fromHex("#163050"), Color3.fromHex("#1e546f"), Color3.fromHex("#44125d"), Color3.fromHex("#26073e"), Color3.fromHex("#f2f2fe") };
		local v16 = u18:NextInteger(2, 4);
		local v17 = 0;
		local v18 = false;
		while true do
			if v18 then
				v17 = v17 + 1;
			else
				v18 = true;
			end;
			if not (v17 < v16) then
				break;
			end;
			local v19 = u14("ImageLabel", {
				Size = UDim2.new(0, u18:NextInteger(1, 3), 0, 1), 
				Position = UDim2.fromOffset(u18:NextInteger(0, 8), u18:NextInteger(0, 8)), 
				BackgroundColor3 = v15[u18:NextInteger(0, #v15 - 1) + 1], 
				BorderSizePixel = 0, 
				Parent = v14
			});		
		end;
	end;
	local v20, v21, v22 = ipairs(v12);
	while true do
		v20(v21, v22);
		if not v20 then
			break;
		end;
		v22 = v20;
		v13(v21, v20 - 1, v12);	
	end;
end;
local l__ReplicatedStorage__21 = v3.ReplicatedStorage;
local l__Workspace__22 = v3.Workspace;
local l__BlockEngine__23 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
local l__EffectUtil__24 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v5.playGlitchParticlesOnBlock(p12, p13, p14, p15)
	task.spawn(function()
		local v23 = l__ReplicatedStorage__21.Assets.Effects.GlitchedLuckyBlockEffect:Clone();
		v23.Name = "GlitchedLuckyBlockEffect";
		v23.Parent = l__Workspace__22;
		v23.Transparency = 1;
		v23.CFrame = CFrame.new((l__BlockEngine__23:getWorldPosition(p13)));
		local v24 = {
			destroyAfterSec = 1.5
		};
		local v25 = p14;
		if v25 == nil then
			v25 = 1.3;
		end;
		v24.sizeMultiplier = v25;
		local v26 = p15;
		if v26 == nil then
			v26 = 1.3;
		end;
		v24.particleMultiplier = v26;
		l__EffectUtil__24:playEffects({ v23 }, nil, v24);
	end);
end;
function v5.playGlitchedLuckyBlockCloneEffect(p16, p17, p18)
	task.spawn(function()
		if p18 then
			local v27 = l__ReplicatedStorage__21.Assets.Effects.GlitchedLuckyBlockTeleportStart:Clone();
		else
			v27 = l__ReplicatedStorage__21.Assets.Effects.GlitchedLuckyBlockTeleportEnd:Clone();
		end;
		v27.Name = "GlitchedLuckyBlockEffect";
		v27.Parent = l__Workspace__22;
		v27.Transparency = 1;
		v27.CFrame = CFrame.new((l__BlockEngine__23:getWorldPosition(p17)));
		local v28 = {};
		if p18 then
			local v29 = 2;
		else
			v29 = 1.5;
		end;
		v28.destroyAfterSec = v29;
		l__EffectUtil__24:playEffects({ v27 }, nil, v28);
	end);
end;
function v5.loopGlitchParticlesOnBlock(p19, p20)
	task.spawn(function()
		while { wait(math.random(8, 17)) } and p20.Parent ~= nil do
			p19:playGlitchParticlesOnBlock(p20.Position);		
		end;
	end);
end;
function v5.winkNormalLuckyBlockTexture(p21, p22)
	task.spawn(function()
		local function v30(p23)
			if not p23:IsA("Texture") then
				return nil;
			end;
			local v31 = p23:Clone();
			v31.Parent = p23;
			v31.ZIndex = 3;
			v31.Texture = "rbxassetid://7675786312";
			v31.StudsPerTileU = 3;
			v31.StudsPerTileV = 3;
			task.delay(0.5, function()
				v31:Destroy();
			end);
		end;
		wait(20);
		while { wait(math.random(20, 45)) } and p22.Parent ~= nil do
			local v32, v33, v34 = ipairs(p22:GetChildren());
			while true do
				v32(v33, v34);
				if not v32 then
					break;
				end;
				v34 = v32;
				task.spawn(function()
					v30(v33);
				end);			
			end;		
		end;
	end);
end;
local v35 = l__KnitClient__1.CreateController(v5.new());
return nil;
