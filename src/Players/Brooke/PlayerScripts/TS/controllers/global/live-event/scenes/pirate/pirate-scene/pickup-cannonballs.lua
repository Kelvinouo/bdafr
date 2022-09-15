-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "plasma").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v4 = {
	name = "pickup cannonballs", 
	event = "Heartbeat"
};
local l__PirateSceneTimestamps__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;
local l__CollectionService__2 = v3.CollectionService;
local l__create__3 = v2.create;
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Players__5 = v3.Players;
local l__default__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__ItemType__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v4.func(p1, p2, p3)
	if p1.elapsedEventTime < l__PirateSceneTimestamps__1.ShipReappears then
		return nil;
	end;
	local v5, v6, v7 = ipairs(l__CollectionService__2:GetTagged("CannonballSource"));
	while true do
		v5(v6, v7);
		if not v5 then
			break;
		end;
		v7 = v5;
		if v6:IsA("Model") and v6.PrimaryPart then
			v2.portal(v6.PrimaryPart, function()
				v2.useInstance(function(p4)
					local v8 = l__create__3("ProximityPrompt", {
						ActionText = "Collect", 
						ObjectText = "", 
						HoldDuration = 1, 
						KeyboardKeyCode = l__Theme__4.promptKeyboardKey, 
						RequiresLineOfSight = false, 
						Enabled = true, 
						MaxActivationDistance = 8, 
						Triggered = function(p5)
							if p5 == l__Players__5.LocalPlayer then
								l__default__6.Client:GetNamespace("PirateSceneRemotes"):Get("PickupCannonball"):SendToServer({
									model = v6
								});
							end;
						end
					});
					p4.instance = v8;
					return v8;
				end);
			end);
		end;	
	end;
	local v9 = l__ClientStore__7:getState().Inventory.observedInventory.inventory.hand;
	if v9 ~= nil then
		v9 = v9.itemType;
	end;
	if v9 == l__ItemType__8.CANNON_BALL then
		local v10, v11, v12 = ipairs(l__CollectionService__2:GetTagged("LobbyCannon"));
		while true do
			v10(v11, v12);
			if not v10 then
				break;
			end;
			v12 = v10;
			if v11:IsA("Model") and v11.PrimaryPart then
				v2.portal(v11.PrimaryPart, function()
					v2.useInstance(function(p6)
						local v13 = l__create__3("ProximityPrompt", {
							ActionText = "Insert", 
							ObjectText = "", 
							HoldDuration = 1, 
							KeyboardKeyCode = l__Theme__4.promptKeyboardKey, 
							RequiresLineOfSight = false, 
							Enabled = true, 
							MaxActivationDistance = 8, 
							Triggered = function(p7)
								if p7 == l__Players__5.LocalPlayer then
									l__default__6.Client:GetNamespace("PirateSceneRemotes"):Get("InsertCannonball"):SendToServer({
										cannon = v11
									});
								end;
							end
						});
						p6.instance = v13;
						return v13;
					end);
				end);
			end;		
		end;
	end;
end;
return {
	PickupCannonballs = v4
};
