for(y = [0,1])
{
    for(x=[0:3])
    {
        translate([x*55,y*55,0])
        linear_extrude(1)
        text("*", 85, "Roboto:style=Bold");
    }
}