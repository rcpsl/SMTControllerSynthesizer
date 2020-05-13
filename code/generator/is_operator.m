function b = is_operator(t)
	b = equals(t, '+') || equals(t, '-') || equals(t, '*') || equals(t, '/') || equals(t, '^');
end
