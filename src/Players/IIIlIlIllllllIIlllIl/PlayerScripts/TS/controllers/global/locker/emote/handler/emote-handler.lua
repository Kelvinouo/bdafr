-- Decompiled with the Synapse X Luau decompiler.

return {
	EmoteHandler = {
		constructor = function(p1)

		end, 
		enable = function(p2, p3, p4, p5)
			if not p4.PrimaryPart then
				return nil;
			end;
			p2:onEnable(p3, p4, p5);
		end, 
		disable = function(p6, p7, p8, p9)
			if not p8.PrimaryPart then
				return nil;
			end;
			p6:onDisable(p7, p8, p9);
		end
	}
};
