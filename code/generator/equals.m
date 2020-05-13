function b = equals(x, y)
	if isempty(x) && isempty(y)
		b = true;
	elseif isempty(x) && ~isempty(y)
		b = false;
	elseif ~isempty(x) && isempty(y)
		b = false;
	else
		b = (length(x)==length(y)) && all(x==y);
	end
end