﻿package dee.moly.pixeroid.gameobjects
{	
	import content.Content;
	import dee.moly.framework.GameSprite;
	import dee.moly.framework.graphics.Animation;
	import dee.moly.framework.graphics.AnimationPlayer;
	import dee.moly.framework.graphics.Canvas;
	import dee.moly.framework.utils.Input;
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.geom.Point;
	import flash.geom.Rectangle;
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
		private var _animationPlayer:AnimationPlayer;
		
		private var _velocity:Point;
		
		private static const _shipTexture:BitmapData = Content.createTexture(Content.ShipTexture);
		
		private static const _shipSheet:BitmapData = Content.createTexture(Content.ShipSheet);
		
		public function Ship(x:int, y:int, levelWidth:int, levelHeight:int)
		{	
			super(_shipTexture, x, y);
			
			blendMode = BlendMode.MULTIPLY;
			
			_animationPlayer = new AnimationPlayer();
			_dieingAnimation = new Animation(_shipSheet, 72, 78, 0.02, true);
			_animationPlayer.playAnimation(_dieingAnimation);
			
			_startPoint = new Point(x, y);
			
			_rightBounds = levelWidth;
			_lowerBounds = levelHeight;
			
			_velocity = new Point();
		}
		
		override public function update(dtSeconds:int):void 
		{	
			if (!_isAlive) 
			{
				//_dieingAnimation.update(dtSeconds);
				//moveBackToStart(dtSeconds);
				//return;
			}
			
			_animationPlayer.update(dtSeconds);
			
			_velocity.y += 0.1;
			
			_position = _position.add(_velocity);
			
			checkBounds();
			
			handleInput();
		}
		
		override public function draw(canvas:Canvas, cameraPosition:Point = null):void 
		{
			_animationPlayer.draw(canvas, _position.subtract(cameraPosition), _blendMode);
		}
		
		override public function onCollision():void
		{	
			//if (!_isAlive)
			//	return;
				
			//_isAlive = false;
			_animationPlayer.playAnimation(_dieingAnimation);
			
			//var dist:int = Math.sqrt(Math.pow(_startPoint.x - _position.x, 2) + Math.pow(_startPoint.y - _position.y, 2));
			//_velocity.x = ((_startPoint.x - _position.x) / dist) * 20;
			//_velocity.y = ((_startPoint.y - _position.y) / dist) * 20;			
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
			if (Input.keyboard.isDown(Keyboard.LEFT))
				_velocity.x += -0.3;
				
			if (Input.keyboard.isDown(Keyboard.RIGHT))
				_velocity.x += 0.3;
				
			if (Input.keyboard.isDown(Keyboard.UP))
				_velocity.y += -0.3;
				
			if (Input.keyboard.isDown(Keyboard.DOWN))
				_velocity.y += 0.1;
		}
		
		private function moveBackToStart(dtSeconds:int):void 
		{				
			//if (_dieingAnimation.currentFrame == _dieingAnimation.numFrames)
				//_position = _position.add(_velocity);
				
			//if (Math.pow(_startPoint.x - _position.x, 2) + Math.pow(_startPoint.y - _position.y, 2) < 275)
				//reset();	
		}
		
	}

}