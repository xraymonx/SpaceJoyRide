package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author lorenzo
	 */
	public class Eyyoikbentheo extends Sprite
	{
		[Embed(source="../art/EEYOO_IK_BEN_THEOOO.png")]
		private var theo1Art:Class;
		private var theoArt:Bitmap;
		
		public function Eyyoikbentheo() 
		{
			theoArt = new theo1Art();
			addChild(theoArt);
			
			theoArt.scaleX = .4;
			theoArt.scaleY = .4;
			this.y = 50;
			this.x = 100;
		}
		
	}

}