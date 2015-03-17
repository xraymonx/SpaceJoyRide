package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Raymon Zoetigheid
	 */
	public class Player extends DestructibleObjects
	{
		
		private var spaceshipArt:SpaceshipArt; //hier moet de swc komen
		
		public function Player()
		{
			spaceshipArt = new SpaceshipArt();
			this.addChild(spaceshipArt);
		}
		
		
		/*public function Gravity()
		{
			var gravity = 0.5;
			player.speedY = 0;

			stage.addEventListener(Event.ENTER_FRAME, enterframe);
			function enterframe(e:Event) {

				player.speedY += gravity;
				player.y += player.speedY;
			}

		} */
	}
		
}
	
