#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tip=0
checked=false
#define Mouse_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
checked=!checked
if (checked) sound_stop_all()
else sound_loop(global.music)
#define Mouse_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tip=1
#define Mouse_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tip=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,checked,x,y)
