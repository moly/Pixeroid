package dee.moly.gamestates.levels
{	
	import dee.moly.gamestates.GameState;
	import dee.moly.gameobjects.Ship;
	import dee.moly.gameobjects.items.Star;
	import dee.moly.gameobjects.Background;
	import dee.moly.utils.MathExtension;
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	/**
	 * A base class for all levels
	 * @author moly
	 */
	
	public class LevelState extends GameState
	{
		protected var _ship:Ship;
		
		protected var _star:Star;
		
		protected var _border:Background;
		
		protected var _cameraPosition:Point;
		
		protected var _levelWidth:int;
		protected var _levelHeight:int;
		
		public function LevelState()
		{	
			
		}
		
		override public function init():void 
		{
			super.init();
			_cameraPosition = new Point();	
		}
		
		override public function update(dtSeconds:int):void 
		{	
			super.update(dtSeconds);
			scrollCamera();	
		}
		
		override public function draw(canvas:BitmapData):void 
		{
			_gameObjects.draw(canvas, _cameraPosition);
		}
		
		protected function scrollCamera():void
		{	
			const horizontalViewMargin:Number = 0.5;
			const verticalViewMargin:Number = 0.5;
			
			var marginWidth:Number = Main.SCREEN_WIDTH * horizontalViewMargin;
			var marginLeft:Number = _cameraPosition.x + marginWidth;
			var marginRight:Number = _cameraPosition.x + Main.SCREEN_WIDTH - marginWidth;
			
			var marginHeight:Number = Main.SCREEN_HEIGHT * verticalViewMargin;
			var marginTop:Number = _cameraPosition.y + marginHeight;
			var marginBottom:Number = _cameraPosition.y + Main.SCREEN_HEIGHT - marginHeight;
			
			var cameraMovement:Point = new Point();
			if(_ship.x < marginLeft)
				cameraMovement.x = _ship.x - marginLeft;
			else if(_ship.x > marginRight)
				cameraMovement.x = _ship.x - marginRight;
			
			if(_ship.y < marginTop)
				cameraMovement.y = _ship.y - marginTop;
			else if(_ship.y > marginBottom)
				cameraMovement.y = _ship.y - marginBottom;
				
			var maxCameraPositionX:Number = _border.width - Main.SCREEN_WIDTH;
			var maxCameraPositionY:Number = _border.height - Main.SCREEN_HEIGHT;
			_cameraPosition.x = MathExtension.clamp(_cameraPosition.x + cameraMovement.x, 0, maxCameraPositionX);
			_cameraPosition.y = MathExtension.clamp(_cameraPosition.y + cameraMovement.y, 0, maxCameraPositionY);	
		}
		
	}

}