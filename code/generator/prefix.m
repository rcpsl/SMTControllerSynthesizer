function output = prefix(str)
	%str = reverse(str);
	%str(str=='(') = ')';
	%str(str==')') = '(';
	
	tokens = tokenize(str);
	tokens = flip(tokens);
	for i = 1:length(tokens)
		if equals(tokens{i}, '(')
			tokens{i} = ')';
		elseif equals(tokens{i}, ')')
			tokens{i} = '(';
		end
	end
	output = parenthesize(flip(postfix_tokens(tokens)));
end
