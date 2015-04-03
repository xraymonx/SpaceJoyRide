package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Raymon Zoetigheid
	 */
	public class Player extends DestructibleObjects
	{
									
		private var spaceshipArt:SpaceshipArt; //hier moet de swc komen
		private var droppingPower:int = 40; //met hoeveel hij zakt. ( de stijging moet groter zijn dan dit )
		private var risingPower:int = 40;
		private var moveYN:Boolean = true;
		
		public function Player()
		{
			spaceshipArt = new SpaceshipArt();
			
			this.addChild(spaceshipArt);
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
				stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
				stage.addEventListener(KeyboardEvent.KEY_UP, KeyUp);
				addEventListener(Event.ENTER_FRAME, Grafity);
				addEventListener(Event.ENTER_FRAME, movePlayer); //plaats hier alle eventlisteners.
		}
		
		public function KeyUp(e:KeyboardEvent):void // wanneer spatie word losgelaten, word de moveYN waar. ( waardoor hij zakt
		{
			if(e.keyCode == Keyboard.SPACE) {
				moveYN = true
			}
		}
			
		public function keyDown(e:KeyboardEvent):void // wanneer spatie word ingedrukt, word de moveYN nietwaar, en gaat hij steigen
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				moveYN = false; 
				
			}
			
		}
		
		public function movePlayer(e:Event):void 
		{
			if(!moveYN) {
				spaceshipArt.x = spaceshipArt.x - risingPower; //wanneer MoveYN (yes or no ) niet waar is gaat hij steigen.
				spaceshipArt.rotation = -10;
			}
		}
		
		public function Grafity(e:Event):void // zorgt ervoor dat hij zakt.
		{
			if(moveYN) {
				spaceshipArt.x = spaceshipArt.x + droppingPower;
				spaceshipArt.rotation = 10;
			}
		}
		
		
	}
		
}
	
