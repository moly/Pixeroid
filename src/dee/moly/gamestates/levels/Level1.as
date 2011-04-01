﻿package dee.moly.gamestates.levels {
	
	import dee.moly.gameobjects.Background;
	import dee.moly.gameobjects.GameObject;
	import dee.moly.gameobjects.items.RotatingParallaxWall;
	import dee.moly.gameobjects.items.Star;
	import dee.moly.gameobjects.items.ParallaxWall;
	import dee.moly.gameobjects.items.Skull;
	import dee.moly.gameobjects.Ship;
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.geom.Matrix;
	import flash.geom.Point;
	
	/**
	 * A basic maze type level with some weird parallax scrolling
	 * @author moly
	 */
	
	public final class Level1 extends LevelState{
		
		private static const START_POINT:Point = new Point(0, 850);
		private static const END_POINT:Point = new Point(450, 600);
		
		private var whiteWalls:ParallaxWall;
		private var orangeWalls:ParallaxWall;
		private var blueWalls:ParallaxWall;
		
		private var whiteRotator:RotatingParallaxWall;
		private var orangeRotator:RotatingParallaxWall;
		private var blueRotator:RotatingParallaxWall;
		
		private var bg:Background;
		
		private var skull:Skull;
		
		[Embed(source = '/Content/level1/border.png')]
		private static const BorderTexture:Class;
		private static const borderTexture:BitmapData = new BorderTexture().bitmapData;
		
		[Embed(source='/Content/level1/bg.png')]
		private static const BGTexture:Class;
		private static const bgTexture:BitmapData = new BGTexture().bitmapData;
		
		[Embed(source='/Content/level1/whiteWalls.png')]
		private static const WhiteWallsTexture:Class;
		private static const whiteWallsTexture:BitmapData = new WhiteWallsTexture().bitmapData;
		
		[Embed(source='/Content/level1/orangeWalls.png')]
		private static const OrangeWallsTexture:Class;
		private static const orangeWallsTexture:BitmapData = new OrangeWallsTexture().bitmapData;
		
		[Embed(source='/Content/level1/blueWalls.png')]
		private static const BlueWallsTexture:Class;
		private static const blueWallsTexture:BitmapData = new BlueWallsTexture().bitmapData;
		
		[Embed(source='/Content/level1/whiteRotator.png')]
		private static const WhiteRotatorTexture:Class;
		private static const whiteRotatorTexture:BitmapData = new WhiteRotatorTexture().bitmapData;
		
		[Embed(source='/Content/level1/orangeRotator.png')]
		private static const OrangeRotatorTexture:Class;
		private static const orangeRotatorTexture:BitmapData = new OrangeRotatorTexture().bitmapData;
		
		[Embed(source='/Content/level1/blueRotator.png')]
		private static const BlueRotatorTexture:Class;
		private static const blueRotatorTexture:BitmapData = new BlueRotatorTexture().bitmapData;
		
		public function Level1() {
			
			border = new Background(borderTexture);
			
			bg = new Background(bgTexture);
			
			ship = new Ship(START_POINT.x, START_POINT.y, border.width, border.height);
			
			star = new Star(END_POINT.x, END_POINT.y);
			
			skull = new Skull(580, 100);
			
			whiteWalls = new ParallaxWall(0, 0, whiteWallsTexture, ship, 0.1);
			orangeWalls = new ParallaxWall(0, 0, orangeWallsTexture, ship, 0.2);
			blueWalls = new ParallaxWall(0, 0, blueWallsTexture, ship, 0.3);
			
			whiteRotator = new RotatingParallaxWall(700, 700, whiteRotatorTexture, ship, 0.1);
			orangeRotator = new RotatingParallaxWall(700, 700, orangeRotatorTexture, ship, 0.2);
			blueRotator = new RotatingParallaxWall(700, 700, blueRotatorTexture, ship, 0.3);
		}
		
		override public function update(dtSeconds:int):void {
			
			scrollCamera();
			
			ship.update(dtSeconds);
			
			if (ship.checkCollision(whiteWalls, 0xDD))
				ship.onCollision();
				
			if (ship.checkCollision(star, 0xEE))
				changeState(Level2);
				
			whiteWalls.update(dtSeconds);	
			orangeWalls.update(dtSeconds);
			blueWalls.update(dtSeconds);
			
			whiteRotator.update(dtSeconds);
			orangeRotator.update(dtSeconds);
			blueRotator.update(dtSeconds);
			
		}
		
		override public function draw(canvas:BitmapData):void {
	
			bg.draw(canvas, cameraPosition);
			
			whiteWalls.draw(canvas, cameraPosition, BlendMode.OVERLAY);
			orangeWalls.draw(canvas, cameraPosition, BlendMode.OVERLAY);
			blueWalls.draw(canvas, cameraPosition, BlendMode.OVERLAY);
			
			whiteRotator.draw(canvas, cameraPosition, BlendMode.OVERLAY);
			orangeRotator.draw(canvas, cameraPosition, BlendMode.OVERLAY);
			blueRotator.draw(canvas, cameraPosition, BlendMode.OVERLAY);
			
			ship.draw(canvas, cameraPosition, BlendMode.MULTIPLY);
			star.draw(canvas, cameraPosition, BlendMode.MULTIPLY);			
			
			skull.draw(canvas, cameraPosition, BlendMode.MULTIPLY);

			border.draw(canvas, cameraPosition);
			
		}
		
	}

}