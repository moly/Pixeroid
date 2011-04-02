package dee.moly.gameobjects.items
{	
	import content.Content;
	import flash.display.BlendMode;
	import flash.geom.Point;
	import flash.display.BitmapData;
	import dee.moly.gameobjects.GameSprite;
	
	/**
	 * A large Black Skull
	 * @author moly
	 */
	
	public final class Skull extends GameSprite
	{	
		private static const _skullTexture:BitmapData = Content.createTexture(Content.SkullTexture);
		
		public function Skull(x:int, y:int) 
		{	
			super(_skullTexture, x, y);
			blendMode = BlendMode.MULTIPLY;
		}
		
	}

}