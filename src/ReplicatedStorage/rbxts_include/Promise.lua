--[[VARIABLE DEFINITION ANOMALY DETECTED, DECOMPILATION OUTPUT POTENTIALLY INCORRECT]]--
-- Decompiled with the Synapse X Luau decompiler.

local function v1(p1, p2)
	local v2 = {};
	for v3, v4 in ipairs(p2) do
		v2[v4] = v4;
	end;
	local v5 = {};
	function v5.__index(p3, p4)
		error(string.format("%s is not in %s!", p4, p1), 2);
	end;
	function v5.__newindex()
		error(string.format("Creating new members in %s is not allowed!", p1), 2);
	end;
	return setmetatable(v2, v5);
end;
local v6 = {
	Kind = v1("Promise.Error.Kind", { "ExecutionError", "AlreadyCancelled", "NotResolvedInTime", "TimedOut" })
};
v6.__index = v6;
function v6.new(p5, p6)
	p5 = p5 or {};
	return setmetatable({
		error = tostring(p5.error) and "[This error has no error text.]", 
		trace = p5.trace, 
		context = p5.context, 
		kind = p5.kind, 
		parent = p6, 
		createdTick = os.clock(), 
		createdTrace = debug.traceback()
	}, v6);
end;
function v6.is(p7)
	local v7 = nil;
	if type(p7) == "table" then
		v7 = getmetatable(p7);
		if type(v7) ~= "table" then
			return false;
		end;
	else
		return false;
	end;
	local v8 = false;
	if rawget(p7, "error") ~= nil then
		v8 = type(rawget(v7, "extend")) == "function";
	end;
	return v8;
end;
function v6.isKind(p8, p9)
	assert(p9 ~= nil, "Argument #2 to Promise.Error.isKind must not be nil");
	return v6.is(p8) and p8.kind == p9;
end;
function v6.extend(p10, p11)
	p11 = p11 or {};
	p11.kind = p11.kind or p10.kind;
	return v6.new(p11, p10);
