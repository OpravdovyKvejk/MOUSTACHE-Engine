///d3d_draw_floor_3d(x1,y1,x2,y2,x3,y3,z,height,texture)
texture_set_repeat(true);
d3d_primitive_begin_texture(pr_trianglelist,argument8);
        d3d_vertex_texture(argument0,argument1,argument6,0,0);
        d3d_vertex_texture(argument2,argument3,argument6,0,line_get_length(argument0,argument1,argument2,argument3)/8);
        d3d_vertex_texture(argument4,argument5,argument6,line_get_length(argument2,argument3,argument4,argument5)/8,line_get_length(argument0,argument1,argument2,argument3)/8);
        
        d3d_vertex_texture(argument0,argument1,argument6+argument7,0,0);
        d3d_vertex_texture(argument2,argument3,argument6+argument7,0,line_get_length(argument0,argument1,argument2,argument3)/8);
        d3d_vertex_texture(argument4,argument5,argument6+argument7,line_get_length(argument2,argument3,argument4,argument5)/8,line_get_length(argument0,argument1,argument2,argument3)/8);
d3d_primitive_end();
texture_set_repeat(false);

d3d_draw_wall(argument0,argument1,argument6,argument2,argument3,argument6+argument7,argument8,line_get_length(argument0,argument1,argument2,argument3)/8,-argument7/8);
d3d_draw_wall(argument2,argument3,argument6,argument4,argument5,argument6+argument7,argument8,line_get_length(argument0,argument1,argument2,argument3)/8,-argument7/8);
d3d_draw_wall(argument4,argument5,argument6,argument0,argument1,argument6+argument7,argument8,line_get_length(argument0,argument1,argument2,argument3)/8,-argument7/8);
