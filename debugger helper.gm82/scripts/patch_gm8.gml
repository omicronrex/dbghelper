//apply gm8x_fix

execute_silent(temp_directory+"\gm8x_fix.dll",'-s "'+argument0+'"')
if (file_exists(argument0+".bak")) {
    file_delete(argument0+".bak")
    if (!foldermode) show_message("GM8 patch successful!")
} else if (!foldermode) show_message("GM8 patch failed to apply!##This could mean the game is already patched.")
count+=1