-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "SpearTravellingController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
function v4.constructor(p1, ...)
	l__KnitController__3.constructor(p1, ...);
	p1.Name = "SpearTravellingController";
	p1.maids = {};
	p1.random = Random.new();
end;
local l__CollectionService__1 = v2.CollectionService;
local l__SoundManager__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "electric-arc").lib);
local l__RunService__7 = v2.RunService;
local l__ClientSyncEvents__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__CollectionService__1:GetInstanceAddedSignal("spear-projectile"):Connect(function(p3)
		l__SoundManager__2:playSound(l__GameSound__3.WIZARD_ORB_TRAVEL_LOOP, {
			parent = p3.PrimaryPart, 
			position = p3:GetPrimaryPartCFrame().Position, 
			rollOffMaxDistance = 100
		});
		local v6 = u4.new();
		p2.maids[p3] = v6;
		local v7 = p2.random:NextInteger(3, 6);
		local v8 = table.create(v7);
		local v9 = 0;
		local v10 = false;
		while true do
			if v10 then
				v9 = v9 + 1;
			else
				v10 = true;
			end;
			if not (v9 < v7) then
				break;
			end;
			local v11 = u5("Attachment", {
				Parent = p3.PrimaryPart
			});
			local v12 = u5("Attachment", {
				Parent = p3.PrimaryPart
			});
			local v13 = u6.link(v11, v12, Color3.fromRGB(0, 0, 0), nil, 1);
			v13:SetColor(Color3.fromRGB(97, 157, 236):Lerp(Color3.fromRGB(70, 109, 236), p2.random:NextNumber()));
			table.insert(v8, {
				goalAttachment = v12, 
				sourceAttachment = v11, 
				seed = p2.random:NextNumber(0, 100), 
				arc = v13
			});		
		end;
		v6:GiveTask(function()
			local v14, v15, v16 = ipairs(v8);
			while true do
				v14(v15, v16);
				if not v14 then
					break;
				end;
				v16 = v14;
				v15.arc:Destroy();
				v15.goalAttachment:Destroy();
				v15.sourceAttachment:Destroy();			
			end;
		end);
		v6:GiveTask(l__RunService__7.Heartbeat:Connect(function()
			local v17, v18, v19 = ipairs(v8);
			while true do
				v17(v18, v19);
				if not v17 then
					break;
				end;
				v19 = v17;
				if p3.PrimaryPart == nil then
					return nil;
				end;
				local l__Position__20 = p3:GetPrimaryPartCFrame().Position;
				local v21 = CFrame.lookAt(l__Position__20, l__Position__20 + p3.PrimaryPart.AssemblyLinearVelocity.Unit) * CFrame.new(0, 0, -5);
				v18.sourceAttachment.WorldCFrame = v21;
				v18.goalAttachment.WorldCFrame = v21 * CFrame.new(math.noise(time() * 5, 0, v18.seed) * 4, math.noise(time() * 5, 0, -v18.seed) * 4, 10 + math.noise(time() * 5, 0, v18.seed + v18.seed) * 2);			
			end;
		end));
	end);
	l__CollectionService__1:GetInstanceRemovedSignal("spear-projectile"):Connect(function(p4)
		local v22 = p2.maids[p4];
		if v22 ~= nil then
			v22:DoCleaning();
		end;
		p2.maids[p4] = nil;
	end);
	l__ClientSyncEvents__8.ProjectileLaunched:connect(function(p5)
		if p5.projectileType == "spear" then
			l__CollectionService__1:AddTag(p5.projectile, "spear-projectile");
		end;
	end);
end;
local v23 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
