function C = convertLabel(label, limit)

C = zeros(size(label),limit);
for i = 1:size(label)
	C(i,label(i)) = 1;
endfor