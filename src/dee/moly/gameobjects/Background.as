package dee.moly.gameobjects {
	
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
	 * A static background image
	 * @author moly
	 */
	
	public final class Background extends GameObject{
		
		private var clipRect:Rectangle;
		
		public function Background(texture:BitmapData) {
			
			super(texture);
			clipRect = new Rectangle(0, 0, Main.SCREEN_WIDTH, Main.SCREEN_HEIGHT);
			
		}
		
		override public function draw(canvas:BitmapData, cameraPosition:Point, blendMode:String = ""):void {
			
			clipRect.x = cameraPosition.x;
			clipRect.y = cameraPosition.y;
			
			if (blendMode == "")
				canvas.copyPixels(texture, clipRect, position, null, null, true);
			else
				super.draw(canvas, cameraPosition, blendMode);
				
		}
		
	}

}