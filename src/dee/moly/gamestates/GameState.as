package dee.moly.gamestates {
	
	import flash.display.BitmapData;
	
	/**
	 * A base class for game states
	 * Don't instantiate directly
	 * @author moly
	 */
	
	public class GameState{
		
		private var _moveToNextState:Boolean;
		public function get moveToNextState():Boolean {
			return _moveToNextState;
		}
		
		private var _nextState:Class;
		public function get nextState():Class {
			return _nextState;
		}
		
		public function GameState() {
			
		}
		
		public function update(dtSeconds:int):void {
			
		}
		
		public function draw(canvas:BitmapData):void {
			
		}
		
		protected function changeState(state:Class):void {
			
			_moveToNextState = true;
			_nextState = state;	
			
		}
		
	}

}