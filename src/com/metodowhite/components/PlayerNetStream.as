package com.metodowhite.components
{
	import flash.net.NetConnection;
	import flash.net.NetStream;
	
	public dynamic class PlayerNetStream extends NetStream
	{
		public function PlayerNetStream(nc:NetConnection)
		{
			super(nc);
		}
	}
}