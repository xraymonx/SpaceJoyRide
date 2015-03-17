package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author lorenzo
	 */
	public class Steen extends Sprite//met animatie<= movieclip
	{
		[Embed(source = "../art/steen.png")]
		private var Steen1Art:Class;
		private var steenArt:Bitmap;
		private var speed:Number = 5;
		
		public function Steen() 
		{
			steenArt = new Steen1Art();
			addChild(steenArt);
			
			steenArt.scaleX = 0.2;
			steenArt.scaleY = 0.2;
			
			this.x = 300;
			this.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void
		{
		this.x += speed;
		if (this.x > 500) {
			var r:Number = Math.random() * 800 - this.width;
				//lokale variabele bestaat alleen in deze function
				if (r < 0)
				{
					r += this.width;
				}				
				this.y = r;
				
				speed = -10;
		}
		
		}
	}
}