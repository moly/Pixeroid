package dee.moly.gameobjects {
	
	import dee.moly.utils.ContentManager;
	import flash.geom.Matrix;
	import flash.geom.Point;
	
	/**
	 * An enemy that travels in a circle
	 * @author moly
	 */
	
	public class CirclePathEnemy extends Enemy{
		
		private static const SPEED:int = 5;
		
		private var matrix:Matrix;
		
		private var a:Number;
		
		private var radius:int;
		
		private var centre:Point;
		
		public function CirclePathEnemy(centrex:int, centrey:int, radius:int, numFollowers:int) {
			
			super(numFollowers);
			
			this.radius = radius;
			
			centre = new Point(centrex, centrey);
			
			matrix = new Matrix();
			
			texture = ContentManager.load("level2/enemy");
			
			a = 0;
			
		}
		
		override public function update(dtSeconds:int):void {
			
			super.update(dtSeconds);
			
			position = new Point();
			
			matrix.identity();
			matrix.translate(radius, 0);
			matrix.rotate(a += SPEED / 100);
			matrix.translate(centre.x, centre.y);
			
			position = matrix.transformPoint(position);
			
		}
		
	}

}