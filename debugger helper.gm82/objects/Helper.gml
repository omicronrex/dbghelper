#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
create()
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_kind_volume(1,0.4)
sound_loop(sound_add_included("Cheese n Onion.xm",1,1))

window_set_visible(1)
#define Mouse_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
patch()
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
draw_set_halign(1)
draw_text(95,96,text)
draw_set_font(fntSmall)
draw_text(95,132,text2)
draw_set_font(fntSetback)
draw_set_halign(0)


text=basetext
text2=""
with (Que) if (tip) other.text="About"
with (Quit) if (tip) other.text="Quit"
with (Folder) if (tip) other.text="Patch a#folder"

time+=1.5
if (time>length) time=0

s=surface_engage(s,160,32)
draw_clear_alpha(0,0)
draw_set_valign(1)
draw_set_color(0)
draw_text(160-floor(time),16,header)
draw_set_valign(0)
surface_reset_target()

for (i=0;i<160;i+=2) {
    draw_surface_part_ext(s,i,0,2,32,16+i,52+6*sin(time/10+i/50),1,1,$ffffff,min(1,(80-abs(80-i))/32))
}

draw_self()
