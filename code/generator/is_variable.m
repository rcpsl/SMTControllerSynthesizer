function b = is_variable(c)
	b = equals(c, '(') || equals(c, ')') || is_operator(c) || ~isnan(str2double(c));
	b = ~b;
end