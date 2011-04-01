package dee.moly.gameobjects.items 
{	
	import dee.moly.gameobjects.GameSprite;
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	/**
	 * A collectable coin
	 * @author moly
	 */
	
	public final class Coin extends GameSprite
	{	
		[Embed(source = '/Content/coin.png')]
		public static const CoinTexture:Class;
		public static const coinTexture:BitmapData = new CoinTexture().bitmapData;
		
		public function Coin(x:int, y:int) 
		{	
			super(coinTexture, x, y);
		}
		
	}

}