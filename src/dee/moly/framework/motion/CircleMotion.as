package dee.moly.framework.motion 
{
	import flash.geom.Matrix;
	import flash.geom.Point;
	/**
	 * Move in a circular path
	 * @author moly
	 */
	
	public class CircleMotion extends Motion
	{
		protected var _matrix:Matrix;
		
		protected var _centre:Point;
		
		public function CircleMotion(centreX:int, centreY:int, radius:int, speed:int) 
		{
			_matrix = new Matrix();
			_matrix.rotate(speed / 100);
			
			_centre = new Point(centreX, centreY);
			
			_position.x = radius;			
		}
		
		override public function update(dtSeconds:int):Point 
		{
			_position = _matrix.transformPoint(_position);
			return _position.add(_centre);
		}
		
	}

}