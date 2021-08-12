%%ArcDraw.m
%
% This function generates a series of vectorized graphics images of an arc
% overlaid onto a gray circle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear all
close all
figsize=500;
min_arc=1; %Smallest arc angle
max_arc=60; %Largest arc angle
d_arc=1; %step size
all_arcs=min_arc:d_arc:max_arc;
for ct=1:length(all_arcs)
    arc=all_arcs(ct);
    %% Options
    %Define the sheild
    thickness=17; %thickness of green arc
    arc_angles=linspace(-arc/2,arc/2,200); %Angles of arc
    
    %Define the gray circle
    theta_circ=linspace(0,2*pi,200);%angles in circle
    thickness_circ=15;% thickness of the circle
    circ_coords=[cos(theta_circ);sin(theta_circ)];
    circ_color=0.4; %"Grayness" of the circle (0 is black, 1 is white)
    
    %Angular spacing of arc over images
    dtheta=10*pi/180; %degrees converted to radians
    
    filedir=strcat(cd,'\Arcs\');%Directory string
    theta=arc_angles*pi/180+pi/2;
    x=[cos(theta);
        sin(theta)];
    fig=figure;
    hold on
    plot(x(1,:),x(2,:),'g','LineWidth',thickness)
    axis square
    axis([-1.2,1.2,-1.2,1.2])
    %Turn figure and axes backgrounds transparent
    ax=gca;
    fig.Position(3)=fig.Position(4);
    ax.Color='none';
    fig.Color='none';
    ax.Visible='off';
    saveas(fig,strcat(filedir,sprintf('Arc%i',arc)),'png')%SVG Format
    close all
end