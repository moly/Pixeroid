package dee.moly.gameobjects {
	
	import dee.moly.utils.ContentManager;
	
	/**
	 * Like an enemy but smaller
	 * @author moly
	 */
	
	public class EnemyMini extends GameObject{
		
		public function EnemyMini() {
			
			texture = ContentManager.load("level2/enemymini");
			
		}
		
	}

}