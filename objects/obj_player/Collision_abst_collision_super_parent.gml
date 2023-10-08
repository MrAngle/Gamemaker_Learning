// If there wasn't a collision
// in the previous X position
var l4FA8D836_0 = instance_place(xprevious, y, [abst_collision_super_parent]);
if (!(l4FA8D836_0 > 0))
{
	// Then move back to that
	// point on the X axis
	x = xprevious;
	y = y;
}

else
{
	// If there wasn't a collision
	// in the previous y position
	var l4179BEC2_0 = instance_place(x, yprevious, [abst_collision_super_parent]);
	if (!(l4179BEC2_0 > 0))
	{
		// Then move back to that
		// point on the Y axis
		x = x;
		y = yprevious;
	}

	else
	{
		// Otherwise just move back
		// on both X and Y axes
		x = xprevious;
		y = yprevious;
	}
}