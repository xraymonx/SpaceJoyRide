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
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Raymon Zoetigheid
	 */
	public class Main extends Sprite 
	{		
		private var RandomNumber:int = Math.floor(Math.random() * 120 + 60);//gebruikt in de loop om satellites te spawnen, hij spawnt ze random van 60 tot 120,je moet * het minimale getal en dan het max getal dat je wilt daar moet je het * van af trekken dat is de +(dus 120-60=60).
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
		
		private function init(e:Event = null):void 
		{
			restart();
		}
		private function restart():void
		{
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			bg = new Background();
			addChild(bg);//zet achtergrond in de game
			
			theo = new Eyyoikbentheo();
			addChild(theo);
			
			stage.addEventListener(Event.ENTER_FRAME, loop);

			stage.addEventListener(KeyboardEvent.KEY_DOWN, restarted);
			
			scoreboard = new Scoreboard();
			addChild(scoreboard);
			
			spaceship = new Player();
            addChild(spaceship);
            
			boosts = new Array();
			obstacles = new Array();
                       
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
	
		
		private function restarted(e:KeyboardEvent):void
		{
			if (!contains(spaceship))
			{
				if (e.keyCode == Keyboard.SPACE)
				{
					trace("https://www.youtube.com/watch?v=SBCw4_XgouA");
					restart();
				}
			}	
		}
		
		private function loop(e:Event):void
		{
			counter++;
			counter2++;
			counter3++;
			
				if (contains(spaceship))
				{	
					Boosterino();
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
			
				if (counter2 == RandomNumber)
				{
					createSatellites();
					counter2 = 0;
				}
			
				if (counter3 == 60)
				{
					createBoost();
					counter3 = 0;
				}
		}
		
		private function createStenen():void
		{
			
			for (var i:int = 0; i < 2; i++ )
			{
				obstacles.push(new Steen(this));
				var newIndex:int =  obstacles.length - 1;
				
				addChild(obstacles[newIndex]);	
				
			}
		}
		
		private function createSatellites():void
		{
			
			for (var i:int = 0; i < 1; i++)
			{
				obstacles.push(new Satellite(this));
				var newIndex:int = obstacles.length - 1;
				addChild(obstacles[newIndex]);
			}
		
		}
		
		private function createBoost():void
		{
			for (var i :int = 0; i < 1; i++)
			{
				boosts.push(new Boost(this));
				var newIndex:int = boosts.length - 1;
				addChild(boosts[newIndex]);
			}
		}
			
		private function Destroy():void
		{
		
			for (var i:int = 0; i < obstacles.length; i++)
			{
				trace("niks mis met de for loop");
			if (spaceship.hitTestObject(obstacles[i]))
				{
					trace("hit");
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
					scoreboard.updateScore(2);
				}
			}
		}
	}
}