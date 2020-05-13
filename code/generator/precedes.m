function b = precedes(x, y)
% true if operator x has higher OR equal precedence than y
% currently, operators can be ^, *, /, +, -
	if equals(x, '^')
		b = true;
	elseif equals(x, '*') || equals(x, '/')
		if equals(y, '^')
			b = false;
		else
			b = true;
		end
	elseif equals(x, '+') || equals(x, '-')
		if equals(y, '+') || equals(y, '-')
			b = true;
		else
			b = false;
		end
	end
end