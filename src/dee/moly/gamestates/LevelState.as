package dee.moly.gamestates {
	
	import dee.moly.gameobjects.Ship;
	import dee.moly.gameobjects.Star;
	import dee.moly.gameobjects.Border;
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	/**
	 * A base class for all levels
	 * @author moly
	 */
	
	public class LevelState extends GameState{
	
		protected var ship:Ship;
		
		protected var star:Star;
		
		protected var border:Border;
		
		protected var cameraPosition:Point;
		
		public function LevelState() {
			
			cameraPosition = new Point();
			
		}
		
		override public function update(dtSeconds:int):void {
			
			scrollCamera();
			
		}
		
		override public function draw(canvas:BitmapData):void {
			
		}
		
		protected function scrollCamera():void{
			
			const horizontalViewMargin:Number = 0.35;
			const verticalViewMargin:Number = 0.35;
			
			var marginWidth:Number = Main.SCREEN_WIDTH * horizontalViewMargin;
			var marginLeft:Number = cameraPosition.x + marginWidth;
			var marginRight:Number = cameraPosition.x + Main.SCREEN_WIDTH - marginWidth;
			
			var marginHeight:Number = Main.SCREEN_HEIGHT * verticalViewMargin;
			var marginTop:Number = cameraPosition.y + marginHeight;
			var marginBottom:Number = cameraPosition.y + Main.SCREEN_HEIGHT - marginHeight;
			
			var cameraMovement:Point = new Point();
			if(ship.x < marginLeft)
				cameraMovement.x = ship.x - marginLeft;
			else if(ship.x > marginRight)
				cameraMovement.x = ship.x - marginRight;
			
			if(ship.y < marginTop)
				cameraMovement.y = ship.y - marginTop;
			else if(ship.y > marginBottom)
				cameraMovement.y = ship.y - marginBottom;
				
			var maxCameraPositionX:Number = border.width - Main.SCREEN_WIDTH;
			var maxCameraPositionY:Number = border.height - Main.SCREEN_HEIGHT;
			cameraPosition.x = clamp(cameraPosition.x + cameraMovement.x, 0, maxCameraPositionX);
			cameraPosition.y = clamp(cameraPosition.y + cameraMovement.y, 0, maxCameraPositionY);
			
		}
		
        private function clamp(value:Number, min:Number, max:Number):Number{
			
			if(value < min)
				return min;
				
			if(value > max)
				return max;
				
			return value <= 0 || value >= 0 ? value : 0;
			
		}
		
	}

}