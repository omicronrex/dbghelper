var fn,b,b2,mem,byte,size,meg;

if (argument_count) fn=argument[0]
else fn=get_open_filename("Game Maker game|*.exe",0)

text="Patching..."
text2=filename_name(fn)
time=0
screen_redraw()

if (fn!="") {
    size=file_size(fn)
    meg=1024*1024

    b=buffer_create()
    buffer_load_part(b,fn,0,min(size,3*meg))

    buffer_set_pos(b,0)
    repeat (4096) {
        if (chr(buffer_read_u8(b))="C")
        if (chr(buffer_read_u8(b))="A")
        if (chr(buffer_read_u8(b))="B")
        if (chr(buffer_read_u8(b))="I")
        if (chr(buffer_read_u8(b))="N")
        if (chr(buffer_read_u8(b))="E")
        if (chr(buffer_read_u8(b))="T") {
            buffer_destroy(b)

            //this is a cabinet, let's find out if it's a studio game
            //extract options.ini?
            sevenzed('e -y -o"'+temp_directory+'\" "'+fn+'" "options.ini"')
            if (file_exists(temp_directory+"\options.ini")) {
                file_delete(temp_directory+"\options.ini")
                //studio game
                patch_studio(fn)
            } else {
                //no options.ini, let's try data.win instead
                //just to be sure
                sevenzed('e -y -o"'+temp_directory+'\" "'+fn+'" "data.win"')
                if (file_exists(temp_directory+"\data.win")) {
                    file_delete(temp_directory+"\data.win")
                    patch_studio(fn)
                } else {
                    if (!foldermode) show_message("This is a cabinet but it's not a Studio game!")
                }
            }
            exit
        }
    }

    //check the end of the file for YoYo manifest
    b2=buffer_create()
    buffer_load_part(b2,fn,size-meg,meg)

    //regular studio runner
    buffer_set_pos(b2,meg-2048)
    repeat (2048) {
        if (chr(buffer_read_u8(b2))="M")
        if (chr(buffer_read_u8(b2))="a")
        if (chr(buffer_read_u8(b2))="k")
        if (chr(buffer_read_u8(b2))="e")
        if (chr(buffer_read_u8(b2))="r")
        if (chr(buffer_read_u8(b2))=".")
        if (chr(buffer_read_u8(b2))="R")
        if (chr(buffer_read_u8(b2))="u")
        if (chr(buffer_read_u8(b2))="n")
        if (chr(buffer_read_u8(b2))="n")
        if (chr(buffer_read_u8(b2))="e")
        if (chr(buffer_read_u8(b2))="r") {
            //it's already extracted!
            buffer_destroy(b)
            buffer_destroy(b2)
            patch_sleep(fn)
            if (!file_exists(filename_dir(fn)+"\DBGHELP.dll")) {
                export_include_file_location("DBGHELP.dll",filename_dir(fn)+"\DBGHELP.dll")
            }
            if (!foldermode) show_message("GM Studio patch successful!")
            count+=1
            exit
        }
    }
    //this check can go overboard and so we gotta clean up
    buffer_clear_error(b2)

    //check for a YYC exe (relocation table after manifest)
    buffer_set_pos(b2,meg-276428)
    repeat (2048) {
        if (chr(buffer_read_u8(b2))="M")
        if (chr(buffer_read_u8(b2))="a")
        if (chr(buffer_read_u8(b2))="k")
        if (chr(buffer_read_u8(b2))="e")
        if (chr(buffer_read_u8(b2))="r")
        if (chr(buffer_read_u8(b2))=".")
        if (chr(buffer_read_u8(b2))="R")
        if (chr(buffer_read_u8(b2))="u")
        if (chr(buffer_read_u8(b2))="n")
        if (chr(buffer_read_u8(b2))="n")
        if (chr(buffer_read_u8(b2))="e")
        if (chr(buffer_read_u8(b2))="r") {
            //it's already extracted!
            buffer_destroy(b)
            buffer_destroy(b2)
            if (!file_exists(filename_dir(fn)+"\DBGHELP.dll")) {
                export_include_file_location("DBGHELP.dll",filename_dir(fn)+"\DBGHELP.dll")
                if (!foldermode) show_message("GM Studio YYC patch successful!")
            } else if (!foldermode) show_message("This GM Studio YYC game is already patched!")
            count+=1
            exit
        }
    }
    buffer_destroy(b2)

    //so anyway if it gets here it's probably not a studio game

    //detect mmf2
    buffer_set_pos(b,243248)
    if (chr(buffer_read_u8(b))="m")
    if (chr(buffer_read_u8(b))="m")
    if (chr(buffer_read_u8(b))="f")
    if (chr(buffer_read_u8(b))="s")
    if (chr(buffer_read_u8(b))="2")
    if (chr(buffer_read_u8(b))=".")
    if (chr(buffer_read_u8(b))="d")
    if (chr(buffer_read_u8(b))="l")
    if (chr(buffer_read_u8(b))="l") {
        count+=1
        buffer_destroy(b)
        if (!foldermode) show_message("This is a Multimedia Fusion 2 game and can't be patched!")
        exit
    }

    //lets just run a quick test for gm7 first
    buffer_set_pos(b,1451105)
    if (chr(buffer_read_u8(b))="V")
    if (chr(buffer_read_u8(b))="e")
    if (chr(buffer_read_u8(b))="r")
    if (chr(buffer_read_u8(b))="s")
    if (chr(buffer_read_u8(b))="i")
    if (chr(buffer_read_u8(b))="o")
    if (chr(buffer_read_u8(b))="n")
    if (chr(buffer_read_u8(b))=" ")
    if (chr(buffer_read_u8(b))="7") {
        count+=1
        buffer_destroy(b)
        patch_gm8(fn,0)
        exit
    }

    //ok now let's try to identify gm8
    buffer_set_pos(b,0)

    //upx signature check
    repeat (4096) {
        if (chr(buffer_read_u8(b))="U")
        if (chr(buffer_read_u8(b))="P")
        if (chr(buffer_read_u8(b))="X") {
            //upx gm8 detected
            buffer_destroy(b)
            patch_gm8(fn,0)
            exit
        }
    }

    //gm8.0 magic number check
    buffer_set_pos(b,1329856)
    if (buffer_read_u32(b)==2000000) {
        //bang. gm 8.0 detected
        buffer_destroy(b)
        patch_gm8(fn,1)
        exit
    }

    //gm8.0 with weird shit detection
    buffer_set_pos(b,1442880)
    repeat (1024) {
        if (chr(buffer_read_u8(b))="G")
        if (chr(buffer_read_u8(b))="a")
        if (chr(buffer_read_u8(b))="m")
        if (chr(buffer_read_u8(b))="e")
        if (chr(buffer_read_u8(b))=" ")
        if (chr(buffer_read_u8(b))="M")
        if (chr(buffer_read_u8(b))="a")
        if (chr(buffer_read_u8(b))="k")
        if (chr(buffer_read_u8(b))="e")
        if (chr(buffer_read_u8(b))="r") {
            //gm8 brute force detection
            buffer_destroy(b)
            patch_gm8(fn,1)
            exit
        }
    }

    //gm8.1 magic number check

    buffer_set_pos(b,2254998)
    if (buffer_read_u32(b)==810) {
        //bingo! there you go specifically k3
        buffer_destroy(b)
        patch_gm8(fn,1)
        exit
    }

    //gm8.1 brute force check
    buffer_set_pos(b,1900000)
    repeat (400000) {
        byte=buffer_read_u8(b)

        //8.1's 3800000
        if (byte==$c4)
        if (buffer_read_u8(b)==$fb)
        if (buffer_read_u8(b)==$39)
        if (buffer_read_u8(b)==$00) {
            //gm 8.1 detected
            buffer_destroy(b)
            patch_gm8(fn,1)
            exit
        }

        //8.2's 3560000
        if (byte==$44)
        if (buffer_read_u8(b)==$52)
        if (buffer_read_u8(b)==$36)
        if (buffer_read_u8(b)==$00) {
            //gm 8.2 detected
            buffer_destroy(b)
            count+=1
            if (!foldermode) show_message("Game Maker 8.2 game detected!##Patches already present.")
            exit
        }
    }

    //¯\_(ツ)_/¯
    buffer_destroy(b)
    if (!foldermode) show_message("This is probably not a Game Maker game of any kind!")
}
