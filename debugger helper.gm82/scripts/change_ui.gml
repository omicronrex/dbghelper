registry_write_real("oldui",!registry_read_real("oldui"))

if (registry_read_real("oldui")) room_goto(el_room_7)
else room_goto(el_room)
