-- Script Hash: aff4967ffe6ed011318db4aa105035ec2fc4ad9dea76549bb28ce79d9095475c1b8d01d6dd43d0e54629bb3ebfbf6dbe
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, script, "attributes");
local v3 = setmetatable({}, {
	__tostring = function()
		return "BillboardKnitComponent";
	end
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "attribute-config");
local l__BillboardTitleAttr__2 = v2.BillboardTitleAttr;
local l__BillboardSubtitleAttr__3 = v2.BillboardSubtitleAttr;
local l__BillboardSizeAttr__4 = v2.BillboardSizeAttr;
local l__BillboardMaxSizeAttr__5 = v2.BillboardMaxSizeAttr;
local l__BillboardStudsOffsetAttr__6 = v2.BillboardStudsOffsetAttr;
local l__BillboardAlwaysOnTopAttr__7 = v2.BillboardAlwaysOnTopAttr;
function v3.constructor(p1, p2)
	p1.instance = p2;
	if not p2:IsA("BasePart") then
		error("Any instance with Billboard tag must be a BasePart");
	end;
	p1.config = u1.new(p2, { l__BillboardTitleAttr__2, l__BillboardSubtitleAttr__3, l__BillboardSizeAttr__4, l__BillboardMaxSizeAttr__5, l__BillboardStudsOffsetAttr__6, l__BillboardAlwaysOnTopAttr__7 });
	p1:createBillboard();
end;
local l__ColorUtil__8 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__BillboardComponent__10 = v1.import(script, script, "ui", "billboard.component").BillboardComponent;
function v3.createBillboard(p3)
	local l__Values__5 = p3.config.Values;
	local v6 = table.create(1, {
		Text = l__Values__5.BillboardTitle, 
		TextColor = l__ColorUtil__8.hexColor(16382311), 
		LabelSize = UDim2.fromScale(1, 0.6)
	});
	local l__BillboardSubtitle__7 = l__Values__5.BillboardSubtitle;
	if l__BillboardSubtitle__7 ~= "" and l__BillboardSubtitle__7 then
		table.insert(v6, {
			Text = l__Values__5.BillboardSubtitle, 
			TextColor = l__ColorUtil__8.hexColor(9893366), 
			LabelSize = UDim2.fromScale(1, 0.45)
		});
	end;
	local v8 = {
		LightInfluence = 0, 
		MaxDistance = 120, 
		Size = l__Values__5.BillboardSize or UDim2.fromScale(10, 2), 
		StudsOffset = l__Values__5.BillboardStudsOffset
	};
	local v9 = p3.config.Values.AlwaysOnTop;
	if v9 == nil then
		v9 = true;
	end;
	v8.AlwaysOnTop = v9;
	u9.mount(u9.createFragment({
		roact_billboard = u9.createElement("BillboardGui", v8, { u9.createElement(l__BillboardComponent__10, {
				Texts = v6, 
				ItemPadding = UDim.new(0, 5), 
				MaxSize = l__Values__5.BillboardMaxSize
			}) })
	}), p3.instance);
end;
function v3.Destroy(p4)

end;
v3.Tag = "Billboard";
return v3;
