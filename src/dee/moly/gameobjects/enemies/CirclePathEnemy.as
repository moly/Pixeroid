package dee.moly.gameobjects.enemies
{	
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	/**
	 * An enemy that travels in a circle
	 * @author moly
	 */
	
	public final class CirclePathEnemy extends Enemy
	{	
		private static const SPEED:int = 5;
		
		private var a:Number;
		
		private var radius:int;
		
		private var centre:Point;
		
		public function CirclePathEnemy(centrex:int, centrey:int, radius:int, numFollowers:int) 
		{	
			super(numFollowers);
			
			this.radius = radius;
			
			centre = new Point(centrex, centrey);
			
			a = 0;
		}
		
		override public function update(dtSeconds:int):void
		{	
			super.update(dtSeconds);
			
			_position = new Point();
			
			_matrix.identity();
			_matrix.translate(radius, 0);
			_matrix.rotate(a += SPEED / 100);
			_matrix.translate(centre.x, centre.y);
			
			_position = _matrix.transformPoint(_position);
		}
		
	}

}