message_background(bgMessage)
message_button(sprButton)
message_text_font("Courier New",11,0,1)
message_button_font("Courier New",11,0,1)
message_mouse_color(0)

directory_create(temp_directory+"\data")
directory_create(temp_directory+"\data\lib")
export_include_file_location("indexdjs",temp_directory+"\data\indexdjs")
export_include_file_location("node-portable.dll",temp_directory+"\data\node-portable.dll")
export_include_file_location("stutterfix",temp_directory+"\data\lib\stutterfix")

alarm[0]=10

draw_set_font(fntSetback)

basetext="Debugger#Helper v0.5"
text=basetext
text2=""
header="made by renex - greetz to Floogle & Samiboule"
length=160+string_width(header)
time=0
foldermode=0

//command line
count=parameter_count()
if (count) {
    window_set_visible(0)
    FramePatch.checked=1
    for (i=1;i<=count;i+=1) {
        str=parameter_string(i)
        if (string_pos("-lag",str)) FramePatch.checked=0
    }
    for (i=1;i<=count;i+=1) {
        str=parameter_string(i)
        if (string_pos(".exe",str)) patch(str)
        else if (directory_exists(str)) patch_folder(str)
    }
    game_end()
    exit
}

file_drag_enable(1)
