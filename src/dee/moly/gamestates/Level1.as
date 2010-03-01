package dee.moly.gamestates {
	
	import dee.moly.gameobjects.Background;
	import dee.moly.gameobjects.Border;
	import dee.moly.gameobjects.GameObject;
	import dee.moly.gameobjects.RotatingParallaxWall;
	import dee.moly.gameobjects.Star;
	import dee.moly.gameobjects.ParallaxWall;
	import dee.moly.gameobjects.Skull;
	import dee.moly.utils.ContentManager;
	import dee.moly.gameobjects.Ship;
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.geom.Matrix;
	import flash.geom.Point;
	
	/**
	 * A basic maze type level with some weird parallax scrolling
	 * @author moly
	 */
	
	public class Level1 extends LevelState{
		
		private static const START_POINT:Point = new Point(0, 870);
		private static const END_POINT:Point = new Point(450, 600);
		
		private var whiteWalls:ParallaxWall;
		private var orangeWalls:ParallaxWall;
		private var blueWalls:ParallaxWall;
		
		private var whiteRotator:RotatingParallaxWall;
		private var orangeRotator:RotatingParallaxWall;
		private var blueRotator:RotatingParallaxWall;
		
		private var bg:Background;
		
		private var skull:Skull;
		
		public function Level1() {
			
			border = new Border(ContentManager.load("level1/border"));
			
			bg = new Background(ContentManager.load("level1/bg"));
			
			ship = new Ship(START_POINT.x, START_POINT.y, border.width, border.height);
			
			star = new Star(END_POINT.x, END_POINT.y);
			
			skull = new Skull(580, 100);
			
			whiteWalls = new ParallaxWall(0, 0, ContentManager.load("level1/walls"), ship, 0.1);
			orangeWalls = new ParallaxWall(0, 0, ContentManager.load("level1/walls2"), ship, 0.2);
			blueWalls = new ParallaxWall(0, 0, ContentManager.load("level1/walls3"), ship, 0.3);
			
			whiteRotator = new RotatingParallaxWall(700, 700, ContentManager.load("level1/r1"), ship, 0.1);
			orangeRotator = new RotatingParallaxWall(700, 700, ContentManager.load("level1/r2"), ship, 0.2);
			blueRotator = new RotatingParallaxWall(700, 700, ContentManager.load("level1/r3"), ship, 0.3);
		
		}
		
		override public function update(dtSeconds:int):void {
			
			scrollCamera();
			
			ship.update(dtSeconds);
			
			if (ship.checkCollisions(whiteWalls, 0xDD))
				ship.onCollision();
				
			blueWalls.update(dtSeconds);
			orangeWalls.update(dtSeconds);
			whiteWalls.update(dtSeconds);
			
			blueRotator.update(dtSeconds);
			orangeRotator.update(dtSeconds);
			whiteRotator.update(dtSeconds);
			
		}
		
		override public function draw(canvas:BitmapData):void {
	
			bg.draw(canvas, cameraPosition);
			
			orangeWalls.draw(canvas, cameraPosition, BlendMode.OVERLAY);
			blueWalls.draw(canvas, cameraPosition, BlendMode.OVERLAY);
			whiteWalls.draw(canvas, cameraPosition, BlendMode.OVERLAY);
			
			orangeRotator.draw(canvas, cameraPosition, BlendMode.OVERLAY);
			blueRotator.draw(canvas, cameraPosition, BlendMode.OVERLAY);
			whiteRotator.draw(canvas, cameraPosition, BlendMode.OVERLAY);
			
			ship.draw(canvas, cameraPosition, BlendMode.MULTIPLY);
			star.draw(canvas, cameraPosition, BlendMode.MULTIPLY);			
			
			skull.draw(canvas, cameraPosition, BlendMode.MULTIPLY);

			border.draw(canvas, cameraPosition);
			
		}
		
	}

}