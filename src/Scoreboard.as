package  
{
	import flash.text.TextField
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author lorenzo
	 */
	public class Scoreboard extends TextField 
	{
		private var score:int;
		public function Scoreboard() 
		{
			score = 0;
			var txtf:TextFormat = new TextFormat();
			txtf.color = 0xff0000;
			txtf.size = 20;
			txtf.font = "cursive";
			this.defaultTextFormat = txtf;
			this.text = "Score : 0";
			this.width = 300;
		}
		public function updateScore(_score:int):void		
		{
			score += _score;
			this.text = "Score : " + score;
		}
	}
}