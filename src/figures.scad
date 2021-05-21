/* [Main] */
//Nmber of fragments
fn=100;
//Offset betwean figures
offset=10;

/* [Prism] */
prism_visible=true;
prism_radius=25;
prism_height=70;
prism_base_sides=6;
prism_twist_angle=0;

/* [Pyramid] */
pyramid_visible=true;
pyramid_radius=25;
pyramid_height=70;
pyramid_base_sides=6;

/* [Sphere] */
sphere_visible=true;
sphere_radius=25;

module prism_def()
{       
    linear_extrude(height = prism_height, twist = prism_twist_angle, $fn=1000)
    {
        circle(prism_radius, $fn=prism_base_sides);
    }
    children();
}

module pyramid_def()
{
    cylinder(h=pyramid_height, r1=pyramid_radius, r2=0, $fn=pyramid_base_sides);
    children();
}

module sphere_def()
{
    sphere(r=sphere_radius, $fn=fn);
    children();
}

module add_pyramid()
{
    if(pyramid_visible)
    {
        translate([pyramid_radius,0,0])
        pyramid_def()
        translate([pyramid_radius*2+offset,0,0])
        children();
    }
    else
    {
        children();
    }
}

module add_prism()
{
    if(prism_visible)
    {
        translate([prism_radius,0,0])
        prism_def()
        translate([prism_radius*2+offset,0,0])
        children();
    }
    else
    {
        children();
    }
}

module add_sphere()
{
    if(sphere_visible)
    {
        translate([sphere_radius,0,sphere_radius])
        sphere_def()
        translate([sphere_radius*2+offset,0,-sphere_radius])
        children();
    }
    else
    {
        children();
    }
}

add_prism()
add_pyramid()
add_sphere();

