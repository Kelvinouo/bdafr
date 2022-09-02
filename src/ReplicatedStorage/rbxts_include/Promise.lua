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
function v13.fold(p43, p44, p45)
	assert(type(p43) == "table", "Bad argument #1 to Promise.fold: must be a table");
	if type(p44) == "function" then
		local v42 = true;
	elseif type(p44) == "table" then
		local v43 = getmetatable(p44);
		if v43 and type(rawget(v43, "__call")) == "function" then
			v42 = true;
		else
			v42 = false;
		end;
	else
		v42 = false;
	end;
	assert(v42, "Bad argument #2 to Promise.fold: must be a function");
	local u14 = v13.resolve(p45);
	return v13.each(p43, function(p46, p47)
		u14 = u14:andThen(function(p48)
			return p44(p48, p46, p47);
		end);
	end):andThen(function()
		return u14;
	end);
end;
function v13.some(p49, p50)
	assert(type(p50) == "number", "Bad argument #2 to Promise.some: must be a number");
	return v13._all(debug.traceback(nil, 2), p49, p50);
end;
function v13.any(p51)
	return v13._all(debug.traceback(nil, 2), p51, 1):andThen(function(p52)
		return p52[1];
	end);
end;
function v13.allSettled(p53)
	if type(p53) ~= "table" then
		error(string.format("Please pass a list of promises to %s", "Promise.allSettled"), 2);
	end;
	for v44, v45 in pairs(p53) do
		if not v13.is(v45) then
			error(string.format("Non-promise value passed into %s at index %s", "Promise.allSettled", tostring(v44)), 2);
		end;
	end;
	if #p53 == 0 then
		return v13.resolve({});
	end;
	return v13._new(debug.traceback(nil, 2), function(p54, p55, p56)
		local u15 = 0;
		local u16 = {};
		local function v46(p57, ...)
			u15 = u15 + 1;
			u16[p57] = ...;
			if #p53 <= u15 then
				p54(u16);
			end;
		end;
		local u17 = {};
		p56(function()
			for v47, v48 in ipairs(u17) do
				v48:cancel();
			end;
		end);
		for v49, v50 in ipairs(p53) do
			u17[v49] = v50:finally(function(...)
				v46(v49, ...);
			end);
		end;
	end);
end;
function v13.race(p58)
	assert(type(p58) == "table", string.format("Please pass a list of promises to %s", "Promise.race"));
	for v51, v52 in pairs(p58) do
		assert(v13.is(v52), string.format("Non-promise value passed into %s at index %s", "Promise.race", tostring(v51)));
	end;
	return v13._new(debug.traceback(nil, 2), function(p59, p60, p61)
		local u18 = {};
		local u19 = false;
		if p61(function(...)
			for v53, v54 in ipairs(u18) do
				v54:cancel();
			end;
			u19 = true;
			return p60(...);
		end) then
			return;
		end;
		for v55, v56 in ipairs(p58) do
			u18[v55] = v56:andThen(function(...)
				for v57, v58 in ipairs(u18) do
					v58:cancel();
				end;
				u19 = true;
				return p59(...);
			end, function(...)
				for v59, v60 in ipairs(u18) do
					v60:cancel();
				end;
				u19 = true;
				return p60(...);
			end);
		end;
		if u19 then
			for v61, v62 in ipairs(u18) do
				v62:cancel();
			end;
		end;
	end);
