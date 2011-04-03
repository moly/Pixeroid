package dee.moly.pixeroid.gameobjects.enemies
{	
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	/**
	 * An enemy that follows a set of waypoints
	 * @author moly
	 */
	
	public final class WaypointEnemy extends Enemy
	{	
		private static const SPEED:int = 5;
		
		private var _wayPoints:Vector.<Point>;
		
		private var _currentPointIndex:int;
		
		private var _velocity:Point;
		
		public function WaypointEnemy(wayPoints:Vector.<Point>, startPointIndex:int, numFollowers:int)
		{	
			super(numFollowers);
			
			this._wayPoints = wayPoints;
			
			_velocity = new Point();
			
			_currentPointIndex = startPointIndex;
			
			_position = wayPoints[_currentPointIndex];
			
			nextWayPoint();	
		}
		
		override public function update(dtSeconds:int):void
		{	
			super.update(dtSeconds);
			
			_position = _position.add(_velocity);
			
			if (Math.pow(_wayPoints[_currentPointIndex].x - _position.x, 2) + Math.pow(_wayPoints[_currentPointIndex].y - _position.y, 2) < 10)
				nextWayPoint();
		}
		
		private function nextWayPoint():void 
		{	
			if (++_currentPointIndex >= _wayPoints.length)
			{
				_currentPointIndex = 0;
			}
			
			var dist:int = Math.sqrt(Math.pow(_wayPoints[_currentPointIndex].x - _position.x, 2) + Math.pow(_wayPoints[_currentPointIndex].y - _position.y, 2));
			_velocity.x = ((_wayPoints[_currentPointIndex].x - _position.x) / dist) * SPEED;
			_velocity.y = ((_wayPoints[_currentPointIndex].y - _position.y) / dist) * SPEED;
		}
		
	}

}