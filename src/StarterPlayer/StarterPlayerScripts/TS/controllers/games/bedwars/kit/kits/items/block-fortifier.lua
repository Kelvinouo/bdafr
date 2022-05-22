-- Script Hash: e1831615b401f1dc089d5cabe63fe5ebd6cae27b4a1a95dfe222c738a5674b0998518b6f72f41790fc2ecf9afadcd4c0
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v4 = setmetatable({}, {
	__tostring = function()
		return "BlockFortifier";
	end
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local l__Maid__1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).Maid;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__BlockHighlighter__3 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out.client.highlight["block-highlighter"]).BlockHighlighter;
local l__ClientBlockEngine__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "block-engine", "client-block-engine").ClientBlockEngine;
local l__BlockSelectorMode__5 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out.client.select["block-selector"]).BlockSelectorMode;
local l__Theme__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__BuilderKit__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "builder", "builder-kit").BuilderKit;
local l__ItemViewport__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport;
local l__Players__9 = v3.Players;
local l__default__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v4.constructor(p1)
	p1.maid = l__Maid__1.new();
	p1.highlightMaid = l__Maid__1.new();
	p1.costGuiRef = u2.createRef();
	p1.blockHighlighter = l__BlockHighlighter__3.new(l__ClientBlockEngine__4, l__BlockSelectorMode__5.SELECT);
	p1.blockHighlighter:setAllowHighlight(function(p2, p3)
		return p1:canHighlight(p2);
	end);
	p1.blockHighlighter:setOnHighlight(function(p4, p5)
		if not p4 then
			return nil;
		end;
		local v6 = Color3.fromRGB(155, 155, 155);
		if not p1:hasEnoughMaterialsToUpgrade(p4.Name) then
			v6 = l__Theme__6.mcRed;
		end;
		local v7 = l__BuilderKit__7.getFortificationCost(p4.Name);
		if v7 then
			p1.costHandle = u2.mount(u2.createElement("BillboardGui", {
				[u2.Ref] = p1.costGuiRef, 
				Adornee = p4, 
				Size = UDim2.new(2, 0, 2, 0), 
				StudsOffsetWorldSpace = Vector3.new(0, 4, 0), 
				AlwaysOnTop = true
			}, { u2.createElement("Frame", {
					Size = UDim2.new(1, 0, 1, 0), 
					BackgroundColor3 = v6, 
					BackgroundTransparency = 0.7, 
					BorderSizePixel = 0
				}, { u2.createElement("UICorner", {
						CornerRadius = UDim.new(0.05, 0)
					}), u2.createElement(l__ItemViewport__8, {
						ItemType = v7[1].currency, 
						Amount = v7[1].amount, 
						IgnoreInitialPop = true, 
						DisplayOneAmount = true
					}) }) }), l__Players__9.LocalPlayer:WaitForChild("PlayerGui"));
			p1.highlightMaid:GiveTask(function()
				local v8 = p1.costGuiRef:getValue();
				if v8 ~= nil then
					v8:Destroy();
				end;
			end);
		end;
	end);
	p1.blockHighlighter:setOnHighlightEnded(function()
		p1.highlightMaid:DoCleaning();
	end);
	l__default__10.Client:WaitFor("RemoteName"):andThen(function(p6)
		return p6:Connect(function(p7, p8)
			p1:playFortifyEffect(p7, p8);
		end);
	end);
end;
local l__InventoryUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
function v4.hasEnoughMaterialsToUpgrade(p9, p10)
	local v9 = l__BuilderKit__7.getFortificationCost(p10);
	if not v9 then
		return false;
	end;
	for v10, v11 in ipairs(v9) do
		if not l__InventoryUtil__11.hasEnough(l__Players__9.LocalPlayer, v11.currency, v11.amount) then
			return false;
		end;
	end;
	return true;
end;
local l__BlockEngine__12 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
local l__SoundManager__13 = v2.SoundManager;
local l__GameSound__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v4.playFortifyEffect(p11, p12, p13)
	if l__Players__9.LocalPlayer:DistanceFromCharacter(l__BlockEngine__12:getWorldPosition(p13)) < 50 then
		local v12 = {};
		if l__Players__9.LocalPlayer == p12 then
			local v13 = nil;
		else
			v13 = l__BlockEngine__12:getWorldPosition(p13);
		end;
		v12.position = v13;
		l__SoundManager__13:playSound(l__GameSound__14.FORTIFY_BLOCK, v12);
	end;
end;
function v4.canHighlight(p14, p15)
	local v14 = p15;
	if v14 ~= nil then
		v14 = v14:GetAttribute("PlacedByUserId");
	end;
	if v14 ~= 0 and v14 == v14 and v14 and v14 ~= 0 then
		local v15 = false;
		if p15 ~= nil then
			v15 = false;
			if p15:GetAttribute("Fortified") ~= true then
				v15 = l__BuilderKit__7.getFortificationCost(p15.Name) ~= nil;
			end;
		end;
		return v15;
	end;
	return false;
end;
local l__AnimationUtil__15 = v2.AnimationUtil;
local l__GameAnimationUtil__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v4.fortifyBlock(p16, p17)
	l__AnimationUtil__15.playAnimation(l__Players__9.LocalPlayer, l__GameAnimationUtil__16.getAssetId(l__AnimationType__17.BUILDER_HAMMER_HIT), {
		fadeInTime = 0.02
	});
	p16:playFortifyEffect(l__Players__9.LocalPlayer, p17);
	v1.try(function()
		l__default__10.Client:Get("RemoteName"):SendToServer(p17);
	end, function(p18)
		warn("Failed block placement:", p18);
	end);
end;
local l__UserInputService__18 = v3.UserInputService;
local l__Workspace__19 = v3.Workspace;
local l__ContextActionService__20 = v3.ContextActionService;
function v4.enable(p19)
	p19.blockHighlighter:enable();
	p19.maid:GiveTask(function()
		p19.blockHighlighter:disable();
	end);
	p19.maid:GiveTask(l__UserInputService__18.TouchTapInWorld:Connect(function(p20, p21)
		if p21 then
			return nil;
		end;
		local v16 = l__ClientBlockEngine__4:getBlockSelector():getMouseInfo(l__BlockSelectorMode__5.SELECT, {
			ray = l__Workspace__19.CurrentCamera:ViewportPointToRay(p20.X, p20.Y)
		});
		local v17 = v16;
		if v17 ~= nil then
			v17 = v17.target;
		end;
		if v17 and p19:canHighlight(v16.target.blockInstance) and p19:hasEnoughMaterialsToUpgrade(v16.target.blockInstance.Name) then
			p19:fortifyBlock(v16.target.blockRef.blockPosition);
		end;
	end));
	l__ContextActionService__20:BindAction("fortify-block", function(p22, p23, p24)
		if p23 ~= Enum.UserInputState.Begin then
			return nil;
		end;
		local v18 = l__ClientBlockEngine__4:getBlockSelector():getMouseInfo(l__BlockSelectorMode__5.SELECT);
		local v19 = v18;
		if v19 ~= nil then
			v19 = v19.target;
		end;
		if v19 and p19:canHighlight(v18.target.blockInstance) and p19:hasEnoughMaterialsToUpgrade(v18.target.blockInstance.Name) then
			p19:fortifyBlock(v18.target.blockRef.blockPosition);
		end;
	end, false, Enum.UserInputType.MouseButton1);
	p19.maid:GiveTask(function()
		l__ContextActionService__20:UnbindAction("fortify-block");
	end);
end;
function v4.disable(p25)
	p25.maid:DoCleaning();
end;
return {
	BlockFortifier = v4
};
