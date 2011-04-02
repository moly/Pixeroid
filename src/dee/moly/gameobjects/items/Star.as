package dee.moly.gameobjects.items
{
	import dee.moly.gameobjects.GameSprite;
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.geom.Point;
	
	/**
	 * The star the hero must collect to finish the level
	 * @author moly
	 */
	
	public final class Star extends GameSprite
	{	
		[Embed(source = '/Content/star.png')]
		public static const StarTexture:Class;
		public static const starTexture:BitmapData = new StarTexture().bitmapData;
		
		public function Star(x:int, y:int) 
		{	
			super(starTexture, x, y);
			blendMode = BlendMode.MULTIPLY;
		}
		
	}

}