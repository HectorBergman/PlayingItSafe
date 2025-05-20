
originalCoords = [x,y]
selected = false;
color = c_white
colorR = 255
colorG = 255
colorB = 255

colorRGray = 190 //be
colorGGray = 184 //b8
colorBGray = 184 //b8

pointer = instance_find(obj_pointer_FC,0);
held = false;
offset = [0,0]
category_set = false; // True when first food_object has hit the chopping board. 

allowed_category = ""; // Category that has landed

scale = 2;