
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitClient__4 = v3.KnitClient;
local v5 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v7 = setmetatable({}, {
	__tostring = function()
		return "ConsumeController";
	end, 
	__index = l__HandKnitController__6
});
v7.__index = v7;
local u1 = v7;
function u1.new(...)
	local v8 = setmetatable({}, u1);
	return v8:constructor(...) and v8;
end;
local u2 = l__HandKnitController__6;
local l__Maid__3 = v3.Maid;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "ConsumeController";
	p1.maid = l__Maid__3.new();
end;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
end;
local l__getItemMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function u1.isRelevantItem(p3, p4)
	return l__getItemMeta__4(p4.itemType).consumable ~= nil;
end;
local l__ClickHold__5 = v2.ClickHold;
local l__default__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__EntityUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__SoundManager__9 = v2.SoundManager;
local l__GameAnimationUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__Players__11 = v5.Players;
local l__AnimationType__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__ContextActionService__13 = v5.ContextActionService;
local l__UserInputService__14 = v5.UserInputService;
local u15 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__MobileButton__16 = v2.MobileButton;
local l__BedwarsImageId__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__BedwarsUI__18 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
function u1.onEnable(p5, p6)
	p5.maid:DoCleaning();
	local v9 = l__getItemMeta__4(p6.itemType);
	if not v9.consumable then
		return nil;
	end;
	local v10 = l__ClickHold__5.new(v9.consumable.consumeTime);
	local u19 = l__Maid__3.new();
	local u20 = false;
	local u21 = nil;
	local u22 = nil;
	local u23 = nil;
	v10:setOnComplete(function()
		u19:DoCleaning();
		u20 = false;
		if u21 ~= nil then
			u21:Stop();
		end;
		if u22 ~= nil then
			u22:Stop();
		end;
		u23 = -1;
		l__default__6.Client:Get("RemoteName"):CallServerAsync({
			item = p6.tool
		}):andThen(function()

		end):catch(function(p7)
			warn(p7);
		end);
	end);
	p5.maid:GiveTask(function()
		v10:disable();
	end);
	u23 = -1;
	local function u24()
		u19:DoCleaning();
		u20 = false;
		u23 = -1;
		v10:endClick();
		if u21 ~= nil then
			u21:Stop();
		end;
		if u22 ~= nil then
			u22:Stop();
		end;
	end;
	p5.maid:GiveTask(function()
		u24();
	end);
	if v9.consumable.cancelOnDamage then
		task.spawn(function()
			p5.maid:GiveTask(l__default__6.Client:Get("RemoteName"):Connect(function(p8)
				if p8.entityInstance == l__Players__11.LocalPlayer.Character then
					v10:cancelClick();
				end;
			end));
		end);
	end;
	local function u25()
		local v11 = v9.consumable;
		if v11 ~= nil then
			v11 = v11.requiresMissingHealth;
		end;
		if v11 then
			local v12 = l__EntityUtil__7:getLocalPlayerEntity();
			if v12 and v12:getMaxHealth() <= v12:getHealth() then
				return nil;
			end;
		end;
		u19:GiveTask(l__KnitClient__4.Controllers.SprintController:getMovementStatusModifier():addModifier({
			blockSprint = true, 
			moveSpeedMultiplier = 0.5
		}));
		u20 = true;
		local v13 = tick();
		u23 = v13;
		v1.Promise.defer(function()
			local v14 = v9.consumable;
			if v14 ~= nil then
				v14 = v14.soundOverride;
			end;
			if v14 ~= "None" then
				while true do
					local v15 = v9.consumable;
					if v15 ~= nil then
						v15 = v15.soundOverride;
					end;
					local v16 = v15;
					if v16 == nil then
						v16 = l__GameSound__8.EAT_FOOD_1;
					end;
					u22 = l__SoundManager__9:playSound(v16);
					local v17 = wait(0.23);
					if v17 ~= 0 and v17 == v17 and v17 then
						v17 = u23 == v13;
					end;
					if v17 == 0 then
						break;
					end;
					if v17 ~= v17 then
						break;
					end;
					if not v17 then
						break;
					end;				
				end;
			end;
		end);
		v1.Promise.defer(function()
			local v18 = v9.consumable;
			if v18 ~= nil then
				v18 = v18.disableAnimation;
			end;
			if v18 ~= true then
				u21 = l__GameAnimationUtil__10.playAnimation(l__Players__11.LocalPlayer, l__AnimationType__12.EAT, {
					looped = true
				});
				if not u20 and u21 ~= nil then
					u21:Stop();
				end;
			end;
		end);
		v10:startClick();
	end;
	l__ContextActionService__13:BindAction("consume-item", function(p9, p10, p11)
		if p10 == Enum.UserInputState.Begin then
			u25();
			return;
		end;
		if p10 == Enum.UserInputState.End then
			u24();
		end;
	end, false, Enum.UserInputType.MouseButton1, Enum.KeyCode.ButtonR2);
	p5.maid:GiveTask(function()
		l__ContextActionService__13:UnbindAction("consume-item");
	end);
	if l__UserInputService__14.TouchEnabled then
		p5:setupYield(function()
			local u26 = u15.mount(u15.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, { u15.createElement(l__MobileButton__16, {
					Image = l__BedwarsImageId__17.CONSUME_MOBILE, 
					Position = l__BedwarsUI__18:getActionMobileButtonPosition(), 
					OnPressDown = function()
						u25();
					end, 
					OnPressUp = function()
						u24();
					end
				}) }), l__Players__11.LocalPlayer:WaitForChild("PlayerGui"));
			return function()
				u15.unmount(u26);
			end;
		end);
	end;
end;
function u1.onDisable(p12)
	p12.maid:DoCleaning();
end;
u2 = l__KnitClient__4.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	ConsumeController = u2
};
return u1;