end;
function v13.each(p62, p63)
	assert(type(p62) == "table", string.format("Please pass a list of promises to %s", "Promise.each"));
	if type(p63) == "function" then
		local v63 = true;
	elseif type(p63) == "table" then
		local v64 = getmetatable(p63);
		if v64 and type(rawget(v64, "__call")) == "function" then
			v63 = true;
		else
			v63 = false;
		end;
	else
		v63 = false;
	end;
	assert(v63, string.format("Please pass a handler function to %s!", "Promise.each"));
	return v13._new(debug.traceback(nil, 2), function(p64, p65, p66)
		local v65 = {};
		local u20 = {};
		local u21 = false;
		p66(function()
			u21 = true;
			for v66, v67 in ipairs(u20) do
				v67:cancel();
			end;
		end);
		local v68 = {};
		for v69, v70 in ipairs(p62) do
			if v13.is(v70) then
				if v70:getStatus() == v13.Status.Cancelled then
					for v71, v72 in ipairs(u20) do
						v72:cancel();
					end;
					return p65(v6.new({
						error = "Promise is cancelled", 
						kind = v6.Kind.AlreadyCancelled, 
						context = string.format("The Promise that was part of the array at index %d passed into Promise.each was already cancelled when Promise.each began.\n\nThat Promise was created at:\n\n%s", v69, v70._source)
					}));
				end;
				if v70:getStatus() == v13.Status.Rejected then
					for v73, v74 in ipairs(u20) do
						v74:cancel();
					end;
					return p65(select(2, v70:await()));
				end;
				local v75 = v70:andThen(function(...)
					return ...;
				end);
				table.insert(u20, v75);
				v68[v69] = v75;
			else
				v68[v69] = v70;
			end;
		end;
		for v76, v77 in ipairs(v68) do
			if v13.is(local v78) then
				local v79, v77 = v78:await();
				if not v79 then
					for v80, v81 in ipairs(u20) do
						v81:cancel();
					end;
					return p65(v77);
				end;
			end;
			if u21 then
				return;
			end;
			local v82 = v13.resolve(p63(v77, v76));
			table.insert(u20, v82);
			local v83, v84 = v82:await();
			if not v83 then
				for v85, v86 in ipairs(u20) do
					v86:cancel();
				end;
				return p65(v84);
			end;
			v65[v76] = v84;
		end;
		p64(v65);
	end);
end;
function v13.is(p67)
	if type(p67) ~= "table" then
		return false;
	end;
	local v87 = getmetatable(p67);
	if v87 == v13 then
		return true;
	end;
	if v87 == nil then
		local l__andThen__88 = p67.andThen;
		if type(l__andThen__88) == "function" then
			return true;
		elseif type(l__andThen__88) == "table" then
			local v89 = getmetatable(l__andThen__88);
			if v89 and type(rawget(v89, "__call")) == "function" then
				return true;
			else
				return false;
			end;
		else
			return false;
		end;
	end;
	if type(v87) == "table" and type(rawget(v87, "__index")) == "table" then
		local v90 = rawget(rawget(v87, "__index"), "andThen");
		if type(v90) == "function" then
			local v91 = true;
		elseif type(v90) == "table" then
			local v92 = getmetatable(v90);
			if v92 and type(rawget(v92, "__call")) == "function" then
				v91 = true;
			else
				v91 = false;
			end;
		else
			v91 = false;
		end;
		if v91 then
			return true;
		end;
	end;
	return false;
end;
function v13.promisify(p68)
	return function(...)
		return v13._try(debug.traceback(nil, 2), p68, ...);
	end;
end;
local u22 = nil;
local u23 = nil;
function v13.delay(p69)
	assert(type(p69) == "number", "Bad argument #1 to Promise.delay, must be a number.");
	if not (p69 >= 0.016666666666666666) or p69 == math.huge then
		p69 = 0.016666666666666666;
	end;
	return v13._new(debug.traceback(nil, 2), function(p70, p71, p72)
		local v93 = v13._getTime();
		local v94 = v93 + p69;
		local v95 = {
			resolve = p70, 
			startTime = v93, 
			endTime = v94
		};
		if u22 == nil then
			u23 = v95;
			u22 = v13._timeEvent:Connect(function()
				while u23 ~= nil and u23.endTime < v13._getTime() do
					u23 = u23.next;
					if u23 == nil then
						u22:Disconnect();
						u22 = nil;
					else
						u23.previous = nil;
					end;
					u23.resolve(v13._getTime() - u23.startTime);				
				end;
			end);
		elseif u23.endTime < v94 then
			local v96 = u23;
			local v97 = v96.next;
			while v97 ~= nil and v97.endTime < v94 do
				v96 = v97;
				v97 = v96.next;			
			end;
			v96.next = v95;
			v95.previous = v96;
			if v97 ~= nil then
				v95.next = v97;
				v97.previous = v95;
			end;
		else
			v95.next = u23;
			u23.previous = v95;
			u23 = v95;
		end;
		p72(function()
			local l__next__98 = v95.next;
			if u23 ~= v95 then
				local l__previous__99 = v95.previous;
				l__previous__99.next = l__next__98;
				if l__next__98 ~= nil then
					l__next__98.previous = l__previous__99;
				end;
				return;
			end;
			if l__next__98 == nil then
				u22:Disconnect();
				u22 = nil;
			else
				l__next__98.previous = nil;
			end;
			u23 = l__next__98;
		end);
	end);
