package 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Raymon Zoetigheid
	 */
	public class Main extends Sprite 
	{
		private var stenen:Array;
		private var bg:Background;
		public static var spaceship:Player;
		private var rLocation:Number; //om de positie van de steen te bepalen of obstakels
		
		public function get deStenen():Array
		{
			return stenen;
		}
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			bg = new Background();
			addChild(bg);//zet achtergrond in de game
			
			createStenen();
			
			spaceship = new Player();
            addChild(spaceship);
                       
                       
            spaceship.y = stage.stageHeight * 0.5;
            spaceship.x = stage.stageWidth * 0.1;
            spaceship.rotation = 90;
            spaceship.scaleX = 0.3;
            spaceship.scaleY = 0.3;
		}
		
		
		private function createStenen():void
		{
			stenen = new Array();
			
			for (var i:int = 0; i < 2; i++ )
			{
				stenen.push(new Steen(this));
				addChildAt(stenen[i], i + 1);	
				
			}
		}
		
	}
	
}