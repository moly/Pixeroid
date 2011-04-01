package dee.moly.gameobjects.items
{	
	import flash.geom.Point;
	import flash.display.BitmapData;
	import dee.moly.gameobjects.GameSprite;
	
	/**
	 * A large Black Skull
	 * @author moly
	 */
	
	public final class Skull extends GameSprite
	{	
		[Embed(source = '/Content/level1/skull.png')]
		public static const SkullTexture:Class;
		public static const skullTexture:BitmapData = new SkullTexture().bitmapData;
		
		public function Skull(x:int, y:int) 
		{	
			super(skullTexture, x, y);		
		}
		
	}

}