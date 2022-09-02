-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "ConsumeController";
	end, 
	__index = l__HandKnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1)
	l__HandKnitController__4.constructor(p1);
	p1.Name = "ConsumeController";
	p1.maid = u2.new();
end;
function u1.KnitStart(p2)
	l__HandKnitController__4.KnitStart(p2);
end;
local l__getItemMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function u1.isRelevantItem(p3, p4)
	return l__getItemMeta__3(p4.itemType).consumable ~= nil;
end;
local l__ClickHold__4 = v2.ClickHold;
local l__default__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__EntityUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__KnitClient__7 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__SoundManager__9 = v2.SoundManager;
local l__GameAnimationUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__Players__11 = v3.Players;
local l__AnimationType__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__ContextActionService__13 = v3.ContextActionService;
local l__UserInputService__14 = v3.UserInputService;
local u15 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__MobileButton__16 = v2.MobileButton;
local l__BedwarsImageId__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__BedwarsUI__18 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
function u1.onEnable(p5, p6)
	p5.maid:DoCleaning();
	local v7 = l__getItemMeta__3(p6.itemType);
	if not v7.consumable then
		return nil;
	end;
	local v8 = l__ClickHold__4.new(v7.consumable.consumeTime);
	local u19 = u2.new();
	local u20 = false;
	local u21 = nil;
	local u22 = nil;
	local u23 = nil;
	v8:setOnComplete(function()
		u19:DoCleaning();
		u20 = false;
		if u21 ~= nil then
			u21:Stop();
		end;
		if u22 ~= nil then
			u22:Stop();
		end;
		u23 = -1;
		l__default__5.Client:Get("RemoteName"):CallServerAsync({
			item = p6.tool
		}):andThen(function()

		end):catch(function(p7)
			warn(p7);
		end);
	end);
	p5.maid:GiveTask(function()
		v8:disable();
	end);
	u23 = -1;
	p5.maid:GiveTask(function()
		u19:DoCleaning();
		u20 = false;
		u23 = -1;
		v8:endClick();
		if u21 ~= nil then
			u21:Stop();
		end;
		if u22 ~= nil then
			u22:Stop();
		end;
	end);
	if v7.consumable.cancelOnDamage then
		task.spawn(function()
			p5.maid:GiveTask(l__default__5.Client:Get("RemoteName"):Connect(function(p8)
				if p8.entityInstance == l__Players__11.LocalPlayer.Character then
					v8:cancelClick();
				end;
			end));
		end);
	end;
	local function u24()
		local v9 = v7.consumable;
		if v9 ~= nil then
			v9 = v9.requiresMissingHealth;
		end;
		if v9 then
			local v10 = l__EntityUtil__6:getLocalPlayerEntity();
			if v10 and v10:getMaxHealth() <= v10:getHealth() then
				return nil;
			end;
		end;
		u19:GiveTask(l__KnitClient__7.Controllers.SprintController:getMovementStatusModifier():addModifier({
			blockSprint = true, 
			moveSpeedMultiplier = 0.5
		}));
		u20 = true;
		local v11 = tick();
		u23 = v11;
		v1.Promise.defer(function()
			local v12 = v7.consumable;
			if v12 ~= nil then
				v12 = v12.soundOverride;
			end;
			if v12 ~= "None" then
				while true do
					local v13 = v7.consumable;
					if v13 ~= nil then
						v13 = v13.soundOverride;
					end;
					local v14 = v13;
					if v14 == nil then
						v14 = l__GameSound__8.EAT_FOOD_1;
					end;
					u22 = l__SoundManager__9:playSound(v14);
					local v15 = wait(0.23);
					if v15 ~= 0 and v15 == v15 and v15 then
						v15 = u23 == v11;
					end;
					if v15 == 0 then
						break;
					end;
					if v15 ~= v15 then
						break;
					end;
					if not v15 then
						break;
					end;				
				end;
			end;
		end);
		v1.Promise.defer(function()
			local v16 = v7.consumable;
			if v16 ~= nil then
				v16 = v16.disableAnimation;
			end;
			if v16 ~= true then
				local v17 = v7.consumable;
				if v17 ~= nil then
					v17 = v17.animationOverride;
				end;
				local v18 = v17;
				if v18 == nil then
					v18 = l__AnimationType__12.EAT;
				end;
				u21 = l__GameAnimationUtil__10.playAnimation(l__Players__11.LocalPlayer, v18, {
					looped = true
				});
				if not u20 and u21 ~= nil then
					u21:Stop();
				end;
			end;
		end);
		v8:startClick();
	end;
	l__ContextActionService__13:BindAction("consume-item", function(p9, p10, p11)
		if p10 == Enum.UserInputState.Begin then
			u24();
			return;
		end;
		if p10 == Enum.UserInputState.End then
			u19:DoCleaning();
			u20 = false;
			u23 = -1;
			v8:endClick();
			if u21 ~= nil then
				u21:Stop();
			end;
			if u22 ~= nil then
				u22:Stop();
			end;
		end;
	end, false, Enum.UserInputType.MouseButton1, Enum.KeyCode.ButtonR2);
	p5.maid:GiveTask(function()
		l__ContextActionService__13:UnbindAction("consume-item");
	end);
	if l__UserInputService__14.TouchEnabled then
		p5:setupYield(function()
			local u25 = u15.mount(u15.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, { u15.createElement(l__MobileButton__16, {
					Image = l__BedwarsImageId__17.CONSUME_MOBILE, 
					Position = l__BedwarsUI__18:getActionMobileButtonPosition(), 
					OnPressDown = function()
						u24();
					end, 
					OnPressUp = function()
						u19:DoCleaning();
						u20 = false;
						u23 = -1;
						v8:endClick();
						if u21 ~= nil then
							u21:Stop();
						end;
						if u22 ~= nil then
							u22:Stop();
						end;
					end
				}) }), l__Players__11.LocalPlayer:WaitForChild("PlayerGui"));
			return function()
				u15.unmount(u25);
			end;
		end);
	end;
end;
function u1.onDisable(p12)
	p12.maid:DoCleaning();
end;
u1 = l__KnitClient__7.CreateController;
u1 = u1(u1.new());
return {
	ConsumeController = u1
};
