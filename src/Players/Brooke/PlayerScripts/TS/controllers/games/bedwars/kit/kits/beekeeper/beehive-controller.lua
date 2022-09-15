-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
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
function v6.constructor(p1)
	l__KnitController__5.constructor(p1);
	p1.Name = "BeehiveController";
	p1.beehiveData = {};
end;
local l__CollectionTagAdded__1 = v2.CollectionTagAdded;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__SoundManager__3 = v2.SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__CollectionService__5 = v4.CollectionService;
function v6.KnitStart(p2)
	l__KnitController__5.KnitStart(p2);
	l__CollectionTagAdded__1("beehive", function(p3)
		local v8 = u2.new();
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
				local v10, v11, v12 = ipairs(v9);
				while true do
					v10(v11, v12);
					if not v10 then
						break;
					end;
					v12 = v10;
					v11:Destroy();				
				end;
			end;
		end);
		v8:GiveTask(p3:GetAttributeChangedSignal("Level"):Connect(function()
			l__SoundManager__3:playSound(l__GameSound__4.DEPOSIT_BEE, {
				position = p3.Position, 
				parent = p3
			});
			p3.LevelUpParticles:Emit(10);
			p2:reconcileBeesAroundHive(p3, p3:GetAttribute("Level"));
		end));
	end);
	l__CollectionService__5:GetInstanceRemovedSignal("beehive"):Connect(function(p4)
		local v13 = p2.beehiveData[p4];
		if v13 ~= nil then
			local v14 = v13.maid:DoCleaning();
		end;
		p2.beehiveData[p4] = nil;
	end);
end;
local l__KnitClient__6 = v3.KnitClient;
local l__ReplicatedStorage__7 = v4.ReplicatedStorage;
function v6.reconcileBeesAroundHive(p5, p6, p7)
	local v15 = p5.beehiveData[p6];
	if v15 == nil then
		error("beehive is not key of this.beehiveData. somebody did something dumb if you see this");
	end;
	local v16 = math.floor(p7 / 2);
	local v17 = v16 - #v15.bees;
	if v16 > 7 then
		return nil;
	end;
	if v17 > 0 then
		local v18 = 0;
		local v19 = false;
		while true do
			if v19 then
				v18 = v18 + 1;
			else
				v19 = true;
			end;
			if not (v18 < v17) then
				break;
			end;
			table.insert(v15.bees, (l__KnitClient__6.Controllers.BeeController:createLocalBee({
				id = -1, 
				origin = p6.Position, 
				maxDistanceFromOrigin = 2, 
				beeModel = l__ReplicatedStorage__7.Assets.Effects.TamedBee:Clone(), 
				includeProximityPrompt = false
			})));		
		end;
	elseif v17 <= 0 then
		local v20 = 0;
		local v21 = false;
		while true do
			if v21 then
				v20 = v20 + 1;
			else
				v21 = true;
			end;
			if not (v20 < math.abs(v17)) then
				break;
			end;
			local l__bees__22 = v15.bees;
			local v23 = #l__bees__22;
			local v24 = l__bees__22[v23];
			l__bees__22[v23] = nil;
			if v24 ~= nil then
				v24:Destroy();
			end;		
		end;
	end;
end;
local v25 = v3.KnitClient.CreateController(v6.new());
return nil;
