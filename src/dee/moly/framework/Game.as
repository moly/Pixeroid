package dee.moly.framework 
{
	import dee.moly.framework.graphics.Canvas;
	import dee.moly.framework.states.GameState;
	import dee.moly.framework.utils.Input;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * Our main class, sets the whole game up
	 * @author moly
	 */
	
	public class Game extends Sprite
	{
		private var _gameWidth:int;
		private var _gameHeight:int;
		
		private var _currentState:GameState;
		
		private var _canvas:Canvas;
		
		public function Game(gameWidth:int, gameHeight:int, firstState:GameState) 
		{
			_gameWidth = gameWidth;
			_gameHeight = gameHeight;
			_currentState = firstState;
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			_canvas = new Canvas(stage, _gameWidth, _gameHeight);
			
			Input.init(stage);			
			
			_currentState.init();
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{	
			_currentState.update(4);
			
			_canvas.begin();
			_currentState.draw(_canvas);
			_canvas.end();
			
			if (_currentState.moveToNextState == true)
			{
				_currentState = new (_currentState.nextState)();
				_currentState.init();
			}
				
		}
		
	}

}