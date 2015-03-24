package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author lorenzo
	 */
	public class Steen extends Obstacles  //met animatie<= movieclip
	{
		[Embed(source = "../art/steen.png")]
		private var Steen1Art:Class;
		private var steenArt:Bitmap;
		private var speed:Number = -5; // negatief, anders gaat ie naar rechts toe.

		public function Steen() 
		{
			steenArt = new Steen1Art();
			addChild(steenArt);
			
			steenArt.scaleX = 0.175;
			steenArt.scaleY = 0.175;
			
			this.x = 900;
			this.y = Math.random() * 500;				//rPosition;		//positie bepaling ( en dit ook nog ) 
			
			this.addEventListener(Event.ENTER_FRAME, loop); //activeerd de function LOOP
		}
		
		private function loop(e:Event):void
		{
		this.x += speed;
		this.rotation += 10;
		
				
		}
				
		
	}
		
	
}