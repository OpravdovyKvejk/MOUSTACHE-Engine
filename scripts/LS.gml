#define LS
///LS

#define LS_create
///LS_create()
globalvar Ufogc,Ufogr,Ulights,Ulcolor,Ulight,Udcolor,Udlight,Uambience,LSpos,LScol,LSspos,LSscol,LSdpos,LSdcol,LSamb,LSnum,fogc,fogr,foge;
Ufogc = shader_get_uniform(shdLight,"fogcolor");
Ufogr = shader_get_uniform(shdLight,"fogrange");
Ulights = shader_get_uniform(shdLight,"lights");
Ulcolor = shader_get_uniform(shdLight,"lcolor");
Ulight = shader_get_uniform(shdLight,"light");
Udlight = shader_get_uniform(shdLight,"dlight");
Udcolor = shader_get_uniform(shdLight,"dcolor");
Uambience = shader_get_uniform(shdLight,"ambience");
LSamb = 0;
LSnum = 8;
LSdnum = 8;
//Point ight position and color
LSpos[31] = 0;
LScol[23] = 0;
//Sorted light position and color
LSspos[31] = 0;
LSscol[23] = 0;
//Direction light position and color
LSdpos[23] = 0;
LSdcol[23] = 0;
fogc = c_black;
fogr[1] = 0;
foge = 0;


#define LS_set_lighting
///LS_set_lighting(enable)
if argument0
{    
    //Apply
    shader_set(shdLight)
    shader_set_uniform_f_array(Ulight,LSspos)
    shader_set_uniform_f_array(Ulcolor,LSscol)
    shader_set_uniform_f_array(Udlight,LSdpos)
    shader_set_uniform_f_array(Udcolor,LSdcol)
    shader_set_uniform_f(Uambience,colour_get_red(LSamb)/255,colour_get_green(LSamb)/255,colour_get_blue(LSamb)/255)
    shader_set_uniform_f(Ufogc,colour_get_red(fogc)/255,colour_get_green(fogc)/255,colour_get_blue(fogc)/255)
    shader_set_uniform_f(Ufogr,fogr[0],fogr[1],foge)
    //texture_set_stage(shader_get_sampler_index(shdLight_normal,"normal"),background_get_texture(bac_normal))
}
else
{
    shader_reset()
}


#define LS_set_ambience
///LS_set_ambience(ambient color)
LSamb = argument0;


#define LS_set_point_light
///LS_set_point_light(point light id,x,y,z,range,color)
var i,X,Y,Z,r,c;
i = argument0;
X = argument1;
Y = argument2;
Z = argument3;
r = argument4;
c = argument5;

//LSnum = i;
LSpos[i*4] = X;
LSpos[i*4+1] = Y;
LSpos[i*4+2] = Z;
LSpos[i*4+3] = r;
LScol[i*3] = colour_get_red(c)/255;
LScol[i*3+1] = colour_get_green(c)/255;
LScol[i*3+2] = colour_get_blue(c)/255;
//Sorted coordinates
LSspos[i*4] = X;
LSspos[i*4+1] = Y;
LSspos[i*4+2] = Z;
LSspos[i*4+3] = r;
LSscol[i*3] = colour_get_red(c)/255;
LSscol[i*3+1] = colour_get_green(c)/255;
LSscol[i*3+2] = colour_get_blue(c)/255;


#define LS_set_directional_light
///LS_set_directional_light(directional light id,x,y,z,color)
var i,X,Y,Z;
i = argument0;
X = argument1;
Y = argument2;
Z = argument3;
c = argument4;

//LSnum = i;
LSdpos[i*3] = X;
LSdpos[i*3+1] = Y;
LSdpos[i*3+2] = Z;
LSdcol[i*3] = colour_get_red(c)/255;
LSdcol[i*3+1] = colour_get_green(c)/255;
LSdcol[i*3+2] = colour_get_blue(c)/255;


#define LS_set_nearest
///LS_set_nearest(x,y,z)
var X,Y,Z;
X = argument0;
Y = argument1;
Z = argument2;
var order,tpos,tcol,pri;
order = ds_priority_create();
for(var i = 0;i<LSnum;i++)
{   
    tpos[i*4] = LSpos[i*4];
    tpos[i*4+1] = LSpos[i*4+1];
    tpos[i*4+2] = LSpos[i*4+2];
    tpos[i*4+3] = LSpos[i*4+3];
    
    tcol[i*3] = LScol[i*3];
    tcol[i*3+1] = LScol[i*3+1];
    tcol[i*3+2] = LScol[i*3+2];
    ds_priority_add(order,i,point_distance_3d(X,Y,Z,LSpos[i*4],LSpos[i*4+1],LSpos[i*4+2]));
}
for(var i = 0;i<LSnum;i++)
{
    pri = ds_priority_delete_min(order);
    LSspos[i*4] = tpos[pri*4];
    LSspos[i*4+1] = tpos[pri*4+1];
    LSspos[i*4+2] = tpos[pri*4+2];
    LSspos[i*4+3] = tpos[pri*4+3];
    
    LSscol[i*3] = tcol[pri*3];
    LSscol[i*3+1] = tcol[pri*3+1];
    LSscol[i*3+2] = tcol[pri*3+2];
}
ds_priority_destroy(order)


#define LS_set_fog
///LS_set_fog(enable,color,start,end)
foge = argument0;
fogc = argument1;
fogr[0] = argument2;
fogr[1] = argument3;