end;
v13.prototype.timeout = function(p73, p74, p75)
	local v100 = {};
	local u24 = debug.traceback(nil, 2);
	v100[1] = v13.delay(p74):andThen(function()
		if p75 == nil then
			local v101 = v6.new({
				kind = v6.Kind.TimedOut, 
				error = "Timed out", 
				context = string.format("Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s", p74, u24)
			}) or p75;
		else
			v101 = p75;
		end;
		return v13.reject(v101);
	end);
	v100[2] = p73;
	return v13.race(v100);
end;
v13.prototype.getStatus = function(p76)
	return p76._status;
end;
v13.prototype._andThen = function(p77, p78, p79, p80)
	p77._unhandledRejection = false;
	return v13._new(p78, function(p81, p82)
		local v102 = p81;
		if p79 then
			v102 = function(...)
				local v103 = nil;
				local v104 = nil;
				local v105 = nil;
				v104, v105, v103 = u2(p78, p79, ...);
				if not v104 then
					p82(v103[1]);
					return;
				end;
				p81(unpack(v103, 1, v105));
			end;
		end;
		local v106 = p82;
		if p80 then
			v106 = function(...)
				local v107 = nil;
				local v108 = nil;
				local v109 = nil;
				v108, v109, v107 = u2(p78, p80, ...);
				if not v108 then
					p82(v107[1]);
					return;
				end;
				p81(unpack(v107, 1, v109));
			end;
		end;
		if p77._status == v13.Status.Started then
			table.insert(p77._queuedResolve, v102);
			table.insert(p77._queuedReject, v106);
			return;
		end;
		if p77._status == v13.Status.Resolved then
			v102(unpack(p77._values, 1, p77._valuesLength));
			return;
		end;
		if p77._status == v13.Status.Rejected then
			v106(unpack(p77._values, 1, p77._valuesLength));
			return;
		end;
		if p77._status == v13.Status.Cancelled then
			p82(v6.new({
				error = "Promise is cancelled", 
				kind = v6.Kind.AlreadyCancelled, 
				context = "Promise created at\n\n" .. p78
			}));
		end;
	end, p77);
end;
v13.prototype.andThen = function(p83, p84, p85)
	local v110 = true;
	if p84 ~= nil then
		if type(p84) == "function" then
			v110 = true;
		elseif type(p84) == "table" then
			local v111 = getmetatable(p84);
			if v111 and type(rawget(v111, "__call")) == "function" then
				v110 = true;
			else
				v110 = false;
			end;
		else
			v110 = false;
		end;
	end;
	assert(v110, string.format("Please pass a handler function to %s!", "Promise:andThen"));
	local v112 = true;
	if p85 ~= nil then
		if type(p85) == "function" then
			v112 = true;
		elseif type(p85) == "table" then
			local v113 = getmetatable(p85);
			if v113 and type(rawget(v113, "__call")) == "function" then
				v112 = true;
			else
				v112 = false;
			end;
		else
			v112 = false;
		end;
	end;
	assert(v112, string.format("Please pass a handler function to %s!", "Promise:andThen"));
	return p83:_andThen(debug.traceback(nil, 2), p84, p85);
end;
v13.prototype.catch = function(p86, p87)
	local v114 = true;
	if p87 ~= nil then
		if type(p87) == "function" then
			v114 = true;
		elseif type(p87) == "table" then
			local v115 = getmetatable(p87);
			if v115 and type(rawget(v115, "__call")) == "function" then
				v114 = true;
			else
				v114 = false;
			end;
		else
			v114 = false;
		end;
	end;
	assert(v114, string.format("Please pass a handler function to %s!", "Promise:catch"));
	return p86:_andThen(debug.traceback(nil, 2), nil, p87);
end;
v13.prototype.tap = function(p88, p89)
	if type(p89) == "function" then
		local v116 = true;
	elseif type(p89) == "table" then
		local v117 = getmetatable(p89);
		if v117 and type(rawget(v117, "__call")) == "function" then
			v116 = true;
		else
			v116 = false;
		end;
	else
		v116 = false;
	end;
	assert(v116, string.format("Please pass a handler function to %s!", "Promise:tap"));
	return p88:_andThen(debug.traceback(nil, 2), function(...)
		local v118 = p89(...);
		if not v13.is(v118) then
			return ...;
		end;
		local v119, v120 = u8(...);
		return v118:andThen(function()
			return unpack(v120, 1, v119);
		end);
	end);
