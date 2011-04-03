package {
	
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
		
	public class Main extends Game {	
		
		public static const SCREEN_WIDTH:int = 650;
		public static const SCREEN_HEIGHT:int = 650;
		
		private var canvas:BitmapData;
		
		private var currentState:GameState;
		
		public function Main() {
		
		}
		
		override protected function init(e:Event = null):void 
		{
			super.init(e);
			
			currentState = new Level2();
			currentState.init();
			
			canvas = new BitmapData(SCREEN_WIDTH, SCREEN_HEIGHT, false, 0xFFFFFF);
			addChild(new Bitmap(canvas));
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void {
			
			currentState.update(4);
			
			canvas.lock();
			currentState.draw(canvas);
			canvas.unlock();
			
			if (currentState.moveToNextState == true)
			{
				currentState = new (currentState.nextState)();
				currentState.init();
			}
				
		}
		
	}
	
}