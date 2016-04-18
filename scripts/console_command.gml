///console_command(command)
var commandSuccesful=false;

consoleText+="   Console: "+string(argument0)+"#";

switch (argument0){
    case "exit" : game_end();
                    commandSuccesful=true;
        break;
    case "restart" : game_restart();
                        commandSuccesful=true;
        break;
    case "toTheSkies" : oCamera.z+=200;
                        commandSuccesful=true;
        break;
}
if (string_pos("echo",argument0)!=0){
    consoleText+=string_delete(argument0,1,4)+"#";
    commandSuccesful=true;
}
if (string_pos("ghost",argument0)!=0){
    if (string_delete(argument0,1,5)="?"){
        consoleText+="ghost = "+string(oCamera.isGhost)+"#";
    }else{
        oCamera.isGhost=real(string_delete(argument0,1,5));
    }
    commandSuccesful=true;
}
if (string_pos("active",argument0)!=0){
    if (string_delete(argument0,1,6)="?"){
        consoleText+="active = "+string(oCamera.sectorZ)+"#";
    }
    commandSuccesful=true;
}


if (!commandSuccesful){
    consoleText+="Command "+string(argument0)+" was not recognized.#";
}
