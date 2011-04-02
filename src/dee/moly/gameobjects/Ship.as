package dee.moly.gameobjects
{	
	import content.Content;
	import dee.moly.utils.Animation;
	import dee.moly.utils.Key;
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	
	/**
	 * Hero ship
	 * @author moly
	 */
	
	public final class Ship extends GameSprite
	{	
		private var _startPoint:Point;
		
		private var _rightBounds:int;
		private var _lowerBounds:int;
		
		private var _isAlive:Boolean;
		
		private var _dieingAnimation:Animation;
		
		private var _velocity:Point;
		
		private static const _shipTexture:BitmapData = Content.createTexture(Content.ShipTexture);
		
		private static const _shipSheet:BitmapData = Content.createTexture(Content.ShipSheet);
		
		public function Ship(x:int, y:int, levelWidth:int, levelHeight:int)
		{	
			super(_shipTexture, x, y);
			blendMode = BlendMode.MULTIPLY;
			
			_startPoint = new Point(x, y);
			
			_rightBounds = levelWidth;
			_lowerBounds = levelHeight;
			
			reset();
		}
		
		override public function update(dtSeconds:int):void 
		{	
			if (!_isAlive) {
				moveBackToStart(dtSeconds);
				return;
			}
			
			_velocity.y += 0.1;
			
			_position = _position.add(_velocity);
			
			checkBounds();
			
			handleInput();
			
		}
		
		override public function onCollision():void
		{	
			if (!_isAlive)
				return;
				
			_isAlive = false;
			_texture = _dieingAnimation;
			
			var dist:int = Math.sqrt(Math.pow(_startPoint.x - _position.x, 2) + Math.pow(_startPoint.y - _position.y, 2));
			_velocity.x = ((_startPoint.x - _position.x) / dist) * 20;
			_velocity.y = ((_startPoint.y - _position.y) / dist) * 20;
			
		}
		
		private function checkBounds():void 
		{	
			if (_position.x > _rightBounds - _texture.width){
				_position.x = _rightBounds - _texture.width;
				_velocity.x = -_velocity.x / 7;
			}
			
			if (_position.x < 0) {
				_position.x = 0;
				_velocity.x = -_velocity.x / 7;
			}
			
			if (_position.y > _lowerBounds - _texture.height) {
				_position.y = _lowerBounds - _texture.height;
				_velocity.y = -_velocity.y / 7;
			}
			
			if (_position.y < 0) {
				_position.y = 0;
				_velocity.y = -_velocity.y / 7;
			}
			
		}
		
		private function handleInput():void
		{	
			if (Key.isDown(Keyboard.LEFT))
				_velocity.x += -0.3;
				
			if (Key.isDown(Keyboard.RIGHT))
				_velocity.x += 0.3;
				
			if (Key.isDown(Keyboard.UP))
				_velocity.y += -0.3;
				
			if (Key.isDown(Keyboard.DOWN))
				_velocity.y += 0.1;
		}
		
		private function reset():void 
		{	
			_texture = _shipTexture;
			_dieingAnimation = new Animation(3, 5, 14, _shipSheet);
			
			_position = new Point(_startPoint.x, _startPoint.y);
			_velocity = new Point(0, 0);
			
			_isAlive = true;
		}
		
		private function moveBackToStart(dtSeconds:int):void 
		{	
			_dieingAnimation.update(dtSeconds);
			
			if (_dieingAnimation.currentFrame == _dieingAnimation.numFrames)
				_position = _position.add(_velocity);
				
			if (Math.pow(_startPoint.x - _position.x, 2) + Math.pow(_startPoint.y - _position.y, 2) < 275)
				reset();	
		}
		
	}

}