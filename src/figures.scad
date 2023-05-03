/* [Main] */
//Nmber of fragments
fn=100;
//Offset betwean figures
offset=10;

/* [Prism] */
prism_visible=true;
prism_radius=25;
prism_height=60;
prism_base_sides=6;
prism_twist_angle=0;

/* [Pyramid] */
pyramid_visible=true;
pyramid_radius=25;
pyramid_height=60;
pyramid_base_sides=6;

/* [Sphere] */
sphere_visible=true;
sphere_radius=25;

/* [Tetrahedron] */
tetrahedron_visible=true;
tetrahedron_radius=35;

/* [Cuboid] */
cuboid_visible = true;
cuboid_width = 45;
cuboid_depth = 20;
cuboid_height = 60;

/* [Prism Triangle Base] */
prism_triangle_base_visible = true;
prism_triangle_base_height = 60;
prism_triangle_base_width = 40;
prism_triangle_base_depth = 30;


module cuboid_def()
{
        cube([cuboid_width, cuboid_depth, cuboid_height]);
}

module add_cuboid()
{
    if(cuboid_visible)
    {
        translate([0,-cuboid_depth/2,0])
        cuboid_def();
        translate([cuboid_width+offset,0,0])
        children();
    }
    else
    {
        children();
    }
    
}

module prism_def()
{       
    linear_extrude(height = prism_height, twist = prism_twist_angle, $fn=1000)
    {
        circle(prism_radius, $fn=prism_base_sides);
    }
}

module add_prism()
{
    if(prism_visible)
    {
        translate([prism_radius,0,0])
        prism_def();
        translate([prism_radius*2+offset,0,0])
        children();
    }
    else
    {
        children();
    }
}

module pyramid_def()
{
    cylinder(h=pyramid_height, r1=pyramid_radius, r2=0, $fn=pyramid_base_sides);
}

module add_pyramid()
{
    if(pyramid_visible)
    {
        translate([pyramid_radius,0,0])
        pyramid_def();
        translate([pyramid_radius*2+offset,0,0])
        children();
    }
    else
    {
        children();
    }
}

module sphere_def()
{
    sphere(r=sphere_radius, $fn=fn);
}

module add_sphere()
{
    if(sphere_visible)
    {
        translate([sphere_radius,0,sphere_radius])
        sphere_def();
        translate([sphere_radius*2+offset,0,0])
        children();
    }
    else
    {
        children();
    }
}

module tetrahedron_def()
{
    h=tetrahedron_radius*sqrt(2);
    cylinder(r1=tetrahedron_radius, r2=0, h=h, $fn=3);
}

module add_tetrahedron()
{
    if(tetrahedron_visible)
    {
        translate([tetrahedron_radius/2,0,0])
        tetrahedron_def();
        translate([tetrahedron_radius*3/2+offset,0,0])
        children();
    }
    else
    {
        children();
    }
}

module prism_triangle_base_def()
{
    linear_extrude(height=prism_triangle_base_height)
    {
        polygon(points=[[0,0],[prism_triangle_base_width,0], [0,prism_triangle_base_depth]]);
    }
}

module add_prism_triangle_base()
{
    if(prism_triangle_base_visible)
    {
        translate([0,-prism_triangle_base_depth/2,0])
        prism_triangle_base_def();
        translate([prism_triangle_base_width+offset,0,0])
        children();
    }
    else
    {
        children();
    }
}


add_prism()
add_pyramid()
add_sphere()
add_tetrahedron()
add_cuboid()
add_prism_triangle_base();