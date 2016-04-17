///trigger(triggerId,true/false)
if (instance_number(oCamera)){
    if (oCamera.iD=argument0){
        oCamera.triggered=argument1;
    }
    instance_deactivate_object(oCamera);
}
instance_activate_object(oCamera);

for (i=0;i<instance_number(oSlope);i++){
    var object=instance_nearest(0,0,oSlope);
    if (object.iD=argument0){
        object.triggered=argument1;
    }
    instance_deactivate_object(object);
}
instance_activate_object(oSlope);

for (i=0;i<instance_number(oLine);i++){
    var object=instance_nearest(0,0,oLine);
    if (object.iD=argument0){
        object.triggered=argument1;
    }
    instance_deactivate_object(object);
}
instance_activate_object(oLine);

for (i=0;i<instance_number(oSector);i++){
    var object=instance_nearest(0,0,oSector);
    if (object.iD=argument0){
        object.triggered=argument1;
    }
    instance_deactivate_object(object);
}
instance_activate_object(oSector);
