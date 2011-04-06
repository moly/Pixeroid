package dee.moly.pixeroid.gamestates
{	
	import dee.moly.framework.states.LevelState;
	import dee.moly.pixeroid.gameobjects.Ship;
	import dee.moly.pixeroid.gameobjects.items.Star;
	import dee.moly.pixeroid.gameobjects.Background;
	import dee.moly.framework.utils.MathExtension;
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	/**
	 * A base class for all levels
	 * @author moly
	 */
	
	public class Level extends LevelState
	{
		protected var _ship:Ship;
		
		protected var _star:Star;
		
		protected var _border:Background;
		
		public function Level()
		{	
			
		}
		
	}

}