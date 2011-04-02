package dee.moly.gameobjects.enemies 
{	
	import content.Content;
	import dee.moly.gameobjects.GameSprite;
	import flash.display.BitmapData;
	
	/**
	 * Like an enemy but smaller
	 * @author moly
	 */
	
	public class EnemyMini extends GameSprite
	{	
		private static const _enemyMiniTexture:BitmapData = Content.createTexture(Content.EnemyMiniTexture);
		
		public function EnemyMini() 
		{	
			super(_enemyMiniTexture);			
		}
		
	}

}