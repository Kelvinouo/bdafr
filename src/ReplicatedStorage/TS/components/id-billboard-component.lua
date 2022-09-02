-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__Reflect__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Reflect;
local l__t__3 = v1.import(script, v1.getModule(script, "@rbxts", "t").lib.ts).t;
local v4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__GameComponent__5 = v4.GameComponent;
local l__Component__6 = v1.import(script, v1.getModule(script, "@flamework", "components").out).Component;
local v7 = setmetatable({}, {
	__tostring = function()
		return "IdBillboardComponent";
	end, 
	__index = l__GameComponent__5
});
v7.__index = v7;
function v7.new(...)
	local v8 = setmetatable({}, v7);
	return v8:constructor(...) and v8;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v7.constructor(p1, ...)
	l__GameComponent__5.constructor(p1, ...);
	p1.billboardMaid = u1.new();
end;
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
function v7.onStart(p2)
	if not l__KnitClient__2 then
		return nil;
	end;
	if l__KnitClient__2.Controllers.GamemodeController:isLocalPlayerInCreativeMode() then
		p2:displayUIDBillboard();
	end;
end;
function v7.getTag(p3)
	return "IdBillboardComponent";
end;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ColorUtil__5 = v4.ColorUtil;
function v7.displayUIDBillboard(p4)
	local u6 = u3.mount(u3.createFragment({
		UIDBillboard = u3.createElement("BillboardGui", {
			Size = UDim2.fromScale(7, 0.75), 
			StudsOffsetWorldSpace = Vector3.new(0, 3.7, 0), 
			AlwaysOnTop = true, 
			MaxDistance = 110
		}, { u3.createElement("Frame", {
				Size = UDim2.fromScale(1, 1), 
				BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
				BackgroundTransparency = l__Theme__4.nametagBackgroundTransparency, 
				BorderSizePixel = 0
			}, { u3.createElement("UIListLayout", {
					FillDirection = "Vertical"
				}), u3.createElement("TextLabel", {
					Text = "Id: " .. p4.attributes.Id, 
					Size = UDim2.fromScale(1, 1), 
					BorderSizePixel = 0, 
					BackgroundTransparency = 1, 
					Font = "RobotoMono", 
					TextColor3 = l__ColorUtil__5.WHITE, 
					RichText = true, 
					TextScaled = true
				}, { u3.createElement("UIPadding", {
						PaddingTop = UDim.new(0.15, 0), 
						PaddingBottom = UDim.new(0.15, 0)
					}) }) }) })
	}), p4.instance);
	p4.billboardMaid:GiveTask(function()
		u3.unmount(u6);
	end);
	p4.maid:GiveTask(p4.billboardMaid);
end;
function v7.closeUIDBillboard(p5)
	p5.billboardMaid:DoCleaning();
end;
l__Reflect__2.defineMetadata(v7, "identifier", "shared/components/id-billboard-component@IdBillboardComponent");
l__Reflect__2.defineMetadata(v7, "flamework:implements", { "$:flamework@OnStart" });
l__Reflect__2.decorate(v7, "$c:init@Component", l__Component__6, { {
		tag = "IdBillboardComponent", 
		defaults = {
			Id = "", 
			BlockPosition = Vector3.new()
		}, 
		attributes = {
			Id = l__t__3.string, 
			BlockPosition = l__t__3.Vector3
		}, 
		instanceGuard = l__t__3.instanceIsA("BasePart")
	} });
return {
	default = v7
};
