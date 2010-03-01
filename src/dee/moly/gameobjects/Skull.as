package dee.moly.gameobjects {
	
	import dee.moly.utils.ContentManager;
	import flash.display.BlendMode;
	import flash.geom.Point;
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	
	/**
	 * A large Black Skull
	 * @author moly
	 */
	
	public class Skull extends GameObject{
		
		private var matrix:Matrix;
		
		public function Skull(xpos:int, ypos:int) {
			
			texture = ContentManager.load("level1/skull");
			position = new Point(xpos, ypos);
			
		}
		
	}

}