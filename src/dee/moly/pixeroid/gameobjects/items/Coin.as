package dee.moly.pixeroid.gameobjects.items 
{	
	import content.Content;
	import dee.moly.framework.GameSprite;
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.geom.Point;
	
	/**
	 * A collectable coin
	 * @author moly
	 */
	
	public final class Coin extends GameSprite
	{	
		private static const _coinTexture:BitmapData = Content.createTexture(Content.CoinTexture);
		
		public function Coin(x:int, y:int) 
		{	
			super(_coinTexture, x, y);
			blendMode = BlendMode.MULTIPLY;
		}
		
	}

}