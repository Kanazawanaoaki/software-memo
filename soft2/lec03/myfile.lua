function fact_t(n, r)
	if n <= 1 then
		return r
	else
		return fact_t((n - 1), (n * r))
	end
end

function fact_r(n)
	if n == 1 then
		return 1
	else
		return (n * fact_r(n - 1))
	end
end
