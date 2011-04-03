package dee.moly.pixeroid.gameobjects.enemies
{	
	import dee.moly.framework.motion.CircleMotion;
	import dee.moly.framework.motion.Motion;
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	/**
	 * An enemy that travels in a circle
	 * @author moly
	 */
	
	public final class CirclePathEnemy extends Enemy
	{	
		private var _motion:Motion;
		
		public function CirclePathEnemy(centreX:int, centreY:int, radius:int, numFollowers:int) 
		{	
			super(numFollowers);
			
			_motion = new CircleMotion(centreX, centreY, radius, 5);
		}
		
		override public function update(dtSeconds:int):void
		{	
			super.update(dtSeconds);
			/*
			_position = new Point();
			
			_matrix.identity();
			_matrix.translate(radius, 0);
			_matrix.rotate(a += SPEED / 100);
			_matrix.translate(centre.x, centre.y);
			
			_position = _matrix.transformPoint(_position);*/
			_position = _motion.update(dtSeconds);
		}
		
	}

}