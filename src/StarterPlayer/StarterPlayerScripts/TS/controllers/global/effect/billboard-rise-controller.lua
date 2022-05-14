-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "BillboardRiseController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
local u2 = l__KnitController__4;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "BillboardRiseController";
end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function u1.KnitStart(p2)
	l__default__3.Client:WaitFor("BillboardRiseEffect"):andThen(function(p3)
		p3:Connect(function(p4)
			p2:playEffect(p4.position, {
				image = p4.image, 
				imageColor = p4.imageColor, 
				itemType = p4.itemType, 
				size = p4.size
			});
		end);
	end);
end;
local l__Workspace__4 = v3.Workspace;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Lighting__6 = v3.Lighting;
local l__GameQueryUtil__7 = v2.GameQueryUtil;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ItemViewport__9 = v1.import(script, script.Parent.Parent, "inventory", "ui", "item-viewport").ItemViewport;
local l__Empty__10 = v2.Empty;
local l__Players__11 = v3.Players;
local l__TweenService__12 = v3.TweenService;
function u1.playEffect(p5, p6, p7)
	if (p6 - l__Workspace__4.CurrentCamera.CFrame.Position).Magnitude >= 100 then
		return nil;
	end;
	local v7 = u5("Part", {
		Name = "HarvestCropFloatEffect", 
		Size = Vector3.new(1, 1, 1), 
		CFrame = CFrame.new(p6), 
		Transparency = 1, 
		Anchored = true, 
		CanCollide = false, 
		Parent = l__Lighting__6
	});
	l__GameQueryUtil__7:setQueryIgnored(v7, true);
	local v8 = u8.createRef();
	local v9 = {};
	local v10 = {};
	local v11 = false;
	if p7.itemType ~= nil then
		v11 = u8.createElement(l__ItemViewport__9, {
			ItemType = p7.itemType
		});
	end;
	if v11 then
		v10[#v10 + 1] = v11;
	end;
	local v12 = false;
	if p7.image ~= nil then
		v12 = u8.createElement("ImageLabel", {
			Image = p7.image, 
			ImageColor3 = p7.imageColor, 
			Size = UDim2.fromScale(1, 1), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0
		});
	end;
	if v12 then
		v10[#v10 + 1] = v12;
	end;
	v9[#v9 + 1] = u8.createElement(l__Empty__10, {
		Size = UDim2.fromScale(1, 1), 
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5)
	}, v10);
	local v13 = u8.mount(u8.createElement("BillboardGui", {
		[u8.Ref] = v8, 
		Adornee = v7, 
		Size = p7.size or UDim2.fromScale(2.5, 2.5), 
		LightInfluence = 0
	}, v9), l__Players__11.LocalPlayer:WaitForChild("PlayerGui"));
	l__TweenService__12:Create(v8:getValue(), TweenInfo.new(0.7), {
		StudsOffsetWorldSpace = Vector3.new(0, 3.2, 0)
	}):Play();
	v1.Promise.delay(0.5):andThen(function()
		l__TweenService__12:Create(v8:getValue(), TweenInfo.new(0.2), {
			Size = UDim2.fromScale(0, 0)
		}):Play();
	end);
	v1.Promise.delay(1.5):andThen(function()
		u8.unmount(v13);
	end);
end;
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	BillboardRiseController = u2
};
return u1;
