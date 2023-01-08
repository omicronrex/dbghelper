#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
create()
message_background(bgMessage98)
message_button(sprButton98)
message_size(300,-1)
message_caption(1,"Information")
message_text_font("MS Sans Serif",9,0,0)
message_button_font("MS Sans Serif",9,0,1)
message_mouse_color(0)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_halign(1)
draw_text(150,120,text)
draw_set_font(fntSmall)
draw_text(150,180,text2)
draw_set_font(fntSetback)
draw_set_halign(0)


text=basetext
text2=""
with (Que) if (tip) other.text="About"
with (Change) if (tip) other.text="Change#Skin"
with (Quit) if (tip) other.text="Quit"
with (Folder) if (tip) other.text="Patch a#folder"
with (MusicToggle) if (tip) other.text="Mute"
with (Backup) if (tip) other.text="Make#backups"
with (FramePatch) if (tip) other.text="Apply#Vsync Patch"
if (tip) other.text="Patch#a game"

time+=1.5
if (time>length) time=0

s=dx8_surface_engage(s,160,32)
draw_clear_alpha(0,0)
draw_set_valign(1)
draw_set_color($ff00)
draw_text(160-floor(time),16,header)
draw_set_color(0)
draw_set_valign(0)
dx8_surface_disengage()

for (i=0;i<160;i+=2) {
    draw_surface_part_ext(s,i,0,2,32,65+i,47+6*sin(time/10+i/50),1,1,$ffffff,min(1,(80-abs(80-i))/32))
}

draw_self()
