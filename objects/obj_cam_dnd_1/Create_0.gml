/// @description Insert description here
// You can write your code in this editor
PAUSEVARS

scale = 2;
image_xscale = scale;
image_yscale = scale;

camState = camStates.normal;

camWidth = 1920;
camHeight = 1080;

windowWidth = 1920
windowHeight = 1080

panDestination = [0,0];


view_camera[0] = camera_create_view(0, 0, camWidth, camHeight);

x = 0
y = 0


function panToCoord(_x,_y,time = 60, tween = EaseOutQuart){
	panDestination = [x,y];
	TweenEasyMove(x,y,_x,_y,0,time,tween);
}

