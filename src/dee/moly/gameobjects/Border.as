package dee.moly.gameobjects {
	
	import dee.moly.utils.ContentManager;
	import flash.display.BitmapData;
	
	/**
	 * A pretty border
	 * Denotes the game area
	 * @author moly
	 */
	
	public class Border extends GameObject{
		
		public function Border(texture:BitmapData) {
			this.texture = texture;
		}
		
	}

}