end;
v13.prototype.andThenCall = function(p90, p91, ...)
	if type(p91) == "function" then
		local v121 = true;
	elseif type(p91) == "table" then
		local v122 = getmetatable(p91);
		if v122 and type(rawget(v122, "__call")) == "function" then
			v121 = true;
		else
			v121 = false;
		end;
	else
		v121 = false;
	end;
	assert(v121, string.format("Please pass a handler function to %s!", "Promise:andThenCall"));
	local v123, v124 = u8(...);
	return p90:_andThen(debug.traceback(nil, 2), function()
		return p91(unpack(v124, 1, v123));
	end);
end;
v13.prototype.andThenReturn = function(p92, ...)
	local v125, v126 = u8(...);
	return p92:_andThen(debug.traceback(nil, 2), function()
		return unpack(v126, 1, v125);
	end);
end;
v13.prototype.cancel = function(p93)
	if p93._status ~= v13.Status.Started then
		return;
	end;
	p93._status = v13.Status.Cancelled;
	if p93._cancellationHook then
		p93._cancellationHook();
	end;
	if p93._parent then
		p93._parent:_consumerCancelled(p93);
	end;
	for v127 in pairs(p93._consumers) do
		v127:cancel();
	end;
	p93:_finalize();
end;
v13.prototype._consumerCancelled = function(p94, p95)
	if p94._status ~= v13.Status.Started then
		return;
	end;
	p94._consumers[p95] = nil;
	if next(p94._consumers) == nil then
		p94:cancel();
	end;
end;
v13.prototype._finally = function(p96, p97, p98, p99)
	if not p99 then
		p96._unhandledRejection = false;
	end;
	return v13._new(p97, function(p100, p101)
		local v128 = p100;
		if p98 then
			v128 = function(...)
				local v129 = nil;
				local v130 = nil;
				local v131 = nil;
				v130, v131, v129 = u2(p97, p98, ...);
				if not v130 then
					p101(v129[1]);
					return;
				end;
				p100(unpack(v129, 1, v131));
			end;
		end;
		if p99 then
			v128 = function(...)
				if p96._status == v13.Status.Rejected then
					return p100(p96);
				end;
				return v128(...);
			end;
		end;
		if p96._status == v13.Status.Started then
			table.insert(p96._queuedFinally, v128);
			return;
		end;
		v128(p96._status);
	end, p96);
end;
v13.prototype.finally = function(p102, p103)
	local v132 = true;
	if p103 ~= nil then
		if type(p103) == "function" then
			v132 = true;
		elseif type(p103) == "table" then
			local v133 = getmetatable(p103);
			if v133 and type(rawget(v133, "__call")) == "function" then
				v132 = true;
			else
				v132 = false;
			end;
		else
			v132 = false;
		end;
	end;
	assert(v132, string.format("Please pass a handler function to %s!", "Promise:finally"));
	return p102:_finally(debug.traceback(nil, 2), p103);
end;
v13.prototype.finallyCall = function(p104, p105, ...)
	if type(p105) == "function" then
		local v134 = true;
	elseif type(p105) == "table" then
		local v135 = getmetatable(p105);
		if v135 and type(rawget(v135, "__call")) == "function" then
			v134 = true;
		else
			v134 = false;
		end;
	else
		v134 = false;
	end;
	assert(v134, string.format("Please pass a handler function to %s!", "Promise:finallyCall"));
	local v136, v137 = u8(...);
	return p104:_finally(debug.traceback(nil, 2), function()
		return p105(unpack(v137, 1, v136));
	end);
end;
v13.prototype.finallyReturn = function(p106, ...)
	local v138, v139 = u8(...);
	return p106:_finally(debug.traceback(nil, 2), function()
		return unpack(v139, 1, v138);
	end);
end;
v13.prototype.done = function(p107, p108)
	local v140 = true;
	if p108 ~= nil then
		if type(p108) == "function" then
			v140 = true;
		elseif type(p108) == "table" then
			local v141 = getmetatable(p108);
			if v141 and type(rawget(v141, "__call")) == "function" then
				v140 = true;
			else
				v140 = false;
			end;
		else
			v140 = false;
		end;
	end;
	assert(v140, string.format("Please pass a handler function to %s!", "Promise:done"));
	return p107:_finally(debug.traceback(nil, 2), p108, true);
