﻿package dee.moly.framework.states 
{	
	import dee.moly.framework.GameGroup;
	import dee.moly.framework.GameObject;
	import dee.moly.framework.graphics.Canvas;
	import flash.display.BitmapData;
	
	/**
	 * A base class for game states
	 * Don't instantiate directly
	 * @author moly
	 */
	
	public class GameState
	{	
		private var _moveToNextState:Boolean;
		public function get moveToNextState():Boolean {
			return _moveToNextState;
		}
		
		private var _nextState:Class;
		public function get nextState():Class {
			return _nextState;
		}
		
		protected var _gameObjects:GameGroup;
		
		public function GameState()
		{
			
		}
		
		public function init():void
		{
			_gameObjects = new GameGroup();
		}
		
		public function update(dtSeconds:int):void 
		{
			_gameObjects.update(dtSeconds);
		}
		
		public function draw(canvas:Canvas):void
		{
			_gameObjects.draw(canvas);
		}
		
		protected function add(gameObject:GameObject):void
		{
			_gameObjects.add(gameObject);
		}
		
		protected function changeState(state:Class):void
		{	
			_moveToNextState = true;
			_nextState = state;		
		}
		
	}

}