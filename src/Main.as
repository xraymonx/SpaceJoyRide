package 
{
	import adobe.utils.CustomActions;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Raymon Zoetigheid
	 */
	public class Main extends Sprite 
	{
		private var RandomNumber:int = Math.floor(Math.random() * 60 + 60);//gebruikt in de loop om satellites te spawnen, hij spawnt ze random van 60 tot 120,je moet * het minimale getal en dan het max getal dat je wilt daar moet je het * van af trekken dat is de +(dus 120-60=60.
		private var satellites:Array;
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
			
			//createStenen();
			
			//createSatellites();
			addEventListener(Event.ENTER_FRAME, loop2);
			addEventListener(Event.ENTER_FRAME, loop);
			
			//addEventListener(Event.ENTER_FRAME, createStenen);//voert createStenen uit
			
			spaceship = new Player();
            addChild(spaceship);
            
			
                       
            spaceship.y = stage.stageHeight * 0.5;
            spaceship.x = stage.stageWidth * 0.1;
            spaceship.rotation = 90;
            spaceship.scaleX = 0.3;
            spaceship.scaleY = 0.3;
		}
		private var counter:int = 0;
		private var counter2:int = 0;
	
		private function loop2(e:Event):void
		{
			counter2++;
			
			if (counter2 == RandomNumber)
			{
				createSatellites();
				counter2 = 0;
			}
			//else if (counter2 > RandomNumber)//de else is er omdat de counter 2 soms boven random number komt(idk how) en dan stoppen de satellites met spawnen#magic
			//{
			//	counter2 = 0;
			//}
		}
		
		private function loop(e:Event):void
		{
			counter++;
			
			if (counter == 60)
			{
				createStenen();
				counter = 0;
			}
			
			
			//if (spaceship.hitTestObject(stenen)) //steen1art moet hierin.. hopelijk werkt het dan
			{
				//spaceship.destroy();
				//removeChild(spaceship);
				
			}
		}
		
		
		private function createStenen(/*e:Event*/):void
		{
			stenen = new Array();
			
			for (var i:int = 0; i < 2; i++ )
			{
				stenen.push(new Steen(this));
				addChildAt(stenen[i], i + 1);	
				
			}
		}
		
		private function createSatellites():void
		{
			satellites = new Array();
			
			for (var i:int = 0; i < 1; i++)
			{
				satellites.push(new Satellite(this));
				addChildAt(satellites[i], i + 1);
			}
		
		}
	}
}