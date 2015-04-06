package 
{
	import adobe.utils.CustomActions;
	import flash.automation.StageCaptureEvent;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TextEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author Raymon Zoetigheid
	 */
	public class Main extends Sprite 
	{		
		private var RandomNumber:int = Math.floor(Math.random() * 120 + 60);//gebruikt in de loop om satellites te spawnen, hij spawnt ze random van 60 tot 120,je moet * het minimale getal en dan het max getal dat je wilt daar moet je het * van af trekken dat is de +(dus 120-60=60.
		//private var satellites:Array;
		//private var stenen:Array;
		private var bg:Background;
		public static var spaceship:Player;
		private var rLocation:Number; //om de positie van de steen te bepalen of obstakels
		private var scoreboard:Scoreboard;
		private var theo:Eyyoikbentheo;
		
		
		public function get deObstacles():Array
		{
			return obstacles;
		}
		
		public function get deBoosts():Array
		{
			return boosts
		}
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		
		/*	private function Score(e:Event):void
		{
				var tf:TextFormat = new TextFormat();
				tf.size = 30;
				var myText:TextField = new TextField();
				addChild(myText);
				myText.defaultTextFormat = tf;
				myText.text = score.toString();
				myText.width = 70;
				myText.height = 60;
				myText.textColor = 0xFF0000;
		}*/
		
		private function init(e:Event = null):void 
		{
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			bg = new Background();
			addChild(bg);//zet achtergrond in de game
			
			theo = new Eyyoikbentheo();
			addChild(theo);
			
			//addEventListener(Event.ENTER_FRAME, PlayerPos);
			addEventListener(Event.ENTER_FRAME, loop3);
			addEventListener(Event.ENTER_FRAME, loop2);
			addEventListener(Event.ENTER_FRAME, loop);
			
			//addEventListener(Event.ENTER_FRAME, Score);
			
			scoreboard = new Scoreboard();
			addChild(scoreboard);
			
			spaceship = new Player();
            addChild(spaceship);
            
			boosts = new Array();
			obstacles = new Array();
			//stenen = new Array();
			//satellites = new Array();
                       
            spaceship.y = stage.stageHeight * 0.5;
            spaceship.x = stage.stageWidth * 0.1;
            spaceship.rotation = 90;
            spaceship.scaleX = 0.2;
            spaceship.scaleY = 0.2;
		}
		
		private var counter:int = 0;
		private var counter2:int = 0;
		private var counter3:int = 0;
		public var score:int = 0;
		private var obstacles:Array;
		private var boosts:Array;
	
		private function loop2(e:Event):void
		{
			if (contains(spaceship))
			{	
				Destroy();				
			}
			
			counter2++;
			
			
			if (counter2 == RandomNumber)
			{
				createSatellites();
				counter2 = 0;
			}
		}
		
		private function loop3(e:Event):void
		{
			if (contains(spaceship))
			{
				Boosterino();
			}
			
			counter3++;
			
			if (counter3 == 60)
			{
				createBoost();
				counter3 = 0;
			}
		}
		
		private function loop(e:Event):void
		{
			counter++;
			
			if (contains(spaceship))
			{	
				Destroy();				
			}

			if (counter == 60)
			{
				createStenen();
				counter = 0;
			}
			
			if (counter == 20 || counter == 40 || counter == 60)
			{
				scoreboard.updateScore(5);
			}
			
		}
		
		
		private function createStenen(/*e:Event*/):void
		{
			
			for (var i:int = 0; i < 2; i++ )
			{
				obstacles.push(new Steen(this));
				var newIndex:int =  obstacles.length - 1;
				
				addChildAt(obstacles[newIndex], newIndex+1);	
				
			}
		}
		
		private function createSatellites():void
		{
			
			for (var i:int = 0; i < 1; i++)
			{
				obstacles.push(new Satellite(this));
				var newIndex:int = obstacles.length - 1;
				addChildAt(obstacles[newIndex], newIndex+1);
			}
		
		}
		
		private function createBoost():void
		{
			for (var i :int = 0; i < 1; i++)
			{
				boosts.push(new Boost(this));
				var newIndex:int = boosts.length - 1;
				addChildAt(boosts[newIndex], newIndex+1);
			}
		}
		
			
		private function Destroy():void
		{
		
			for (var i:int = 0; i < obstacles.length; i++)
			{
			if (spaceship.hitTestObject(obstacles[i]))
				{
					//addChild(spaceship);
					removeChild (spaceship);
				}
			}	
		}
		
		private function Boosterino():void
		{
			for (var i:int = 0; i < boosts.length; i++)
			{
				if (spaceship.hitTestObject(boosts[i]))
				{
					scoreboard.updateScore(50);
				}
			}
		}
		
		/*private function PlayerPos(e:Event):void
		{
			if (spaceship.y > stage.stageHeight)
			{
				removeChild(spaceship);
				trace("spaceship removed");
			}
		}*/
		
		
	}
}