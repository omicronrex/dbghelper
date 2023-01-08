#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
grab=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (mouse_check_button_pressed(mb_left)) {
    if (instance_position(mouse_x,mouse_y,Helper)) exit
    if (instance_position(mouse_x,mouse_y,Quit)) exit
    if (instance_position(mouse_x,mouse_y,Change)) exit
    if (instance_position(mouse_x,mouse_y,Que)) exit
    if (instance_position(mouse_x,mouse_y,Folder)) exit
    if (instance_position(mouse_x,mouse_y,FramePatch)) exit
    if (instance_position(mouse_x,mouse_y,Backup)) exit
    if (instance_position(mouse_x,mouse_y,MusicToggle)) exit
    grab=1
    offx=mouse_x-view_xview
    offy=mouse_y-view_yview
} else if (grab) {
    window_set_position(display_mouse_get_x()-offx,display_mouse_get_y()-offy)
    if (!mouse_check_direct(mb_left)) grab=0
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
__gm82core_setchromakey(1,$ff00ff)
view_xview=-113
view_yview=-138
