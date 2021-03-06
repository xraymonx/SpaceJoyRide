package  
{
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author lorenzo
	 */
	public class Satellite extends Obstacles
	{
		private var satelliteArt:satalite;
		private var speed:Number = -5;
		
		public function Satellite(main:Main) 
		{
			super(main);
			
			satelliteArt = new satalite();
			this.addChild(satelliteArt);
			
			satelliteArt.scaleX = 0.15;
			satelliteArt.scaleY = 0.15;
			
			this.x = 900;
			this.y = Math.random() * 550;	
			
			this.scaleX = 2;
			this.scaleY = 2;
			
			this.rotation = 90;
			
			
			this.addEventListener(Event.ENTER_FRAME, loop); 
		}
		
		private function loop(e:Event):void
		{
			this.x += speed;
			//rotate
		}
		
	}

}