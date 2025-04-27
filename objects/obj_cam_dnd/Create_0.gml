/// @description Insert description here
// You can write your code in this editor
PAUSEVARS



enum camStates{
	normal,
}

camState = camStates.normal;

camWidth = 960;
camHeight = 540;

windowWidth = 1920
windowHeight = 1080


view_camera[0] = camera_create_view(0, 0, camWidth, camHeight);

x = 0
y = 0


function panToCoord(_x,_y,time = 60){
	TweenEasyMove(x,y,_x,_y,0,time,EaseOutQuart);
}

