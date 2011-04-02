package {
	
	import adobe.utils.CustomActions;
	import dee.moly.gamestates.GameState;
	import dee.moly.gamestates.levels.Level1;
	import dee.moly.gamestates.levels.Level2
	import dee.moly.utils.Key;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * Entry point
	 * @author moly
	 */
		
	public class Main extends Sprite {	
		
		public static const SCREEN_WIDTH:int = 650;
		public static const SCREEN_HEIGHT:int = 650;
		
		private var canvas:BitmapData;
		
		private var currentState:GameState;
		
		public function Main() {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			Key.initialise(stage);
			
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