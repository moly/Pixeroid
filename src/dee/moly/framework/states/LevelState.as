package dee.moly.framework.states
{	
	import dee.moly.framework.GameSprite;
	import dee.moly.framework.graphics.Canvas;
	import dee.moly.framework.states.GameState;
	import dee.moly.framework.utils.MathExtension;
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	/**
	 * A base class for all levels
	 * @author moly
	 */
	
	public class LevelState extends GameState
	{		
		protected var _levelWidth:int;
		protected var _levelHeight:int;
		
		protected var _cameraPosition:Point;
		protected var _followSprite:GameSprite;
		
		public function LevelState()
		{	
			_cameraPosition = new Point();
		}
		
		override public function update(dtSeconds:int):void 
		{	
			super.update(dtSeconds);
			
			scrollCamera();	
		}
		
		override public function draw(canvas:Canvas):void 
		{
			_gameObjects.draw(canvas, _cameraPosition);
		}
		
		protected function scrollCamera():void
		{	
			if (!_followSprite)
				return;
			
			const horizontalViewMargin:Number = 0.5;
			const verticalViewMargin:Number = 0.5;
			
			var marginWidth:Number = Main.SCREEN_WIDTH * horizontalViewMargin;
			var marginLeft:Number = _cameraPosition.x + marginWidth;
			var marginRight:Number = _cameraPosition.x + Main.SCREEN_WIDTH - marginWidth;
			
			var marginHeight:Number = Main.SCREEN_HEIGHT * verticalViewMargin;
			var marginTop:Number = _cameraPosition.y + marginHeight;
			var marginBottom:Number = _cameraPosition.y + Main.SCREEN_HEIGHT - marginHeight;
			
			var cameraMovement:Point = new Point();
			if(_followSprite.x < marginLeft)
				cameraMovement.x = _followSprite.x - marginLeft;
			else if(_followSprite.x > marginRight)
				cameraMovement.x = _followSprite.x - marginRight;
			
			if(_followSprite.y < marginTop)
				cameraMovement.y = _followSprite.y - marginTop;
			else if(_followSprite.y > marginBottom)
				cameraMovement.y = _followSprite.y - marginBottom;
				
			var maxCameraPositionX:Number = _levelWidth - Main.SCREEN_WIDTH;
			var maxCameraPositionY:Number = _levelHeight - Main.SCREEN_HEIGHT;
			_cameraPosition.x = MathExtension.clamp(_cameraPosition.x + cameraMovement.x, 0, maxCameraPositionX);
			_cameraPosition.y = MathExtension.clamp(_cameraPosition.y + cameraMovement.y, 0, maxCameraPositionY);	
		}
		
	}

}