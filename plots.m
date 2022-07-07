x=linspace(-3,3,100);
% y=atan(x);
% z=tanh(x);
% w=(1+exp(-x)).^-1;
% plot(x,y,'r');
% hold on
% plot(x,z,'b');
% hold on
% plot(x,w,'g');
% hold on
% title('graph of logistic functions');
% legend('y=arctan(x)','y=tanh(x)','y=sigmoid(x)');


 y=sigmoidal(x,0.994,15,0.5);
 l=(1+exp(-x)).^-1;
 %y=0.994*sigmoid(x,0.5,15);
 z=tanfunc(x,0.5,15,0.5,0.5);
 m=atanfunc(x,1/pi,15,0.5,0.5)
 plot(x,y,'g'); %sigmoid
 hold on;
 plot(x,z,'b'); %tan
 hold on 
 plot(x,m,'r') %atan
 title('rescaled sigmoidal functions for edge strength')
 legend('y=sigmoid(x)','y=tanh(x)','y=arctan(x)')
