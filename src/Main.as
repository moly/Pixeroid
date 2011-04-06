package
{	
	import adobe.utils.CustomActions;
	import dee.moly.framework.Game;
	import dee.moly.framework.states.GameState;
	import dee.moly.pixeroid.gamestates.levels.Level1;
	import dee.moly.pixeroid.gamestates.levels.Level2;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * Entry point
	 * @author moly
	 */
		
	public class Main extends Game 
	{		
		public static const SCREEN_WIDTH:int = 650;
		public static const SCREEN_HEIGHT:int = 650;
		
		[Frame(factoryClass = "Preloader")]
		[SWF(width = "650", height = "650", frameRate = "40")]
		public function Main()
		{
			super(650, 650, new Level2());		
		}
		
	}
	
}