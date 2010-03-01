package dee.moly.gameobjects {
	
	import dee.moly.utils.ContentManager;
	import flash.geom.Point;
	
	/**
	 * The star the hero must collect to finish the level
	 * @author moly
	 */
	
	public class Star extends GameObject{
		
		private var startPos:Point;
		
		public function Star(xpos:int, ypos:int) {
			
			texture = ContentManager.load("star");
			position = new Point(xpos, ypos);
		
		}
		
	}

}