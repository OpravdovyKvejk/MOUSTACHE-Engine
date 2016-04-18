///level_load_custom()

var file=get_open_filename_ext("MOUSTACHE Map File|*.mmf", "", "C:\", "Load a custom map");
if (!file_exists(file)){
    show_message("Map file does not exist or is corrupted");
    exit;
}

mapFile=file_text_open_read(file);
while(!file_text_eof(mapFile)){
    mapFileLine=file_text_readln(mapFile);
    for(j=1;j<string_length(mapFileLine);j++){
        if(string_char_at(mapFileLine,1)="{"){
            if(string_pos("MAP",mapFileLine)=2){
                mapFileLine=file_text_readln(mapFile);
                if(string_pos("<ID>",mapFileLine)=1){
                    while(string_char_at(mapFileLine,1)!="{" and !file_text_eof(mapFile)){
                        mapFileLine=file_text_readln(mapFile);
                        if(string_char_at(mapFileLine,1)="["){
                            if(string_pos("WALL",mapFileLine)=2){
                                mapFileLine=file_text_readln(mapFile);
                                global.createX1=real(string_copy(mapFileLine,5,99999999));
                                mapFileLine=file_text_readln(mapFile);
                                global.createY1=real(string_copy(mapFileLine,5,99999999));
                                mapFileLine=file_text_readln(mapFile);
                                global.createX2=real(string_copy(mapFileLine,5,99999999));
                                mapFileLine=file_text_readln(mapFile);
                                global.createY2=real(string_copy(mapFileLine,5,99999999));
                                mapFileLine=file_text_readln(mapFile);
                                global.createZ=real(string_copy(mapFileLine,4,99999999));
                                mapFileLine=file_text_readln(mapFile);
                                global.createHeight=real(string_copy(mapFileLine,9,99999999));
                                mapFileLine=file_text_readln(mapFile);
                                global.createId=real(string_copy(mapFileLine,5,99999999));
                                with(instance_create(0,0,oLine)){
                                    x1=global.createX1;
                                    y1=global.createY1;
                                    x2=global.createX2;
                                    y2=global.createY2;
                                    z=global.createZ;
                                    height=global.createHeight;
                                    iD=global.createId;
                                }
                            }
                                if(string_pos("SECTOR",mapFileLine)=2){
                                    mapFileLine=file_text_readln(mapFile);
                                    global.createX1=real(string_copy(mapFileLine,5,99999999));
                                    mapFileLine=file_text_readln(mapFile);
                                    global.createY1=real(string_copy(mapFileLine,5,99999999));
                                    mapFileLine=file_text_readln(mapFile);
                                    global.createX2=real(string_copy(mapFileLine,5,99999999));
                                    mapFileLine=file_text_readln(mapFile);
                                    global.createY2=real(string_copy(mapFileLine,5,99999999));
                                    mapFileLine=file_text_readln(mapFile);
                                    global.createX3=real(string_copy(mapFileLine,5,99999999));
                                    mapFileLine=file_text_readln(mapFile);
                                    global.createY3=real(string_copy(mapFileLine,5,99999999));
                                    mapFileLine=file_text_readln(mapFile);
                                    global.createId=real(string_copy(mapFileLine,5,99999999));
                                    mapFileLine=file_text_readln(mapFile);
                                    global.createFloorZ=real(string_copy(mapFileLine,9,99999999));
                                    mapFileLine=file_text_readln(mapFile);
                                    global.createFloorHeight=real(string_copy(mapFileLine,14,99999999));
                                    mapFileLine=file_text_readln(mapFile);
                                    global.createCeilingZ=real(string_copy(mapFileLine,11,99999999));
                                    mapFileLine=file_text_readln(mapFile);
                                    global.createCeilingHeight=real(string_copy(mapFileLine,16,99999999));
                                    mapFileLine=file_text_readln(mapFile);
                                    global.isTrigger=real(string_copy(mapFileLine,12,99999999));
                                    mapFileLine=file_text_readln(mapFile);
                                    global.triggerId=real(string_copy(mapFileLine,12,99999999));
                                    with(instance_create(0,0,oSector)){
                                        x1=global.createX1;
                                        y1=global.createY1;
                                        x2=global.createX2;
                                        y2=global.createY2;
                                        x3=global.createX3;
                                        y3=global.createY3;
                                        iD=global.createId;
                                        floorZ=global.createFloorZ;
                                        floorHeight=global.createFloorHeight;
                                        ceilingZ=global.createCeilingZ;
                                        ceilingHeight=global.createCeilingHeight;
                                        isTrigger=global.isTrigger;
                                        triggerId=global.triggerId;
                                    }
                                }
                                if(string_pos("PLAYER",mapFileLine)=2){
                                    mapFileLine=file_text_readln(mapFile);
                                    global.createX=real(string_copy(mapFileLine,4,99999999));
                                    mapFileLine=file_text_readln(mapFile);
                                    global.createY=real(string_copy(mapFileLine,4,99999999));
                                    mapFileLine=file_text_readln(mapFile);
                                    global.createZ=real(string_copy(mapFileLine,4,99999999));
                                    mapFileLine=file_text_readln(mapFile);
                                    global.createId=real(string_copy(mapFileLine,5,99999999));
                                    with(instance_create(0,0,oCamera)){
                                        x=global.createX;
                                        y=global.createY;
                                        z=global.createZ;
                                        iD=global.createId;
                                        fov=global.fov;
                                        for(i=0;i<10;i++){
                                            weaponAmmo[i]=0;
                                        }
                                    }
                                }
                                if(string_pos("LIGHT",mapFileLine)=2){
                                    mapFileLine=file_text_readln(mapFile);
                                    global.createX=real(string_copy(mapFileLine,4,99999999));
                                    mapFileLine=file_text_readln(mapFile);
                                    global.createY=real(string_copy(mapFileLine,4,99999999));
                                    mapFileLine=file_text_readln(mapFile);
                                    global.createZ=real(string_copy(mapFileLine,4,99999999));
                                    mapFileLine=file_text_readln(mapFile);
                                    global.createId=real(string_copy(mapFileLine,5,99999999));
                                    with(instance_create(0,0,oLight)){
                                        x=global.createX;
                                        y=global.createY;
                                        z=global.createZ;
                                        iD=global.createId;
                                    }
                                }
                                if(string_pos("SLOPE",mapFileLine)=2){
                                    mapFileLine=file_text_readln(mapFile);
                                    global.createX=real(string_copy(mapFileLine,4,99999999));
                                    mapFileLine=file_text_readln(mapFile);
                                    global.createY=real(string_copy(mapFileLine,4,99999999));
                                    mapFileLine=file_text_readln(mapFile);
                                    global.createZ=real(string_copy(mapFileLine,4,99999999));
                                    mapFileLine=file_text_readln(mapFile);
                                    global.createId=real(string_copy(mapFileLine,5,99999999));
                                    with(instance_create(0,0,oSlope)){
                                        x=global.createX;
                                        y=global.createY;
                                        z=global.createZ;
                                        iD=global.createId;
                                    }
                                }
                            }
                        }
                }
            }
        }
    }
}