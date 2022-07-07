function T = glfed(i,v)
%the value of v E (0,1) exclusive of 0 and 1
p1=gamma(i-v+1)*(v/4+v^2/8)/factorial(i+1);
p2=gamma(i-v)*(1-v^2/4)/factorial(i);
p3=gamma(i-v-1)*(v^2/8-v/4)/factorial(i-1);
T=(p1+p2+p3)/gamma(-v);
return
end

