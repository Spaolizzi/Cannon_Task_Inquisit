%%ArcDraw.m
%
% This function generates a series of vectorized graphics images of an arc
% overlaid onto a gray circle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear all
close all
figsize=500;
min_arc=0; %Smallest arc angle
max_arc=1; %Largest arc angle
d_arc=1; %step size
ARC=min_arc:d_arc:max_arc;
for ct1=1:length(ARC)
%% Options
%Define the green arc
arc=ARC(ct1);
theta_max=ARC(ct1); %Angle of the arc
thickness=20; %thickness of green arc
%theta_arc=linspace(0,theta_max,200); %Angles of arc
arc_angles=linspace(-arc/2,arc/2,200);

%Define the gray circle
theta_circ=linspace(0,2*pi,200);%angles in circle
thickness_circ=17;% thickness of the circle
circ_coords=[cos(theta_circ);sin(theta_circ)];
circ_color=0.4; %"Grayness" of the circle (0 is black, 1 is white)

%Angular spacing of arc over images
dtheta=5*pi/180; %degrees converted to radians
ROT= pi/2-ct1*pi/180;%Vector of angles to rotate arc through
filedir=strcat(cd,'/Arcs/');%Directory string
for ct=1:length(ROT)
    theta=arc_angles*pi/180+pi/2;
    x=[cos(theta);
        sin(theta)];   
    fig=figure;
    hold on   
    circle=plot(circ_coords(1,:),circ_coords(2,:),'LineWidth',thickness_circ);
    circle.Color=[circ_color,circ_color,circ_color];
    plot(x(1,:),x(2,:),'g','LineWidth', thickness)
    axis equal
    axis([-1.2,1.2,-1.2,1.2])   
    %Turn figure and axes backgrounds transparent
    ax=gca;
    fig.Units='pixels';
    ax.Units='pixels';
    fig.Position(3:4)=[figsize,figsize];
    ax.Position=[0,0,figsize,figsize];
    ax.Visible='off';
    ax.Color='none';
    fig.Color='none';
%         saveas(fig,strcat(filedir,sprintf('Arc%i',thetaMax(ct))),'epsc')%EPS Format
saveas(fig,strcat(filedir,sprintf('Arc%i',ARC(ct1))),'png')%SVG Format
close all
end
end