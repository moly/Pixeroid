package dee.moly.gameobjects.enemies {
	
	import dee.moly.gameobjects.GameObject;
	import flash.display.BitmapData;
	
	/**
	 * Like an enemy but smaller
	 * @author moly
	 */
	
	public class EnemyMini extends GameObject{
		
		[Embed(source = '/Content/level2/enemymini.png')]
		public static const EnemyMiniTexture:Class;
		public static const enemyMiniTexture:BitmapData = new EnemyMiniTexture().bitmapData;
		
		public function EnemyMini() {
			
			super(enemyMiniTexture);			
		}
		
	}

}