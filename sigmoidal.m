function y = sigmoidal(x,L,k,o) %parameter L,k,o control to change graph
%L=1,k=1,o=0 is fo default graph
y=L./(1+exp(-k.*(x-o)));
return 
end