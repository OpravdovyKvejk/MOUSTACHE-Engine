///collision_sector_ceiling_point(px,py,pz)
if (point_in_rectangle(argument0,argument1,x1,y1,x2,y2)){
    if (point_get_z_collision_ext(argument2,ceilingZ,ceilingZ+ceilingHeight)){
        return true;
    }else{
        return false;
    }
}else{
    return false;
}
