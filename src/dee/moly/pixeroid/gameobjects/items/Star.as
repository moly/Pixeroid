package dee.moly.pixeroid.gameobjects.items
{
	import content.Content;
	import dee.moly.framework.GameSprite;
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.geom.Point;
	
	/**
	 * The star the hero must collect to finish the level
	 * @author moly
	 */
	
	public final class Star extends GameSprite
	{	
		private static const _starTexture:BitmapData = Content.createTexture(Content.StarTexture);
		
		public function Star(x:int, y:int) 
		{	
			super(_starTexture, x, y);
			blendMode = BlendMode.MULTIPLY;
		}
		
	}

}