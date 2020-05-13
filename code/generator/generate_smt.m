function text = generate_smt(M)
	
	variables = {};
	for i = 1:length(M)
		expr = char(M(i));
		tokens = tokenize(expr);
		
		v = tokens(cellfun(@(x) is_variable(x), tokens));
		variables = [variables v];
	end
	
	variables = unique(variables);
	
	text = {'(set-logic QF_NRA)'};
	
	for i = 1:length(variables)
		text = [text; ['(declare-fun ' variables{i} ' () Real)']];
	end
	
	% Hurwitz condition
	for i = 1:length(variables)
		if variables{i}(1) == 'z'
			text = [text; ['(assert (> ' variables{i} ' 0 ))']];
		end
	end
	
	for i = 1:length(M)
		expr = char(M(i));
		text = [text; ['(assert (< ' prefix(expr) ' 0 ))']];
	end
	
	text = [text; '(check-sat)'; '(exit)'];
end
