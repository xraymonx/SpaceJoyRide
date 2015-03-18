package 
{
	import flash.display.MovieClip;
	import flash.events.Event;

	
	public class Obstacles extends DestructibleObjects   
	{
		public var rPosition:Number;
		
		public function Obstacles()
		{
			
		
			this.addEventListener(Event.ENTER_FRAME, PositieBepaling);
		}
		public function PositieBepaling(e:Event):void
		{
		for (var i:int = 0; i < 6; i++)
			{
			rPosition = Math.random() * stage.stageHeight; // ik heb geen idee waar ik dit moet plaatsen.. het moet maar 5x gedaan worden en op de verschillende stenen.
			}	
			trace(rPosition);
			
		}
	}
	
}