package dee.moly.gamestates {
	
	import dee.moly.gameobjects.Background;
	import dee.moly.gameobjects.WaypointEnemy;
	import dee.moly.gameobjects.CirclePathEnemy;
	import flash.display.BlendMode;
	import flash.display.BitmapData;
	import dee.moly.gameobjects.Border;
	import dee.moly.gameobjects.Ship;
	import dee.moly.gameobjects.Star;
	import dee.moly.utils.ContentManager;
	import flash.geom.Point;
	
	/**
	 * A pentagram like level
	 * @author moly
	 */
	
	public class Level2 extends LevelState{
		
		private static const START_POINT:Point = new Point(0, 0);
		private static const END_POINT:Point = new Point(430, 310);
		
		private var bg:Background;
		
		private var enemy1:WaypointEnemy;
		private var enemy2:WaypointEnemy;
		private var enemy3:WaypointEnemy;
		private var enemy4:CirclePathEnemy;
		
		private var wayPoints1:Vector.<Point>;
		private var wayPoints2:Vector.<Point>;
		private var wayPoints3:Vector.<Point>;
		
		public function Level2() {
			
			border = new Border(ContentManager.load("level2/border"));
			
			bg = new Background(ContentManager.load("level2/bg"));
			
			ship = new Ship(START_POINT.x, START_POINT.y, border.width, border.height);
			
			star = new Star(END_POINT.x, END_POINT.y);
			
			wayPoints1 = new Vector.<Point>();
			wayPoints1.push(new Point(454, 84), new Point(777, 270), new Point(578, 382), new Point(453, 292), new Point(324, 384), new Point(131, 273));
			
			wayPoints2 = new Vector.<Point>();
			wayPoints2.push(new Point(454, 293), new Point(607, 405), new Point(548, 586), new Point(356, 584), new Point(301, 402));
			
			wayPoints3 = new Vector.<Point>();
			wayPoints3.push(new Point(453, 78), new Point(780, 644), new Point(129, 642));
			
			enemy1 = new WaypointEnemy(wayPoints1, 0, 3);
			enemy2 = new WaypointEnemy(wayPoints2, 3, 3);
			enemy3 = new WaypointEnemy(wayPoints3, 2, 3);
			enemy4 = new CirclePathEnemy(453, 450, 374 , 5);
			
		}
		
		override public function update(dtSeconds:int):void {
			
			scrollCamera();
			
			ship.update(dtSeconds);
			
			enemy1.update(dtSeconds);
			enemy2.update(dtSeconds);
			enemy3.update(dtSeconds);
			enemy4.update(dtSeconds);
			
		}
		
		override public function draw(canvas:BitmapData):void {
			
			bg.draw(canvas, cameraPosition);
			
			ship.draw(canvas, cameraPosition, BlendMode.MULTIPLY);
			star.draw(canvas, cameraPosition, BlendMode.MULTIPLY);
			
			enemy1.draw(canvas, cameraPosition);
			enemy2.draw(canvas, cameraPosition);
			enemy3.draw(canvas, cameraPosition);
			enemy4.draw(canvas, cameraPosition);
			
			border.draw(canvas, cameraPosition);
			
		}
		
	}

}