-- Script Hash: 0c88eb332108baab9ccea225cfcff6701dec6af0be17abfffaf9fd846830c460529a215e062a4f9594bb6887f43a30a4
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
