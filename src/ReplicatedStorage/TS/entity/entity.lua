-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v3 = setmetatable({}, {
	__tostring = function()
		return "Entity";
	end
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local l__RunService__1 = v2.RunService;
function v3.constructor(p1, p2)
	p1.instance = p2;
	if l__RunService__1:IsServer() then
		local v5 = p1.instance:GetAttribute("CompletedSetup");
		if v5 == 0 or v5 ~= v5 or v5 == "" or not v5 then
			p1:onServerSetup();
			p1.instance:SetAttribute("CompletedSetup", true);
		end;
		local l__Health__6 = p1.instance:FindFirstChild("Health");
		if l__Health__6 then
			l__Health__6:Destroy();
		end;
	end;
end;
local l__Workspace__2 = v2.Workspace;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__ShieldType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shield", "shield-type").ShieldType;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__CollectionService__6 = v2.CollectionService;
function v3.onServerSetup(p3)
	p3.instance:SetAttribute("MaxHealth", 100);
	p3.instance:SetAttribute("Health", 100);
	p3.instance:SetAttribute("LastDamageTakenTime", 0);
	p3.instance:SetAttribute("SpawnTime", l__Workspace__2:GetServerTimeNow());
	p3.instance:SetAttribute("lastHitTime", 0);
	local v7, v8, v9 = ipairs(u3.values(l__ShieldType__4));
	while true do
		v7(v8, v9);
		if not v7 then
			break;
		end;
		v9 = v7;
		p3.instance:SetAttribute("Shield_" .. v8, 0);	
	end;
	task.spawn(function()
		if p3.instance:GetAttribute("NoNametag") == true then
			return nil;
		end;
		p3:setupNametag();
	end);
	task.spawn(function()
		local l__Humanoid__10 = p3.instance:WaitForChild("Humanoid", 10);
		if l__Humanoid__10 then
			u5("Animator", {
				Name = "Animator", 
				Parent = l__Humanoid__10
			});
		end;
	end);
	l__CollectionService__6:AddTag(p3.instance, "entity");
end;
function v3.getSpawnTime(p4)
	return p4.instance:GetAttribute("SpawnTime");
end;
function v3.getShield(p5, p6)
	local v11 = p5.instance:GetAttribute("Shield_" .. p6);
	if v11 == nil then
		v11 = 0;
	end;
	return v11;
end;
function v3.setShield(p7, p8, p9)
	p7.instance:SetAttribute("Shield_" .. p8, p9);
end;
function v3.onShieldChanged(p10, p11)
	return p10.instance:GetAttributeChangedSignal("Shield_" .. p11);
end;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "string-utils"));
function v3.getShields(p12)
	local v12 = {};
	local v13 = 0;
	local v14, v15, v16 = ipairs((u3.keys(p12.instance:GetAttributes())));
	while true do
		v14(v15, v16);
		if not v14 then
			break;
		end;
		if u7.includes(v15, "Shield_") then
			local v17 = v15;
		else
			v17 = nil;
		end;
		if v17 ~= nil then
			v13 = v13 + 1;
			v12[v13] = v17;
		end;	
	end;
	return v12;
end;
function v3.waitForSetupCompleted(p13)
	if p13.instance:GetAttribute("CompletedSetup") == true then
		return nil;
	end;
	p13.instance:GetAttributeChangedSignal("CompletedSetup"):Wait();
end;
function v3.hideDisplayName(p14)
	local l__Nametag__18 = p14.instance:WaitForChild("Head"):WaitForChild("Nametag");
	local l__DisplayNameContainer__19 = l__Nametag__18:WaitForChild("DisplayNameContainer");
	l__DisplayNameContainer__19.Visible = false;
	l__DisplayNameContainer__19:WaitForChild("DisplayName").Visible = false;
	local l__TeamIndicator__20 = l__Nametag__18:FindFirstChild("TeamIndicator");
	if l__TeamIndicator__20 then
		l__TeamIndicator__20.Visible = false;
	end;
	local v21 = l__DisplayNameContainer__19:FindFirstChildWhichIsA("UIStroke");
	if v21 then
		v21.Enabled = false;
	end;
end;
function v3.showDisplayName(p15)
	local l__Nametag__22 = p15.instance:WaitForChild("Head"):WaitForChild("Nametag");
	local l__DisplayNameContainer__23 = l__Nametag__22:WaitForChild("DisplayNameContainer");
	l__DisplayNameContainer__23.Visible = true;
	l__DisplayNameContainer__23:WaitForChild("DisplayName").Visible = true;
	local l__TeamIndicator__24 = l__Nametag__22:FindFirstChild("TeamIndicator");
	if l__TeamIndicator__24 then
		l__TeamIndicator__24.Visible = true;
	end;
	local v25 = l__DisplayNameContainer__23:FindFirstChildWhichIsA("UIStroke");
	if v25 then
		v25.Enabled = false;
	end;
