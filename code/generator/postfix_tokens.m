function output = postfix_tokens(tokens)
	output = {};
	stack = {'('};
	tokens{end+1} = ')';
	
	for i = 1:length(tokens)
		token = tokens{i};
		if equals(token, '(')
			stack = [token stack];
			
		elseif equals(token, ')')
			open_paren = find(strcmp(stack, '('), 1);
			for j = 1:open_paren-1
				output = [output stack{j}];
			end
			%output = [output strjoin(stack(1:open_paren-1), '')];
			
			stack(1:open_paren) = [];
			
		elseif is_operator(token)
			j = 0;
			while j < length(stack) && ~equals(stack{j+1}, '(') && precedes(stack{j+1}, token)
				j = j+1;
				output = [output stack{j}];
			end
			%output = [output strjoin(stack(1:j), '')];
			stack(1:j) = [];
			
			stack = [token stack];
			
		else
			output = [output token];
			
		end
	end
	
	%output = [output strjoin(stack, '')];
end