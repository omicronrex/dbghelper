alarm[0]=10

draw_set_font(fntSetback)

basetext="Debugger#Helper v0.6"
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
