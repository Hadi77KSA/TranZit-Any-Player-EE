init()
{
	thread onPlayerConnect();
	thread safety_light_power_off_listen();
	thread safety_light_power_on_listen();
}

onPlayerConnect()
{
	for (;;)
	{
		level waittill( "connected", player );
		player thread display_mod_message();
	}
}

display_mod_message()
{
	self endon( "disconnect" );
	common_scripts\utility::flag_wait( "initial_players_connected" );
	self iPrintLn( "^3Any Player EE Mod ^5TranZit Richtofen Solo" );
}

safety_light_power_off_listen()
{
	for (;;)
	{
		level waittill( "safety_light_power_off" );
		thread safety_light_power_off_solo();
	}
}

safety_light_power_on_listen()
{
	for (;;)
	{
		level waittill( "safety_light_power_on" );
		thread safety_light_power_on_solo();
	}
}

safety_light_power_off_solo()
{
		wait 0.05;

		if ( getPlayers().size == 1 && level.sq_progress[ "rich" ][ "C_screecher_light" ] == 1 )
			level.sq_progress[ "rich" ][ "C_screecher_light" ] += 2;
}

safety_light_power_on_solo()
{
		wait 0.05;

		if ( getPlayers().size == 1 && level.sq_progress[ "rich" ][ "C_screecher_light" ] == 1 )
			level.sq_progress[ "rich" ][ "C_screecher_light" ]++;
}
