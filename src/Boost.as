package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author lorenzo
	 */
	public class Boost extends Obstacles
	{
		private var boost1art:boost;
		
		private var speed:Number = -5; 
		
		public function Boost(main:Main) 
		{
			super(main);
			
			boost1art = new boost();
			this.addChild(boost1art);
			
			boost1art.scaleX = 0.175;
			boost1art.scaleY = 0.175;
			
			this.x = 900;
			this.y = Math.random() * 550;
			
			this.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void
		{
			this.x += speed;
		}
	}

}