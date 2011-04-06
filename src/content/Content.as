package content 
{
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	
	/**
	 * Stores all assets for easy access.
	 * @author moly
	 */
	public class Content
	{
				
		public function Content() 
		{
			throw new Error("Static class Content cannot be instantiated");
		}
		
		public static function createTexture(textureClass:Class):BitmapData
		{
			return Bitmap(new textureClass()).bitmapData;
		}
		
		[Embed(source='/content/level2/enemy.png')]
		public static const EnemyTexture:Class;
		
		[Embed(source='/content/level2/enemymini.png')]
		public static const EnemyMiniTexture:Class;
		
		[Embed(source='/content/coin.png')]
		public static const CoinTexture:Class;
		
		[Embed(source='/content/level1/skull.png')]
		public static const SkullTexture:Class;
		
		[Embed(source='/content/star.png')]
		public static const StarTexture:Class;
		
		[Embed(source='/content/ship.png')]
		public static const ShipTexture:Class;
		
		[Embed(source='/content/shipSheet.png')]
		public static const ShipSheet:Class;
		
		[Embed(source='/content/level1/border.png')]
		public static const BorderTexture:Class;
		
		[Embed(source='/content/level1/bg.png')]
		public static const BGTexture:Class;
		
		[Embed(source='/content/level1/whiteWalls.png')]
		public static const WhiteWallsTexture:Class;
		
		[Embed(source='/content/level1/orangeWalls.png')]
		public static const OrangeWallsTexture:Class;
		
		[Embed(source='/content/level1/blueWalls.png')]
		public static const BlueWallsTexture:Class;
		
		[Embed(source='/content/level1/whiteRotator.png')]
		public static const WhiteRotatorTexture:Class;
		
		[Embed(source='/content/level1/orangeRotator.png')]
		public static const OrangeRotatorTexture:Class;
		
		[Embed(source='/content/level1/blueRotator.png')]
		public static const BlueRotatorTexture:Class;
		
		[Embed(source = '/content/border.png')]
		public static const BorderTex:Class;
	}

}