package 
{
	import flash.display.MovieClip;
	import flash.events.Event;

	
	public class Obstacles extends DestructibleObjects   
	{
		public var rPosition:Number;
		public var _main:Main;
		public function Obstacles(main:Main)
		{
			_main = main;
		
			this.addEventListener(Event.ENTER_FRAME, PositieBepaling);
		}
		public function PositieBepaling(e:Event):void
		{
			
			if (this.x < 0) {
				
				
				this.removeEventListener(Event.ENTER_FRAME, PositieBepaling);
				//trace("!!");
				_main.removeChild(this); 
				var s:Array = _main.deObstacles;
				s.splice(s.indexOf(this), 1);
				
				//trace("array" + s);
				
			}
		}
	}
	
}