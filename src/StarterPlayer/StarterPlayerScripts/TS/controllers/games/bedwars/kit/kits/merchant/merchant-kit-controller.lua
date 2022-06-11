-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "MerchantKitController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Queue__3 = v1.import(script, v1.getModule(script, "@rbxts", "datastructures").out).Queue;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "MerchantKitController";
	p1.discountedItems = {};
	p1.discountedItemsEvent = l__default__2.Client:Get("RemoteName");
	p1.discountAppliedEvent = l__default__2.Client:Get("RemoteName");
	p1.purchaseQueue = l__Queue__3.new();
	p1.queueAccumulator = 0;
	p1.frameRef = u4.createRef();
end;
local l__RunService__5 = v2.RunService;
local l__MerchantDiscount__6 = v1.import(script, script.Parent, "ui", "merchant-discount").MerchantDiscount;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	p2:createUIContainer();
	p2.discountedItemsEvent:Connect(function(p3)
		p2.discountedItems = p3.items;
	end);
	p2.discountAppliedEvent:Connect(function(p4)
		p2.purchaseQueue:Push(p4);
	end);
	l__RunService__5.Heartbeat:Connect(function(p5)
		if not p2.purchaseQueue:IsEmpty() then
			p2.queueAccumulator = p2.queueAccumulator + p5;
		end;
		if p2.queueAccumulator >= 1 then
			local v6 = p2.purchaseQueue:Pop();
			if v6 then
				local v7 = p2.frameRef:getValue();
				if v7 then
					p2:scheduleForDeletion((u4.mount(u4.createElement(l__MerchantDiscount__6, {
						item = v6.item, 
						refund = v6.refund
					}), v7)));
				end;
			end;
			p2.queueAccumulator = 0;
		end;
	end);
end;
local l__Players__7 = v2.Players;
function v4.createUIContainer(p6)
	u4.mount(u4.createElement("ScreenGui", {
		ResetOnSpawn = false
	}, {
		DiscountContainer = u4.createElement("Frame", {
			[u4.Ref] = p6.frameRef, 
			Size = UDim2.fromScale(1, 1), 
			Position = UDim2.fromScale(0.5, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			BackgroundTransparency = 1, 
			Active = false
		}, { u4.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				Padding = UDim.new(0, 15)
			}) })
	}), l__Players__7.LocalPlayer:WaitForChild("PlayerGui"));
end;
function v4.scheduleForDeletion(p7, p8)
	task.delay(2, function()
		u4.unmount(p8);
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
