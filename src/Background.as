package  
{
	import flash.display.Sprite;
	import flash.display.Bitmap;	

	
	public var lives:lives; 
	
	public class Background extends Sprite
	{
		[Embed(source = "../art/spaceDark.jpg")]
		private var BGImage1:Class;
		private var imageInstance:Bitmap;
		
		public function Background():void
		{
			imageInstance = new BGImage1();
			addChild(imageInstance);
			 
			
			
		}
		
	}

}