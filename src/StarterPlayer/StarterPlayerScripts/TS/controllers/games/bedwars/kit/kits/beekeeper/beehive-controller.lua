-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "BeehiveController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = l__KnitController__5;
function v6.constructor(p1)
	u1.constructor(p1);
	p1.Name = "BeehiveController";
	p1.beehiveData = {};
end;
local l__CollectionTagAdded__2 = v2.CollectionTagAdded;
local l__Maid__3 = v3.Maid;
local l__SoundManager__4 = v2.SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__CollectionService__6 = v4.CollectionService;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	l__CollectionTagAdded__2("beehive", function(p3)
		local v8 = l__Maid__3.new();
		p2.beehiveData[p3] = {
			bees = {}, 
			maid = v8
		};
		v8:GiveTask(function()
			local v9 = p2.beehiveData[p3];
			if v9 ~= nil then
				v9 = v9.bees;
			end;
			if v9 then
				for v10, v11 in ipairs(v9) do
					v11:Destroy();
				end;
			end;
		end);
		v8:GiveTask(p3:GetAttributeChangedSignal("Level"):Connect(function()
			l__SoundManager__4:playSound(l__GameSound__5.DEPOSIT_BEE, {
				position = p3.Position, 
				parent = p3
			});
			p3.LevelUpParticles:Emit(10);
			p2:reconcileBeesAroundHive(p3, p3:GetAttribute("Level"));
		end));
	end);
	l__CollectionService__6:GetInstanceRemovedSignal("beehive"):Connect(function(p4)
		local v12 = p2.beehiveData[p4];
		if v12 ~= nil then
			local v13 = v12.maid:DoCleaning();
		end;
		p2.beehiveData[p4] = nil;
	end);
end;
local l__KnitClient__7 = v3.KnitClient;
local l__ReplicatedStorage__8 = v4.ReplicatedStorage;
function v6.reconcileBeesAroundHive(p5, p6, p7)
	local v14 = p5.beehiveData[p6];
	if v14 == nil then
		error("beehive is not key of this.beehiveData. somebody did something dumb if you see this");
	end;
	local v15 = math.floor(p7 / 2);
	local v16 = v15 - #v14.bees;
	if v15 > 7 then
		return nil;
	end;
	if v16 > 0 then
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
			table.insert(v14.bees, (l__KnitClient__7.Controllers.BeeController:createLocalBee({
				id = -1, 
				origin = p6.Position, 
				maxDistanceFromOrigin = 2, 
				beeModel = l__ReplicatedStorage__8.Assets.Effects.TamedBee:Clone(), 
				includeProximityPrompt = false
			})));		
		end;
	elseif v16 <= 0 then
		local v19 = 0;
		local v20 = false;
		while true do
			if v20 then
				v19 = v19 + 1;
			else
				v20 = true;
			end;
			if not (v19 < math.abs(v16)) then
				break;
			end;
			local l__bees__21 = v14.bees;
			local v22 = #l__bees__21;
			l__bees__21[v22] = nil;
			local v23 = l__bees__21[v22];
			if v23 ~= nil then
				v23:Destroy();
			end;		
		end;
	end;
end;
u1 = v3.KnitClient.CreateController;
u1 = u1(v6.new());
return nil;
