-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "SpearTravellingController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
function v5.constructor(p1, ...)
	u1.constructor(p1, ...);
	p1.Name = "SpearTravellingController";
	p1.maids = {};
	p1.random = Random.new();
end;
local l__CollectionService__2 = v3.CollectionService;
local l__SoundManager__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Maid__5 = v2.Maid;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "electric-arc").lib);
local l__RunService__8 = v3.RunService;
local l__ClientSyncEvents__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__CollectionService__2:GetInstanceAddedSignal("spear-projectile"):Connect(function(p3)
		l__SoundManager__3:playSound(l__GameSound__4.WIZARD_ORB_TRAVEL_LOOP, {
			parent = p3.PrimaryPart, 
			position = p3:GetPrimaryPartCFrame().Position, 
			rollOffMaxDistance = 100
		});
		local v7 = l__Maid__5.new();
		p2.maids[p3] = v7;
		local v8 = p2.random:NextInteger(3, 6);
		local v9 = table.create(v8);
		local v10 = 0;
		local v11 = false;
		while true do
			if v11 then
				v10 = v10 + 1;
			else
				v11 = true;
			end;
			if not (v10 < v8) then
				break;
			end;
			local v12 = u6("Attachment", {
				Parent = p3.PrimaryPart
			});
			local v13 = u6("Attachment", {
				Parent = p3.PrimaryPart
			});
			local v14 = u7.link(v12, v13, Color3.fromRGB(0, 0, 0), nil, 1);
			v14:SetColor(Color3.fromRGB(97, 157, 236):Lerp(Color3.fromRGB(70, 109, 236), p2.random:NextNumber()));
			table.insert(v9, {
				goalAttachment = v13, 
				sourceAttachment = v12, 
				seed = p2.random:NextNumber(0, 100), 
				arc = v14
			});		
		end;
		v7:GiveTask(function()
			for v15, v16 in ipairs(v9) do
				v16.arc:Destroy();
				v16.goalAttachment:Destroy();
				v16.sourceAttachment:Destroy();
			end;
		end);
		v7:GiveTask(l__RunService__8.Heartbeat:Connect(function()
			for v17, v18 in ipairs(v9) do
				if p3.PrimaryPart == nil then
					return nil;
				end;
				local l__Position__19 = p3:GetPrimaryPartCFrame().Position;
				local v20 = CFrame.lookAt(l__Position__19, l__Position__19 + p3.PrimaryPart.AssemblyLinearVelocity.Unit) * CFrame.new(0, 0, -5);
				v18.sourceAttachment.WorldCFrame = v20;
				v18.goalAttachment.WorldCFrame = v20 * CFrame.new(math.noise(time() * 5, 0, v18.seed) * 4, math.noise(time() * 5, 0, -v18.seed) * 4, 10 + math.noise(time() * 5, 0, v18.seed + v18.seed) * 2);
			end;
		end));
	end);
	l__CollectionService__2:GetInstanceRemovedSignal("spear-projectile"):Connect(function(p4)
		local v21 = p2.maids[p4];
		if v21 ~= nil then
			v21:DoCleaning();
		end;
		p2.maids[p4] = nil;
	end);
	l__ClientSyncEvents__9.ProjectileLaunched:connect(function(p5)
		if p5.projectileType == "spear" then
			l__CollectionService__2:AddTag(p5.projectile, "spear-projectile");
		end;
	end);
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
