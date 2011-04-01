package dee.moly.gameobjects.enemies
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
		
		private var wayPoints:Vector.<Point>;
		
		private var currentPointIndex:int;
		
		private var velocity:Point;
		
		public function WaypointEnemy(wayPoints:Vector.<Point>, startPointIndex:int, numFollowers:int)
		{	
			super(numFollowers);
			
			this.wayPoints = wayPoints;
			
			velocity = new Point();
			
			currentPointIndex = startPointIndex;
			
			_position = wayPoints[currentPointIndex];
			
			nextWayPoint();	
		}
		
		override public function update(dtSeconds:int):void
		{	
			super.update(dtSeconds);
			
			_position = _position.add(velocity);
			
			if (Math.pow(wayPoints[currentPointIndex].x - _position.x, 2) + Math.pow(wayPoints[currentPointIndex].y - _position.y, 2) < 10)
				nextWayPoint();
		}
		
		private function nextWayPoint():void 
		{	
			if (++currentPointIndex >= wayPoints.length)
			{
				currentPointIndex = 0;
			}
			
			var dist:int = Math.sqrt(Math.pow(wayPoints[currentPointIndex].x - _position.x, 2) + Math.pow(wayPoints[currentPointIndex].y - _position.y, 2));
			velocity.x = ((wayPoints[currentPointIndex].x - _position.x) / dist) * SPEED;
			velocity.y = ((wayPoints[currentPointIndex].y - _position.y) / dist) * SPEED;
		}
		
	}

}