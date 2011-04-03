package dee.moly.framework.motion
{
	import flash.geom.Point;
	
	/**
	 * Base class for motion types
	 * @author moly
	 */
	
	public class Motion
	{
		protected var _position:Point;
		
		public function Motion() 
		{
			_position = new Point();
		}
		
		public function update(dtSeconds:int):Point
		{
			return _position;
		}
		
	}

}