end;
function v6.getErrorChain(p12)
	local v9 = { p12 };
	while v9[#v9].parent do
		table.insert(v9, v9[#v9].parent);	
	end;
	return v9;
end;
function v6.__tostring(p13)
	local v10 = { string.format("-- Promise.Error(%s) --", p13.kind and "?") };
	for v11, v12 in ipairs(p13:getErrorChain()) do
		table.insert(v10, table.concat({ v12.trace or v12.error, v12.context }, "\n"));
	end;
	return table.concat(v10, "\n");
end;
local function u1(p14, ...)
	return p14, select("#", ...), { ... };
end;
local function u2(p15, p16, ...)
	assert(p15 ~= nil, "traceback is nil");
	return u1(xpcall(p16, function(p17)
		if type(p17) == "table" then
			return p17;
		end;
		return v6.new({
			error = p17, 
			kind = v6.Kind.ExecutionError, 
			trace = debug.traceback(tostring(p17), 2), 
			context = "Promise created at:\n\n" .. p15
		});
	end, ...));
end;
local v13 = {
	Error = v6, 
	Status = v1("Promise.Status", { "Started", "Resolved", "Rejected", "Cancelled" }), 
	_getTime = os.clock, 
	_timeEvent = game:GetService("RunService").Heartbeat, 
	_unhandledRejectionCallbacks = {}, 
	prototype = {}
};
v13.__index = v13.prototype;
local u3 = {
	__mode = "k"
};
function v13._new(p18, p19, p20)
	if p20 ~= nil and not v13.is(p20) then
		error("Argument #2 to Promise.new must be a promise or nil", 2);
	end;
	local v14 = {
		_source = p18, 
		_status = v13.Status.Started, 
		_values = nil, 
		_valuesLength = -1, 
		_unhandledRejection = true, 
		_queuedResolve = {}, 
		_queuedReject = {}, 
		_queuedFinally = {}, 
		_cancellationHook = nil, 
		_parent = p20, 
		_consumers = setmetatable({}, u3)
	};
	if p20 and p20._status == v13.Status.Started then
		p20._consumers[v14] = true;
	end;
	setmetatable(v14, v13);
	local function u4(...)
		v14:_resolve(...);
	end;
	local function u5(...)
		v14:_reject(...);
	end;
	local function u6(p21)
		if p21 then
			if v14._status == v13.Status.Cancelled then
				p21();
			else
				v14._cancellationHook = p21;
			end;
		end;
		return v14._status == v13.Status.Cancelled;
	end;
	coroutine.wrap(function()
		local v15, v16, v17 = u2(v14._source, p19, u4, u5, u6);
		if not v15 then
			u5(v17[1]);
		end;
	end)();
	return v14;
end;
function v13.new(p22)
	return v13._new(debug.traceback(nil, 2), p22);
end;
function v13.__tostring(p23)
	return string.format("Promise(%s)", p23._status);
end;
function v13.defer(p24)
	local v18 = debug.traceback(nil, 2);
	return v13._new(v18, function(p25, p26, p27)
		local u7 = nil;
		u7 = v13._timeEvent:Connect(function()
			u7:Disconnect();
			local v19, v20, v21 = u2(v18, p24, p25, p26, p27);
			if not v19 then
				p26(v21[1]);
			end;
		end);
	end);
end;
v13.async = v13.defer;
local function u8(...)
	return select("#", ...), { ... };
end;
function v13.resolve(...)
	local v22, v23 = u8(...);
	return v13._new(debug.traceback(nil, 2), function(p28)
		p28(unpack(v23, 1, v22));
	end);
end;
function v13.reject(...)
	local v24, v25 = u8(...);
	return v13._new(debug.traceback(nil, 2), function(p29, p30)
		p30(unpack(v25, 1, v24));
	end);
end;
function v13._try(p31, p32, ...)
	local v26, v27 = u8(...);
	return v13._new(p31, function(p33)
		p33(p32(unpack(v27, 1, v26)));
	end);
end;
function v13.try(p34, ...)
	return v13._try(debug.traceback(nil, 2), p34, ...);
end;
function v13._all(p35, p36, p37)
	if type(p36) ~= "table" then
		error(string.format("Please pass a list of promises to %s", "Promise.all"), 3);
	end;
	for v28, v29 in pairs(p36) do
		if not v13.is(v29) then
			error(string.format("Non-promise value passed into %s at index %s", "Promise.all", tostring(v28)), 3);
		end;
	end;
	if #p36 ~= 0 and p37 ~= 0 then
		return v13._new(p35, function(p38, p39, p40)
			local v30 = 0;
			local u9 = {};
			local u10 = false;
			local u11 = 0;
			local u12 = {};
			local function v31(p41, ...)
				if u10 then
					return;
				end;
				u11 = u11 + 1;
				if p37 == nil then
					u12[p41] = ...;
				else
					u12[u11] = ...;
				end;
				if (p37 or #p36) <= u11 then
					u10 = true;
					p38(u12);
					for v32, v33 in ipairs(u9) do
						v33:cancel();
					end;
				end;
			end;
			p40(function()
				for v34, v35 in ipairs(u9) do
					v35:cancel();
				end;
			end);
			for v36, v37 in ipairs(p36) do
				local u13 = v30;
				u9[v36] = v37:andThen(function(...)
					v31(v36, ...);
				end, function(...)
					u13 = u13 + 1;
					if p37 == nil or #p36 - u13 < p37 then
						for v38, v39 in ipairs(u9) do
							v39:cancel();
						end;
						u10 = true;
						p39(...);
					end;
				end);
			end;
			if u10 then
				for v40, v41 in ipairs(u9) do
					v41:cancel();
				end;
			end;
		end);
	end;
	return v13.resolve({});
end;
function v13.all(p42)
	return v13._all(debug.traceback(nil, 2), p42);
end;
local function u14(p43)
	if type(p43) == "function" then
		return true;
	end;
	if type(p43) == "table" then
		local v42 = getmetatable(p43);
		if v42 and type(rawget(v42, "__call")) == "function" then
			return true;
		end;
	end;
	return false;
end;
function v13.fold(p44, p45, p46)
	assert(type(p44) == "table", "Bad argument #1 to Promise.fold: must be a table");
	assert(u14(p45), "Bad argument #2 to Promise.fold: must be a function");
	local u15 = v13.resolve(p46);
	return v13.each(p44, function(p47, p48)
		u15 = u15:andThen(function(p49)
			return p45(p49, p47, p48);
		end);
	end):andThen(function()
		return u15;
	end);
end;
function v13.some(p50, p51)
	assert(type(p51) == "number", "Bad argument #2 to Promise.some: must be a number");
	return v13._all(debug.traceback(nil, 2), p50, p51);
end;
function v13.any(p52)
	return v13._all(debug.traceback(nil, 2), p52, 1):andThen(function(p53)
		return p53[1];
	end);
end;
function v13.allSettled(p54)
	if type(p54) ~= "table" then
		error(string.format("Please pass a list of promises to %s", "Promise.allSettled"), 2);
	end;
	for v43, v44 in pairs(p54) do
		if not v13.is(v44) then
			error(string.format("Non-promise value passed into %s at index %s", "Promise.allSettled", tostring(v43)), 2);
		end;
	end;
	if #p54 == 0 then
		return v13.resolve({});
	end;
	return v13._new(debug.traceback(nil, 2), function(p55, p56, p57)
		local u16 = 0;
		local u17 = {};
		local function v45(p58, ...)
			u16 = u16 + 1;
			u17[p58] = ...;
			if #p54 <= u16 then
				p55(u17);
			end;
		end;
		local u18 = {};
		p57(function()
			for v46, v47 in ipairs(u18) do
				v47:cancel();
			end;
		end);
		for v48, v49 in ipairs(p54) do
			u18[v48] = v49:finally(function(...)
				v45(v48, ...);
			end);
		end;
	end);
end;
function v13.race(p59)
	assert(type(p59) == "table", string.format("Please pass a list of promises to %s", "Promise.race"));
	for v50, v51 in pairs(p59) do
		assert(v13.is(v51), string.format("Non-promise value passed into %s at index %s", "Promise.race", tostring(v50)));
	end;
	return v13._new(debug.traceback(nil, 2), function(p60, p61, p62)
		local u19 = {};
		local u20 = false;
		if p62(function(...)
			for v52, v53 in ipairs(u19) do
				v53:cancel();
			end;
			u20 = true;
			return p61(...);
		end) then
			return;
		end;
		for v54, v55 in ipairs(p59) do
			u19[v54] = v55:andThen(function(...)
				for v56, v57 in ipairs(u19) do
					v57:cancel();
				end;
				u20 = true;
				return p60(...);
			end, function(...)
				for v58, v59 in ipairs(u19) do
					v59:cancel();
				end;
				u20 = true;
				return p61(...);
			end);
		end;
		if u20 then
			for v60, v61 in ipairs(u19) do
				v61:cancel();
			end;
		end;
	end);
end;
function v13.each(p63, p64)
	assert(type(p63) == "table", string.format("Please pass a list of promises to %s", "Promise.each"));
	assert(u14(p64), string.format("Please pass a handler function to %s!", "Promise.each"));
	return v13._new(debug.traceback(nil, 2), function(p65, p66, p67)
		local v62 = {};
		local u21 = {};
		local u22 = false;
		p67(function()
			u22 = true;
			for v63, v64 in ipairs(u21) do
				v64:cancel();
			end;
		end);
		local v65 = {};
		for v66, v67 in ipairs(p63) do
			if v13.is(v67) then
				if v67:getStatus() == v13.Status.Cancelled then
					for v68, v69 in ipairs(u21) do
						v69:cancel();
					end;
					return p66(v6.new({
						error = "Promise is cancelled", 
						kind = v6.Kind.AlreadyCancelled, 
						context = string.format("The Promise that was part of the array at index %d passed into Promise.each was already cancelled when Promise.each began.\n\nThat Promise was created at:\n\n%s", v66, v67._source)
					}));
				end;
				if v67:getStatus() == v13.Status.Rejected then
					for v70, v71 in ipairs(u21) do
						v71:cancel();
					end;
					return p66(select(2, v67:await()));
				end;
				local v72 = v67:andThen(function(...)
					return ...;
				end);
				table.insert(u21, v72);
				v65[v66] = v72;
			else
				v65[v66] = v67;
			end;
		end;
		for v73, v74 in ipairs(v65) do
			if v13.is(local v75) then
				local v76, v74 = v75:await();
				if not v76 then
					for v77, v78 in ipairs(u21) do
						v78:cancel();
					end;
					return p66(v74);
				end;
			end;
			if u22 then
				return;
			end;
			local v79 = v13.resolve(p64(v74, v73));
			table.insert(u21, v79);
			local v80, v81 = v79:await();
			if not v80 then
				for v82, v83 in ipairs(u21) do
					v83:cancel();
				end;
				return p66(v81);
			end;
			v62[v73] = v81;
		end;
		p65(v62);
	end);
end;
function v13.is(p68)
	if type(p68) ~= "table" then
		return false;
	end;
	local v84 = getmetatable(p68);
	if v84 == v13 then
		return true;
	end;
	if v84 == nil then
		return u14(p68.andThen);
	end;
	if type(v84) == "table" and type(rawget(v84, "__index")) == "table" and u14(rawget(rawget(v84, "__index"), "andThen")) then
		return true;
	end;
	return false;
end;
function v13.promisify(p69)
	return function(...)
		return v13._try(debug.traceback(nil, 2), p69, ...);
	end;
end;
local u23 = nil;
local u24 = nil;
function v13.delay(p70)
	assert(type(p70) == "number", "Bad argument #1 to Promise.delay, must be a number.");
	if not (p70 >= 0.016666666666666666) or p70 == math.huge then
		p70 = 0.016666666666666666;
	end;
	return v13._new(debug.traceback(nil, 2), function(p71, p72, p73)
		local v85 = v13._getTime();
		local v86 = v85 + p70;
		local v87 = {
			resolve = p71, 
			startTime = v85, 
			endTime = v86
		};
		if u23 == nil then
			u24 = v87;
			u23 = v13._timeEvent:Connect(function()
				while u24 ~= nil and u24.endTime < v13._getTime() do
					u24 = u24.next;
					if u24 == nil then
						u23:Disconnect();
						u23 = nil;
					else
						u24.previous = nil;
					end;
					u24.resolve(v13._getTime() - u24.startTime);				
				end;
			end);
		elseif u24.endTime < v86 then
			local v88 = u24;
			local v89 = v88.next;
			while v89 ~= nil and v89.endTime < v86 do
				v88 = v89;
				v89 = v88.next;			
			end;
			v88.next = v87;
			v87.previous = v88;
			if v89 ~= nil then
				v87.next = v89;
				v89.previous = v87;
			end;
		else
			v87.next = u24;
			u24.previous = v87;
			u24 = v87;
		end;
		p73(function()
			local l__next__90 = v87.next;
			if u24 ~= v87 then
				local l__previous__91 = v87.previous;
				l__previous__91.next = l__next__90;
				if l__next__90 ~= nil then
					l__next__90.previous = l__previous__91;
				end;
				return;
			end;
			if l__next__90 == nil then
				u23:Disconnect();
				u23 = nil;
			else
				l__next__90.previous = nil;
			end;
			u24 = l__next__90;
		end);
	end);
end;
v13.prototype.timeout = function(p74, p75, p76)
	local v92 = {};
	local u25 = debug.traceback(nil, 2);
	v92[1] = v13.delay(p75):andThen(function()
		if p76 == nil then
			local v93 = v6.new({
				kind = v6.Kind.TimedOut, 
				error = "Timed out", 
				context = string.format("Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s", p75, u25)
			}) or p76;
		else
			v93 = p76;
		end;
		return v13.reject(v93);
	end);
	v92[2] = p74;
	return v13.race(v92);
end;
v13.prototype.getStatus = function(p77)
	return p77._status;
end;
v13.prototype._andThen = function(p78, p79, p80, p81)
	p78._unhandledRejection = false;
	return v13._new(p79, function(p82, p83)
		local v94 = p82;
		if p80 then
			v94 = function(...)
				local v95 = nil;
				local v96 = nil;
				local v97 = nil;
				v96, v97, v95 = u2(p79, p80, ...);
				if not v96 then
					p83(v95[1]);
					return;
				end;
				p82(unpack(v95, 1, v97));
			end;
		end;
		local v98 = p83;
		if p81 then
			v98 = function(...)
				local v99 = nil;
				local v100 = nil;
				local v101 = nil;
				v100, v101, v99 = u2(p79, p81, ...);
				if not v100 then
					p83(v99[1]);
					return;
				end;
				p82(unpack(v99, 1, v101));
			end;
		end;
		if p78._status == v13.Status.Started then
			table.insert(p78._queuedResolve, v94);
			table.insert(p78._queuedReject, v98);
			return;
		end;
		if p78._status == v13.Status.Resolved then
			v94(unpack(p78._values, 1, p78._valuesLength));
			return;
		end;
		if p78._status == v13.Status.Rejected then
			v98(unpack(p78._values, 1, p78._valuesLength));
			return;
		end;
		if p78._status == v13.Status.Cancelled then
			p83(v6.new({
				error = "Promise is cancelled", 
				kind = v6.Kind.AlreadyCancelled, 
				context = "Promise created at\n\n" .. p79
			}));
		end;
	end, p78);
end;
v13.prototype.andThen = function(p84, p85, p86)
	local v102 = true;
	if p85 ~= nil then
		v102 = u14(p85);
	end;
	assert(v102, string.format("Please pass a handler function to %s!", "Promise:andThen"));
	local v103 = true;
	if p86 ~= nil then
		v103 = u14(p86);
	end;
	assert(v103, string.format("Please pass a handler function to %s!", "Promise:andThen"));
	return p84:_andThen(debug.traceback(nil, 2), p85, p86);
end;
v13.prototype.catch = function(p87, p88)
	local v104 = true;
	if p88 ~= nil then
		v104 = u14(p88);
	end;
	assert(v104, string.format("Please pass a handler function to %s!", "Promise:catch"));
	return p87:_andThen(debug.traceback(nil, 2), nil, p88);
end;
v13.prototype.tap = function(p89, p90)
	assert(u14(p90), string.format("Please pass a handler function to %s!", "Promise:tap"));
	return p89:_andThen(debug.traceback(nil, 2), function(...)
		local v105 = p90(...);
		if not v13.is(v105) then
			return ...;
		end;
		local v106, v107 = u8(...);
		return v105:andThen(function()
			return unpack(v107, 1, v106);
		end);
	end);
end;
v13.prototype.andThenCall = function(p91, p92, ...)
	assert(u14(p92), string.format("Please pass a handler function to %s!", "Promise:andThenCall"));
	local v108, v109 = u8(...);
	return p91:_andThen(debug.traceback(nil, 2), function()
		return p92(unpack(v109, 1, v108));
	end);
end;
v13.prototype.andThenReturn = function(p93, ...)
	local v110, v111 = u8(...);
	return p93:_andThen(debug.traceback(nil, 2), function()
		return unpack(v111, 1, v110);
	end);
end;
v13.prototype.cancel = function(p94)
	if p94._status ~= v13.Status.Started then
		return;
	end;
	p94._status = v13.Status.Cancelled;
	if p94._cancellationHook then
		p94._cancellationHook();
	end;
	if p94._parent then
		p94._parent:_consumerCancelled(p94);
	end;
	for v112 in pairs(p94._consumers) do
		v112:cancel();
	end;
	p94:_finalize();
end;
v13.prototype._consumerCancelled = function(p95, p96)
	if p95._status ~= v13.Status.Started then
		return;
	end;
	p95._consumers[p96] = nil;
	if next(p95._consumers) == nil then
		p95:cancel();
	end;
end;
v13.prototype._finally = function(p97, p98, p99, p100)
	if not p100 then
		p97._unhandledRejection = false;
	end;
	return v13._new(p98, function(p101, p102)
		local v113 = p101;
		if p99 then
			v113 = function(...)
				local v114 = nil;
				local v115 = nil;
				local v116 = nil;
				v115, v116, v114 = u2(p98, p99, ...);
				if not v115 then
					p102(v114[1]);
					return;
				end;
				p101(unpack(v114, 1, v116));
			end;
		end;
		if p100 then
			v113 = function(...)
				if p97._status == v13.Status.Rejected then
					return p101(p97);
				end;
				return v113(...);
			end;
		end;
		if p97._status == v13.Status.Started then
			table.insert(p97._queuedFinally, v113);
			return;
		end;
		v113(p97._status);
	end, p97);
end;
v13.prototype.finally = function(p103, p104)
	local v117 = true;
	if p104 ~= nil then
		v117 = u14(p104);
	end;
	assert(v117, string.format("Please pass a handler function to %s!", "Promise:finally"));
	return p103:_finally(debug.traceback(nil, 2), p104);
end;
v13.prototype.finallyCall = function(p105, p106, ...)
	assert(u14(p106), string.format("Please pass a handler function to %s!", "Promise:finallyCall"));
	local v118, v119 = u8(...);
	return p105:_finally(debug.traceback(nil, 2), function()
		return p106(unpack(v119, 1, v118));
	end);
end;
v13.prototype.finallyReturn = function(p107, ...)
	local v120, v121 = u8(...);
	return p107:_finally(debug.traceback(nil, 2), function()
		return unpack(v121, 1, v120);
	end);
end;
v13.prototype.done = function(p108, p109)
	local v122 = true;
	if p109 ~= nil then
		v122 = u14(p109);
	end;
	assert(v122, string.format("Please pass a handler function to %s!", "Promise:done"));
	return p108:_finally(debug.traceback(nil, 2), p109, true);
end;
v13.prototype.doneCall = function(p110, p111, ...)
	assert(u14(p111), string.format("Please pass a handler function to %s!", "Promise:doneCall"));
	local v123, v124 = u8(...);
	return p110:_finally(debug.traceback(nil, 2), function()
		return p111(unpack(v124, 1, v123));
	end, true);
end;
v13.prototype.doneReturn = function(p112, ...)
	local v125, v126 = u8(...);
	return p112:_finally(debug.traceback(nil, 2), function()
		return unpack(v126, 1, v125);
	end, true);
end;
v13.prototype.awaitStatus = function(p113)
	p113._unhandledRejection = false;
	if p113._status == v13.Status.Started then
		local u26 = Instance.new("BindableEvent");
		p113:finally(function()
			u26:Fire();
		end);
		u26.Event:Wait();
		u26:Destroy();
	end;
	if p113._status == v13.Status.Resolved then
		return p113._status, unpack(p113._values, 1, p113._valuesLength);
	end;
	if p113._status ~= v13.Status.Rejected then
		return p113._status;
	end;
	return p113._status, unpack(p113._values, 1, p113._valuesLength);
end;
local function u27(p114, ...)
	return p114 == v13.Status.Resolved, ...;
end;
v13.prototype.await = function(p115)
	return u27(p115:awaitStatus());
end;
local function u28(p116, ...)
	if p116 ~= v13.Status.Resolved then
		if ... == nil then
			local v127 = "Expected Promise rejected with no value.";
		else
			v127 = ...;
		end;
		error(v127, 3);
	end;
	return ...;
end;
v13.prototype.expect = function(p117)
	return u28(p117:awaitStatus());
end;
v13.prototype.awaitValue = v13.prototype.expect;
v13.prototype._unwrap = function(p118)
	if p118._status == v13.Status.Started then
		error("Promise has not resolved or rejected.", 2);
	end;
	return p118._status == v13.Status.Resolved, unpack(p118._values, 1, p118._valuesLength);
end;
v13.prototype._resolve = function(p119, ...)
	if p119._status ~= v13.Status.Started then
		if v13.is((...)) then
			(...):_consumerCancelled(p119);
		end;
		return;
	end;
	if not v13.is((...)) then
		p119._status = v13.Status.Resolved;
		local v128, v129 = u8(...);
		p119._valuesLength = v128;
		p119._values = v129;
		for v130, v131 in ipairs(p119._queuedResolve) do
			coroutine.wrap(v131)(...);
		end;
		p119:_finalize();
		return;
	end;
	if select("#", ...) > 1 then
		warn((string.format("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s", p119._source)));
	end;
	local u29 = ...;
	local v132 = u29:andThen(function(...)
		p119:_resolve(...);
	end, function(...)
		local v133 = u29._values[1];
		if u29._error then
			v133 = v6.new({
				error = u29._error, 
				kind = v6.Kind.ExecutionError, 
				context = "[No stack trace available as this Promise originated from an older version of the Promise library (< v2)]"
			});
		end;
		if not v6.isKind(v133, v6.Kind.ExecutionError) then
			p119:_reject(...);
			return;
		end;
		return p119:_reject(v133:extend({
			error = "This Promise was chained to a Promise that errored.", 
			trace = "", 
			context = string.format("The Promise at:\n\n%s\n...Rejected because it was chained to the following Promise, which encountered an error:\n", p119._source)
		}));
	end);
	if v132._status == v13.Status.Cancelled then
		p119:cancel();
		return;
	end;
	if v132._status == v13.Status.Started then
		p119._parent = v132;
		v132._consumers[p119] = true;
	end;
end;
v13.prototype._reject = function(p120, ...)
	if p120._status ~= v13.Status.Started then
		return;
	end;
	p120._status = v13.Status.Rejected;
	local v134, v135 = u8(...);
	p120._valuesLength = v134;
	p120._values = v135;
	if next(p120._queuedReject) ~= nil then
		for v136, v137 in ipairs(p120._queuedReject) do
			coroutine.wrap(v137)(...);
		end;
	else
		local u30 = tostring((...));
		coroutine.wrap(function()
			v13._timeEvent:Wait();
			if not p120._unhandledRejection then
				return;
			end;
			for v138, v139 in ipairs(v13._unhandledRejectionCallbacks) do
				task.spawn(v139, p120, unpack(p120._values, 1, p120._valuesLength));
			end;
			if v13.TEST then
				return;
			end;
			warn((string.format("Unhandled Promise rejection:\n\n%s\n\n%s", u30, p120._source)));
		end)();
	end;
	p120:_finalize();
end;
v13.prototype._finalize = function(p121)
	for v140, v141 in ipairs(p121._queuedFinally) do
		coroutine.wrap(v141)(p121._status);
	end;
	p121._queuedFinally = nil;
	p121._queuedReject = nil;
	p121._queuedResolve = nil;
	if not v13.TEST then
		p121._parent = nil;
		p121._consumers = nil;
	end;
end;
v13.prototype.now = function(p122, p123)
	local v142 = nil;
	v142 = debug.traceback(nil, 2);
	if p122._status == v13.Status.Resolved then
		return p122:_andThen(v142, function(...)
			return ...;
		end);
	end;
	if p123 == nil then
		local v143 = v6.new({
			kind = v6.Kind.NotResolvedInTime, 
			error = "This Promise was not resolved in time for :now()", 
			context = ":now() was called at:\n\n" .. v142
		}) or p123;
	else
		v143 = p123;
	end;
	return v13.reject(v143);
end;
function v13.retry(p124, p125, ...)
	assert(u14(p124), "Parameter #1 to Promise.retry must be a function");
	assert(type(p125) == "number", "Parameter #2 to Promise.retry must be a number");
	local u31 = { ... };
	local u32 = select("#", ...);
	return v13.resolve(p124(...)):catch(function(...)
		if not (p125 > 0) then
			return v13.reject(...);
		end;
		return v13.retry(p124, p125 - 1, unpack(u31, 1, u32));
	end);
end;
function v13.retryWithDelay(p126, p127, p128, ...)
	assert(u14(p126), "Parameter #1 to Promise.retry must be a function");
	assert(type(p127) == "number", "Parameter #2 (times) to Promise.retry must be a number");
	assert(type(p128) == "number", "Parameter #3 (seconds) to Promise.retry must be a number");
	local u33 = { ... };
	local u34 = select("#", ...);
	return v13.resolve(p126(...)):catch(function(...)
		if not (p127 > 0) then
			return v13.reject(...);
		end;
		v13.delay(p128):await();
		return v13.retryWithDelay(p126, p127 - 1, p128, unpack(u33, 1, u34));
	end);
end;
function v13.fromEvent(p129, p130)
	p130 = p130 or function()
		return true;
	end;
	return v13._new(debug.traceback(nil, 2), function(p131, p132, p133)
		local u35 = nil;
		local function v144()
			u35:Disconnect();
			u35 = nil;
		end;
		local u36 = false;
		u35 = p129:Connect(function(...)
			local v145 = p130(...);
			if v145 ~= true then
				if type(v145) ~= "boolean" then
					error("Promise.fromEvent predicate should always return a boolean");
				end;
				return;
			end;
			p131(...);
			if not u35 then
				u36 = true;
				return;
			end;
			u35:Disconnect();
			u35 = nil;
		end);
		if u36 and u35 then
			return v144();
		end;
		p133(v144);
	end);
end;
function v13.onUnhandledRejection(p134)
	table.insert(v13._unhandledRejectionCallbacks, p134);
	return function()
		local v146 = table.find(v13._unhandledRejectionCallbacks, p134);
		if v146 then
			table.remove(v13._unhandledRejectionCallbacks, v146);
		end;
	end;
end;
return v13;
