clc;
clear;
clear all;

%%%% Q1

% getting the lengths of the arrays
prompt="enter the length of the x array: ";
n=input(prompt);
prompt="enter the length of the y array: ";
m=input(prompt);

% getting the arrays
prompt="enter the elements of the array x, as in the form [ x x x ]: ";
x=input(prompt);
prompt="enter the elements of the array y, as in the form [ y y y ]: ";
y=input(prompt);

% getting the indexes
prompt="enter the indexes of the x array, as in the form [ x x x ]:";
inX=input(prompt);
prompt="enter the indexes of the y array, as in the form [ y y y ]:";
inY=input(prompt);

tempY=inY;

% calling(?) the convolution function
result=myConv(x,n,y,m,inX,inY,tempY);

% finding the indexes of the convolution result
i=inX(1)+inY(1);
j=n+m-1;
for k=1:1:j
    newIndexes(k)=i;
    i=i+1;
end

%%%% Q2

predef=conv(x,y); %finding convolution with predefined func

% printing to the screen
subplot(2,2,1);
stem(inX,x);
grid;
title('x[n]');
subplot(2,2,2);
stem(inY,y);
grid;
title('y[n]');
subplot(2,2,3);
stem(newIndexes,myConv);
grid;
title("myConv");
subplot(2,2,4);
stem(newIndexes,predef);
grid;
title("predefined conv");


%%%% Q3

recObj = audiorecorder; %% recording object
disp('Start speaking.') %% displaying a message
recordblocking(recObj, 5); %% recording process
disp('End of Recording.'); %% displaying a message
x1 = getaudiodata(recObj); %% assigning recording to x1 variable

recObj = audiorecorder; %% recording object
disp('Start speaking.') %% displaying a message
recordblocking(recObj, 10); %% recording process
disp('End of Recording.'); %% displaying a message
x2 = getaudiodata(recObj); %% assigning recording to x2 variable

%%%% Q4

m=3; % m number which decides the sigma's upper bound in the given function
% finding h[n] func
h=zeros([1 400*m]);
j=1;
a=0.8;
h(1)=1;
for i=400:400:(400*m)
    h(i)=a*j;
    j=j+1;
end


inH = 1:400*m;
inX = 1:40000;
myY1=myConv(x1,40000,h,400*m,inX,inH,tempY);
y1=conv(x1,h);
inX=1:80000;
myY2=myConv(x2,80000,h,400*m,inX,inH,tempY);
y2=conv(x2,h);
 


% convolution function
function result=myConv(x,n,y,m,inX,inY,tempY)

% calculating the convolution array's length
newLength=m+n-1;

% calculating the y(-m)
for i=1:1:m
   tempY(i)=inY(i)*(-1);
   tempY(i)=tempY(i)+inX(1)+inY(1);
end


% calculating convolution
c=1;
while c<=newLength
     result(c)=0;
     for i=1:1:n
         for j=1:1:m
             if inX(i)==tempY(j)
                 result(c)=result(c)+(x(i)*y(j));
             end
         end
     end
c=c+1;

for i=1:1:m
    tempY(i)=tempY(i)+1;
end

end

end 
