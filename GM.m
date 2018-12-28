close all;
clear;
clc;

n=100;
A=zeros(n); %A = starting matrix
A=floor(rand(n)*9);
A(A>0)=1;
A=A+1;A(A==2)=0;
A=imbinarize(A);
% visualize the initial states 

figure(1)
pcolor(~A);


A=boundary1(A,0); 
[d1,d2]=size(A);

B=A;
t=0;
stp=false; % to stop when if no new configurations
%B is the CA in time t
%A is the CA in time t+1

%%%%%%%%%%%%%%%% 
%   Play ^_^   %
%%%%%%%%%%%%%%%%


while ~stp && (t<10) %t is the number of generations
    % repeat for (t<N) generations for each cell 
    B2=B;
    for i=2:d1-1
        for j=2:d2-1               
            B2(i,j)=rule1(B,i,j);% apply rules     
        end
    end 
    B=B2;
    % visualize what happened
    figure(2)
    title('Population utveckling'); 
    pcolor(~B);
    drawnow;  
    save B; 
    if A==B
       stp=true; % no more new states
    end
    A=B;    
    t=t+1;
     pause(0.2);
    F = getframe(gcf);
   
end
 video = VideoWriter('Population utveckling.avi');
    open(video);
    writeVideo(video,F);
    close(video);

