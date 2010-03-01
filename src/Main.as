package {
	
	import dee.moly.gamestates.GameState;
	import dee.moly.gamestates.Level1;
	import dee.moly.gamestates.Level2
	import dee.moly.utils.Key;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * Entry point
	 * @author moly
	 */
		
	public class Main extends Sprite {	
		
		public static const SCREEN_WIDTH:int = 650;
		public static const SCREEN_HEIGHT:int = 650;
		
		private var canvas:BitmapData;
		
		private var gameTimer:Timer;
		
		private var currentState:GameState;
		
		public function Main():void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			Key.initialise(stage);
			
			currentState = new Level1();
			
			canvas = new BitmapData(SCREEN_WIDTH, SCREEN_HEIGHT, false, 0xFFFFFF);
			addChild(new Bitmap(canvas));
			
			gameTimer = new Timer(25);
			gameTimer.addEventListener(TimerEvent.TIMER, update);
			gameTimer.start();
		}
		
		private function update(e:TimerEvent):void {
			
			currentState.update(4);
			
			canvas.lock();
			currentState.draw(canvas);
			canvas.unlock();
			
			if (currentState.moveToNextState == true)
				currentState = new (currentState.nextState)();
			
			//e.updateAfterEvent();
				
		}
		
	}
	
}