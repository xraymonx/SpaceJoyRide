package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Raymon Zoetigheid
	 */
	public class Player extends Obstacles
	{
									
		private var spaceshipArt:SpaceshipArt; //hier moet de swc komen
		private var droppingPower:int = 5; //met hoeveel hij zakt. ( de stijging moet groter zijn dan dit )

		public function Player()
		{
			spaceshipArt = new SpaceshipArt();
			
			this.addChild(spaceshipArt);
			
			this.addEventListener(Event.ENTER_FRAME, Grafity);
		}
		
		
		public function Grafity(e:Event):void
		{
			this.y = this.y + droppingPower;
			
		}
		
	}
		
}
	
