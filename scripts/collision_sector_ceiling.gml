///collision_sector_ceiling(px,py,pz,pheight)
if (point_in_rectangle(argument0,argument1,x1,y1,x2,y2)){
    if (plane_get_z_collision_ext(ceilingZ,ceilingHeight,argument2,argument3)){
        return true;
    }else{
        return false;
    }
}else{
    return false;
}
