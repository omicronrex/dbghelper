//apply gm8x_fix

kek=""
if (!FramePatch.checked) kek="-ni "
execute_silent(temp_directory+"\gm8x_fix.dll",'-s '+kek+'"'+argument0+'"')
if (file_exists(argument0+".bak")) {
    file_delete(argument0+".bak")
    if (!foldermode) show_message("GM8 patch successful!")
} else if (!foldermode) show_message("GM8 patch failed to apply!##This could mean the game is already patched.")

if (FramePatch.checked && argument1) {
    text="VPatch..."
    text2=filename_name(fn)
    time=0
    screen_redraw()
    //apply vpatch
    execute_silent(temp_directory+"\vpatcher.dll",'-q "'+argument0+'"')
    fn=filename_change_ext(argument0,"_vfix.exe")
    if (file_exists(fn)) {
        file_delete(argument0)
        file_rename(fn,argument0)
        if (!foldermode) show_message("Vpatch successful!")
    } else if (!foldermode) show_message("Vpatch failed to apply!##This could mean the game is already patched.")
}

count+=1
