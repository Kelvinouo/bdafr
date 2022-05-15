
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "lobby").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "LobbyTutorialController";
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
	p1.Name = "LobbyTutorialController";
end;
local l__Players__2 = v3.Players;
local l__LobbyEvents__3 = v2.LobbyEvents;
local l__QueueState__4 = v2.QueueState;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	if l__Players__2.LocalPlayer:GetAttribute("EnableQueueTutorial") == true then
		task.spawn(function()
			p2:enableQueueTutorial();
		end);
	end;
	l__Players__2.LocalPlayer:GetAttributeChangedSignal("EnableQueueTutorial"):Connect(function()
		if l__Players__2.LocalPlayer:GetAttribute("EnableQueueTutorial") == true then
			p2:enableQueueTutorial();
		end;
	end);
	l__LobbyEvents__3.client.partyInfoEvent:connect(function(p3)
		if p3.party.queueState == l__QueueState__4.IN_QUEUE then
			p2:destroyQueueTutorialBeams();
		end;
	end);
end;
local l__Workspace__5 = v3.Workspace;
local l__PlayerUtil__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).PlayerUtil;
local l__ReplicatedStorage__7 = v3.ReplicatedStorage;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__ContentProvider__9 = v3.ContentProvider;
local l__CollectionService__10 = v3.CollectionService;
function v5.enableQueueTutorial(p4)
	local v7 = l__ReplicatedStorage__7.Assets.Effects.QueueTutorialBeam:Clone();
	v7.Attachment0 = l__PlayerUtil__6.waitForCharacter(l__Players__2.LocalPlayer):WaitForChild("UpperTorso"):WaitForChild("BodyFrontAttachment");
	v7.Attachment1 = u8("Attachment", {
		Parent = l__Workspace__5:WaitForChild("Lobby"):WaitForChild("Queues"):WaitForChild("bedwars_classic")
	});
	l__ContentProvider__9:PreloadAsync({ v7 });
	v7.Parent = l__Workspace__5;
	l__CollectionService__10:AddTag(v7, "QueueTutorialBeam");
end;
function v5.destroyQueueTutorialBeams(p5)
	local v8 = l__CollectionService__10:GetTagged("QueueTutorialBeam");
	local function v9(p6)
		p6:Destroy();
	end;
	for v10, v11 in ipairs(v8) do
		v9(v11, v10 - 1, v8);
	end;
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v5.new());
return nil;

