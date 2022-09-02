-- Decompiled with the Synapse X Luau decompiler.

return function(p1, p2, p3, p4)
	local v1 = Instance.new("Attachment");
	v1.Position = Vector3.new(0, p2, 0);
	v1.Parent = p1;
	local v2 = Instance.new("Attachment");
	v2.Position = Vector3.new(0, -p2, 0);
	v2.Parent = p1;
	local v3 = Instance.new("Trail");
	v3.FaceCamera = true;
	v3.LightInfluence = false;
	v3.Lifetime = 0.55;
	v3.Attachment0 = v1;
	v3.Attachment1 = v2;
	v3.Brightness = 5;
	v3.Color = ColorSequence.new(p3 or Color3.fromRGB(108, 168, 255));
	v3.WidthScale = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 1), NumberSequenceKeypoint.new(1, 0) });
	v3.Transparency = NumberSequence.new(p4);
	v3.Parent = p1;
	return v3;
end;
