file_drag_enable(1)

directory_create(temp_directory+"\data")
directory_create(temp_directory+"\data\lib")
export_include_file_location("indexdjs",temp_directory+"\data\indexdjs")
export_include_file_location("node-portable.dll",temp_directory+"\data\node-portable.dll")
export_include_file_location("stutterfix",temp_directory+"\data\lib\stutterfix")

if (registry_read_real("oldui") || get_windows_version()<10) room_goto(el_room_7)
else room_goto(el_room)

global.music=sound_add_included("Cheese n Onion.xm",1,1)
