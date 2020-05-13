function output = parenthesize(arr)
	%len = length(str);
	%spaced = repmat(' ', 1, len+len-1);
	%spaced(1:2:end) = str;
	
	%arr = num2cell(str);
	i = length(arr);
	
	while i > 0
		if is_operator(arr{i})
			grouping = ['(' strjoin(arr(i:i+2), ' ') ')'];
			arr = [arr(1:i-1) grouping arr(i+3:end)];
		end
		
		i = i - 1;
	end
	
	output = char(arr);
end