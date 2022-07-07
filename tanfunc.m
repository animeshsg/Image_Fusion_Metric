function y = tanfunc(x,L,k,o,d)
%L=1,k=1,o=0 is fo default graph
y=L.*tanh(k.*(x-o))+d;
return 
end