end;
v13.prototype.doneCall = function(p109, p110, ...)
	if type(p110) == "function" then
		local v142 = true;
	elseif type(p110) == "table" then
		local v143 = getmetatable(p110);
		if v143 and type(rawget(v143, "__call")) == "function" then
			v142 = true;
		else
			v142 = false;
		end;
	else
		v142 = false;
	end;
	assert(v142, string.format("Please pass a handler function to %s!", "Promise:doneCall"));
	local v144, v145 = u8(...);
	return p109:_finally(debug.traceback(nil, 2), function()
		return p110(unpack(v145, 1, v144));
	end, true);
end;
v13.prototype.doneReturn = function(p111, ...)
	local v146, v147 = u8(...);
	return p111:_finally(debug.traceback(nil, 2), function()
		return unpack(v147, 1, v146);
	end, true);
end;
v13.prototype.awaitStatus = function(p112)
	p112._unhandledRejection = false;
	if p112._status == v13.Status.Started then
		local u25 = Instance.new("BindableEvent");
		p112:finally(function()
			u25:Fire();
		end);
		u25.Event:Wait();
		u25:Destroy();
	end;
	if p112._status == v13.Status.Resolved then
		return p112._status, unpack(p112._values, 1, p112._valuesLength);
	end;
	if p112._status ~= v13.Status.Rejected then
		return p112._status;
	end;
	return p112._status, unpack(p112._values, 1, p112._valuesLength);
end;
local function u26(p113, ...)
	return p113 == v13.Status.Resolved, ...;
end;
v13.prototype.await = function(p114)
	return u26(p114:awaitStatus());
end;
local function u27(p115, ...)
	if p115 ~= v13.Status.Resolved then
		if ... == nil then
			local v148 = "Expected Promise rejected with no value.";
		else
			v148 = ...;
		end;
		error(v148, 3);
	end;
	return ...;
end;
v13.prototype.expect = function(p116)
	return u27(p116:awaitStatus());
end;
v13.prototype.awaitValue = v13.prototype.expect;
v13.prototype._unwrap = function(p117)
	if p117._status == v13.Status.Started then
		error("Promise has not resolved or rejected.", 2);
	end;
	return p117._status == v13.Status.Resolved, unpack(p117._values, 1, p117._valuesLength);
end;
v13.prototype._resolve = function(p118, ...)
	if p118._status ~= v13.Status.Started then
		if v13.is((...)) then
			(...):_consumerCancelled(p118);
		end;
		return;
	end;
	if not v13.is((...)) then
		p118._status = v13.Status.Resolved;
		local v149, v150 = u8(...);
		p118._valuesLength = v149;
		p118._values = v150;
		for v151, v152 in ipairs(p118._queuedResolve) do
			coroutine.wrap(v152)(...);
		end;
		p118:_finalize();
		return;
	end;
	if select("#", ...) > 1 then
		warn((string.format("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s", p118._source)));
	end;
	local u28 = ...;
	local v153 = u28:andThen(function(...)
		p118:_resolve(...);
	end, function(...)
		local v154 = u28._values[1];
		if u28._error then
			v154 = v6.new({
				error = u28._error, 
				kind = v6.Kind.ExecutionError, 
				context = "[No stack trace available as this Promise originated from an older version of the Promise library (< v2)]"
			});
		end;
		if not v6.isKind(v154, v6.Kind.ExecutionError) then
			p118:_reject(...);
			return;
		end;
		return p118:_reject(v154:extend({
			error = "This Promise was chained to a Promise that errored.", 
			trace = "", 
			context = string.format("The Promise at:\n\n%s\n...Rejected because it was chained to the following Promise, which encountered an error:\n", p118._source)
		}));
	end);
	if v153._status == v13.Status.Cancelled then
		p118:cancel();
		return;
	end;
	if v153._status == v13.Status.Started then
		p118._parent = v153;
		v153._consumers[p118] = true;
	end;
