function tokens = tokenize(str)
	str(str==' ') = [];
	tokens = {};
	prev = [];
	i = 1;
	
	while i <= length(str)
		curr = str(i);
		
		if (isempty(prev) || equals(prev, '(') || is_operator(prev)) && curr == '-'
			negated = strtok(str(i+1:end), '+-*/()');
			tokens = [tokens '(' '0' '-' negated ')'];
			prev = ')';
			i = i + 1 + length(negated);
		else
			if is_operator(curr) || curr == '(' || curr == ')'
				tokens = [tokens curr];
				prev = curr;
				i = i + 1;
			else
				curr = strtok(str(i:end), '+-*/()');
				tokens = [tokens curr];
				prev = curr;
				i = i + length(curr);
			end
		end
		
	end
end