var exe,path,gamename,dir,f;

exe=argument0

backup(exe)

path=filename_dir(exe)+"\"

gamename=filename_remove_ext(filename_name(exe))

dir=path+gamename

directory_create(dir)

dir+="\"

sevenzed('e -y -o"'+dir+'" "'+exe+'" *')

export_include_file_location("DBGHELP.dll",dir+"DBGHELP.dll")

f=file_find_first(dir+"*.exe",0) file_find_close()

if (!foldermode) if (!file_exists(dir+f)) {
    show_message("Something went wrong!##Sorry!")
    exit
}

file_rename(dir+f,dir+gamename+".exe")

file_delete(dir+"options.ini")

//patch sleep margin!
// sami <3
patch_sleep(dir+"\")

file_delete(exe)

count+=1
if (!foldermode) {
    show_message("GM Studio patch successful!")
    execute_shell(dir,"")
}
