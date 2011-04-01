package dee.moly.gameobjects.enemies 
{	
	import dee.moly.gameobjects.GameSprite;
	import flash.display.BitmapData;
	
	/**
	 * Like an enemy but smaller
	 * @author moly
	 */
	
	public class EnemyMini extends GameSprite
	{	
		[Embed(source = '/Content/level2/enemymini.png')]
		public static const EnemyMiniTexture:Class;
		public static const enemyMiniTexture:BitmapData = new EnemyMiniTexture().bitmapData;
		
		public function EnemyMini() 
		{	
			super(enemyMiniTexture);			
		}
		
	}

}