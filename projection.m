function [proj_data, angles]=projection(no_of_proj, no_of_points)
%no_of_points - length of t vector
%no_of_proj- number of theta values

% phantom =[0     0      0.92  0.69   90   2.0
%           0    -0.0184 0.874 0.6624 90  -0.98
%           0.22  0      0.31  0.11   72  -0.02
%          -0.22  0      0.41  0.16   108 -0.02
%           0     0.35   0.25  0.21   90   0.01
%           0     0.1    0.046 0.046  0    0.01
%           0    -0.1    0.046 0.046  0    0.01
%          -0.08 -0.605  0.046 0.023  0    0.01
%           0    -0.605  0.023 0.023  0    0.01
%           0.06 -0.605  0.046 0.023  90   0.01];
phantom = [0      0       0.92    0.69     90        1.0
      0     -0.0184  0.874   0.6624   90       -0.9
      0.22   0       0.31    0.11     72       -0.1
     -0.22   0       0.41    0.16    108       -0.1
      0      0.35    0.25    0.21     90        0.3
      0      0.1     0.046   0.046    0         0.3
      0     -0.1     0.046   0.046    0         0.3
     -0.08  -0.605   0.046   0.023    0         0.3
      0     -0.605   0.023   0.023    0         0.3
      0.06  -0.605   0.046   0.023    90        0.3];
      
N=no_of_points/2;
N_ellipses=size(phantom,1);

proj_data=zeros(no_of_points,no_of_proj);

for i=1:N_ellipses
    A=2*N*phantom(i,3)/3;
    B=2*N*phantom(i,4)/3;
    x1=phantom(i,1);
    y1=phantom(i,2);
    alpha=phantom(i,5)*pi/180;
    rho=phantom(i,6);
    
    index=1;
    s=sqrt((2*N*x1/3)^2+(2*N*y1/3)^2);
    
    gamma=atan2(y1,x1);
    
    for theta1=0:pi/no_of_proj:(pi-pi/(2*no_of_proj))
        theta=theta1-alpha;
        atheta=(A*cos(theta))^2+(B*sin(theta))^2;
        t2(index)=s*cos(gamma-theta1); 
        k=s*cos(gamma-theta1);
        t=(1:no_of_points)-N-k;
        
        
        tmax=floor(sqrt(atheta));
        t1=abs(t)<tmax;
        
        P=2*rho*A*B*sqrt(atheta-t.^2)/atheta;
        Pfinal=P.*t1;
%         disp(k);
%         if(k > 0)
%         Pfinal = [zeros(1,ceil(k)),Pfinal];
%         Pfinal = Pfinal(1,1:no_of_points); 
%         disp('inside +');
%         else
%             lsr=ceil(abs(k));
%         Pfinal = [Pfinal,zeros(1,lsr)];
%         Pfinal = Pfinal(1,lsr+1:lsr+no_of_points);
%         disp('inside -');
%         end
%         
        proj_data(:,index)=proj_data(:,index)+Pfinal';
        index=index+1;   
    end
    t2min(i)=min(abs(t2));
end
angles=0:pi/no_of_proj:(pi-pi/(2*no_of_proj));