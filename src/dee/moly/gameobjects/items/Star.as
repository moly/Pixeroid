package dee.moly.gameobjects.items {
	
	import dee.moly.gameobjects.GameObject;
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	/**
	 * The star the hero must collect to finish the level
	 * @author moly
	 */
	
	public final class Star extends GameObject{
		
		[Embed(source = '/Content/star.png')]
		public static const StarTexture:Class;
		public static const starTexture:BitmapData = new StarTexture().bitmapData;
		
		public function Star(x:int, y:int) {
			
			super(starTexture, x, y);		
		}
		
	}

}