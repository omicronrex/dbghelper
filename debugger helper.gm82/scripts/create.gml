window_set_visible(0)
alarm[0]=10

spr=TD_load_sprite(sprHelper,0,$ffffff)
TD_start(spr,0,0,30,0,1,1)

message_background(bgMessage)
message_button(sprButton)
message_text_font("Courier New",11,0,1)
message_button_font("Courier New",11,0,1)
message_mouse_color(0)

draw_set_font(fntSetback)

basetext="Debugger#Helper v0.1"
text=basetext
text2=""
header="made by renex - greetz to Floogle & Samiboule"
length=160+string_width(header)
time=0
foldermode=0

cmd=external_define(temp_directory+'\Silent_dos.dll','RunSilent',dll_stdcall, ty_real,2,ty_string,ty_string)