end;
function v3.setNametag(p16, p17)
	p16.instance:WaitForChild("Head"):WaitForChild("Nametag"):WaitForChild("DisplayNameContainer"):WaitForChild("DisplayName").Text = p17;
end;
function v3.setNametagBorderColor(p18, p19)
	local l__Stroke__26 = p18.instance:WaitForChild("Head"):WaitForChild("Nametag"):WaitForChild("DisplayNameContainer"):WaitForChild("Stroke");
	l__Stroke__26.Color = p19;
	l__Stroke__26.Transparency = 0;
end;
function v3.hideNametag(p20)
	p20.instance:WaitForChild("Head"):WaitForChild("Nametag").Enabled = false;
end;
function v3.showNametag(p21)
	p21.instance:WaitForChild("Head"):WaitForChild("Nametag").Enabled = true;
end;
function v3.centerNameTag(p22)
	u5("UIListLayout", {
		FillDirection = Enum.FillDirection.Horizontal, 
		HorizontalAlignment = Enum.HorizontalAlignment.Center, 
		VerticalAlignment = Enum.VerticalAlignment.Center, 
		SortOrder = Enum.SortOrder.LayoutOrder, 
		Padding = UDim.new(0, 10)
	}).Parent = p22.instance:WaitForChild("Head"):WaitForChild("Nametag");
end;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__NameTag__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "nametag", "nametag").NameTag;
function v3.setupNametag(p23)
	local v27 = p23:getHumanoid();
	if v27 then
		v27.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
	end;
	if not p23.instance:IsDescendantOf(l__Workspace__2) then
		p23.instance.AncestryChanged:Wait();
	end;
	u8.mount(u8.createElement(l__NameTag__9, {
		EntityInstance = p23.instance
	}), p23.instance:WaitForChild("Head"), "Nametag");
end;
function v3.getHealth(p24)
	return p24.instance:GetAttribute("Health");
end;
function v3.setHealth(p25, p26)
	p25.instance:SetAttribute("Health", p26);
	local v28 = p25:getHumanoid();
	if v28 then
		v28.Health = p26;
	end;
end;
function v3.getlastHitTime(p27)
	return p27.instance:GetAttribute("lastHitTime");
end;
function v3.setlastHitTime(p28, p29)
	p28.instance:SetAttribute("lastHitTime", p29);
end;
function v3.getMaxHealth(p30)
	return p30.instance:GetAttribute("MaxHealth");
end;
function v3.setMaxHealth(p31, p32)
	p31.instance:SetAttribute("MaxHealth", p32);
end;
function v3.getLastDamageTakenTime(p33)
	return p33.instance:GetAttribute("LastDamageTakenTime");
end;
function v3.getLastDamageTakenTimeTrue(p34)
	local v29 = p34.instance:GetAttribute("LastDamageTakenTimeTrue");
	if v29 == nil then
		v29 = 0;
	end;
	return v29;
end;
function v3.setLastDamageTakenTime(p35, p36)
	p35.instance:SetAttribute("LastDamageTakenTime", p36);
end;
function v3.kill(p37)
	local v30 = p37:getHumanoid();
	if v30 then
		v30.Health = 0;
	end;
end;
function v3.getInstance(p38)
	return p38.instance;
end;
function v3.isStreamedIn(p39)
	if p39.instance.Parent ~= nil then
		return true;
	end;
	return false;
end;
function v3.getAnimator(p40)
	local v31 = p40.instance:WaitForChild("Humanoid", 10);
	if v31 ~= nil then
		v31 = v31:WaitForChild("Animator");
	end;
	return v31;
end;
local l__GameAnimationUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
function v3.playAnimation(p41, p42, p43)
	local v32 = p41:getAnimator();
	if not v32 then
		return nil;
	end;
	local v33 = v32:LoadAnimation(l__GameAnimationUtil__10.getAnimation(p42));
	local v34 = p43;
	if v34 ~= nil then
		v34 = v34.looped;
	end;
	if v34 ~= nil then
		v33.Looped = p43.looped;
	end;
	v33:Play();
end;
function v3.getHumanoid(p44)
	return p44.instance:FindFirstChild("Humanoid");
end;
function v3.isAlive(p45)
	local v35 = p45:getHumanoid();
	if v35 == nil or v35.Parent == nil or v35.Health <= 0 then
		return false;
	end;
	if p45:getHealth() <= 0 then
		return false;
	end;
	return true;
end;
function v3.isDead(p46)
	return not p46:isAlive();
end;
function v3.canAttack(p47, p48)
	if p48:getInstance() == p47.instance then
		return false;
	end;
	return true;
end;
local l__Players__11 = v2.Players;
function v3.isLocalPlayer(p49)
	local v36 = l__Players__11.LocalPlayer;
	if v36 ~= nil then
		v36 = v36.Character;
	end;
	return v36 == p49.instance;
end;
return {
	Entity = v3
};
