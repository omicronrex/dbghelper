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
    if (instance_position(mouse_x,mouse_y,Que)) exit
    if (instance_position(mouse_x,mouse_y,Folder)) exit
    if (instance_position(mouse_x,mouse_y,FramePatch)) exit
    if (instance_position(mouse_x,mouse_y,MusicToggle)) exit
    grab=1
    offx=mouse_x+113
    offy=mouse_y+138
} else if (grab) {
    window_set_position(display_mouse_get_x()-offx,display_mouse_get_y()-offy)
    if (!mouse_check_direct(mb_left)) grab=0
}
#define Other_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
window_set_chroma_key(1,$ff00ff)
view_xview[0]=-113
view_yview[0]=-138
