var list,folder,total,log,i,f,mem;

with (Helper) {
    list=ds_list_create()

    if (argument_count) folder=argument[0]
    else folder=filename_dir(get_save_filename("Select a folder|","folder"))
    if (folder="") exit

    text="Loading..."
    text2="Searching for games..."
    time=0
    screen_redraw()

    recursive_file_find(list,folder+"\")

    count=0
    total=0
    foldermode=1

    log=file_text_open_write("log.txt")
    file_text_write_string(log,"Debugger Helper v0.44 batch patch log")
    file_text_writeln(log)
    file_text_write_string(log,date_datetime_string(date_current_datetime()))
    file_text_writeln(log)
    file_text_writeln(log)

    i=0
    repeat (ds_list_size(list)) {
        f=ds_list_find_value(list,i)
        if (string_lower(filename_ext(f))==".exe") {
            total+=1
            mem=count
            patch(f)
            if (count>mem) file_text_write_string(log,"✔ ")
            else file_text_write_string(log,"❌ ")
            file_text_write_string(log,filename_name(f))
            file_text_writeln(log)
        }
        i+=1
    }

    file_text_writeln(log)
    file_text_write_string(log,string(total)+" games found")
    file_text_writeln(log)
    file_text_write_string(log,string(count)+" games patched")
    file_text_close(log)

    foldermode=0
    ds_list_destroy(list)

    show_message("Batch Patch complete!##"+string(total)+" games found#"+string(count)+" games patched##More details in the log.")
    execute_program("notepad",working_directory+"\log.txt",0)
}