end;
v13.prototype._reject = function(p119, ...)
	if p119._status ~= v13.Status.Started then
		return;
	end;
	p119._status = v13.Status.Rejected;
	local v155, v156 = u8(...);
	p119._valuesLength = v155;
	p119._values = v156;
	if next(p119._queuedReject) ~= nil then
		for v157, v158 in ipairs(p119._queuedReject) do
			coroutine.wrap(v158)(...);
		end;
	else
		local u29 = tostring((...));
		coroutine.wrap(function()
			v13._timeEvent:Wait();
			if not p119._unhandledRejection then
				return;
			end;
			for v159, v160 in ipairs(v13._unhandledRejectionCallbacks) do
				task.spawn(v160, p119, unpack(p119._values, 1, p119._valuesLength));
			end;
			if v13.TEST then
				return;
			end;
			warn((string.format("Unhandled Promise rejection:\n\n%s\n\n%s", u29, p119._source)));
		end)();
	end;
	p119:_finalize();
end;
v13.prototype._finalize = function(p120)
	for v161, v162 in ipairs(p120._queuedFinally) do
		coroutine.wrap(v162)(p120._status);
	end;
	p120._queuedFinally = nil;
	p120._queuedReject = nil;
	p120._queuedResolve = nil;
	if not v13.TEST then
		p120._parent = nil;
		p120._consumers = nil;
	end;
end;
v13.prototype.now = function(p121, p122)
	local v163 = nil;
	v163 = debug.traceback(nil, 2);
	if p121._status == v13.Status.Resolved then
		return p121:_andThen(v163, function(...)
			return ...;
		end);
	end;
	if p122 == nil then
		local v164 = v6.new({
			kind = v6.Kind.NotResolvedInTime, 
			error = "This Promise was not resolved in time for :now()", 
			context = ":now() was called at:\n\n" .. v163
		}) or p122;
	else
		v164 = p122;
	end;
	return v13.reject(v164);
end;
function v13.retry(p123, p124, ...)
	if type(p123) == "function" then
		local v165 = true;
	elseif type(p123) == "table" then
		local v166 = getmetatable(p123);
		if v166 and type(rawget(v166, "__call")) == "function" then
			v165 = true;
		else
			v165 = false;
		end;
	else
		v165 = false;
	end;
	assert(v165, "Parameter #1 to Promise.retry must be a function");
	assert(type(p124) == "number", "Parameter #2 to Promise.retry must be a number");
	local u30 = { ... };
	local u31 = select("#", ...);
	return v13.resolve(p123(...)):catch(function(...)
		if not (p124 > 0) then
			return v13.reject(...);
		end;
		return v13.retry(p123, p124 - 1, unpack(u30, 1, u31));
	end);
end;
function v13.retryWithDelay(p125, p126, p127, ...)
	if type(p125) == "function" then
		local v167 = true;
	elseif type(p125) == "table" then
		local v168 = getmetatable(p125);
		if v168 and type(rawget(v168, "__call")) == "function" then
			v167 = true;
		else
			v167 = false;
		end;
	else
		v167 = false;
	end;
	assert(v167, "Parameter #1 to Promise.retry must be a function");
	assert(type(p126) == "number", "Parameter #2 (times) to Promise.retry must be a number");
	assert(type(p127) == "number", "Parameter #3 (seconds) to Promise.retry must be a number");
	local u32 = { ... };
	local u33 = select("#", ...);
	return v13.resolve(p125(...)):catch(function(...)
		if not (p126 > 0) then
			return v13.reject(...);
		end;
		v13.delay(p127):await();
		return v13.retryWithDelay(p125, p126 - 1, p127, unpack(u32, 1, u33));
	end);
end;
function v13.fromEvent(p128, p129)
	p129 = p129 or function()
		return true;
	end;
	return v13._new(debug.traceback(nil, 2), function(p130, p131, p132)
		local u34 = nil;
		local function v169()
			u34:Disconnect();
			u34 = nil;
		end;
		local u35 = false;
		u34 = p128:Connect(function(...)
			local v170 = p129(...);
			if v170 ~= true then
				if type(v170) ~= "boolean" then
					error("Promise.fromEvent predicate should always return a boolean");
				end;
				return;
			end;
			p130(...);
			if not u34 then
				u35 = true;
				return;
			end;
			u34:Disconnect();
			u34 = nil;
		end);
		if u35 and u34 then
			return v169();
		end;
		p132(v169);
	end);
end;
function v13.onUnhandledRejection(p133)
	table.insert(v13._unhandledRejectionCallbacks, p133);
	return function()
		local v171 = table.find(v13._unhandledRejectionCallbacks, p133);
		if v171 then
			table.remove(v13._unhandledRejectionCallbacks, v171);
		end;
	end;
end;
return v13;
