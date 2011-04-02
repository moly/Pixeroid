package dee.moly.gamestates.levels 
{	
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
	
	public final class Level1 extends LevelState
	{	
		private static const START_POINT:Point = new Point(10, 850);
		private static const END_POINT:Point = new Point(450, 600);
		
		private var _whiteWalls:ParallaxWall;
		private var _orangeWalls:ParallaxWall;
		private var _blueWalls:ParallaxWall;
		
		private var _whiteRotator:RotatingParallaxWall;
		private var _orangeRotator:RotatingParallaxWall;
		private var _blueRotator:RotatingParallaxWall;
		
		private var _bg:Background;
		
		private var _skull:Skull;
		
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
		
		public function Level1() 
		{	
			
		}
		
		override public function init():void 
		{
			super.init();
			
			_levelWidth = borderTexture.width;
			_levelHeight = borderTexture.height;
			
			_bg = new Background(bgTexture);
			add(_bg);
			
			_ship = new Ship(START_POINT.x, START_POINT.y, _levelWidth, _levelHeight);
			add(_ship);
			
			_star = new Star(END_POINT.x, END_POINT.y);
			add(_star);
			
			_skull = new Skull(580, 100);
			add(_skull);
			
			_whiteWalls = new ParallaxWall(whiteWallsTexture, 0, 0, _ship, 0.1);
			_orangeWalls = new ParallaxWall(orangeWallsTexture, 0, 0, _ship, 0.2);
			_blueWalls = new ParallaxWall(blueWallsTexture, 0, 0, _ship, 0.3);
			add(_whiteWalls); add(_orangeWalls); add(_blueWalls);
			
			_whiteRotator = new RotatingParallaxWall(whiteRotatorTexture, 420, 650, _ship, 0.1);
			_orangeRotator = new RotatingParallaxWall(orangeRotatorTexture, 420, 650, _ship, 0.2);
			_blueRotator = new RotatingParallaxWall(blueRotatorTexture, 420, 650, _ship, 0.3);
			add(_whiteRotator); add(_orangeRotator); add(_blueRotator);
			
			_border = new Background(borderTexture);
			add(_border);
		}
		
		override public function update(dtSeconds:int):void 
		{	
			super.update(dtSeconds);
			//scrollCamera();
			
			//ship.update(dtSeconds);
			
			if (_ship.checkCollision(_whiteWalls, 0xDD))
				_ship.onCollision();
				
			if (_ship.checkCollision(_star, 0xEE))
				changeState(Level2);
				
			//whiteWalls.update(dtSeconds);	
			//orangeWalls.update(dtSeconds);
			//blueWalls.update(dtSeconds);
			
			//whiteRotator.update(dtSeconds);
			//orangeRotator.update(dtSeconds);
			//blueRotator.update(dtSeconds);	
		}
		
		override public function draw(canvas:BitmapData):void 
		{
			super.draw(canvas);
			/*
			bg.draw(canvas, cameraPosition);
			
			whiteWalls.draw(canvas, cameraPosition);
			orangeWalls.draw(canvas, cameraPosition);
			blueWalls.draw(canvas, cameraPosition);
			
			whiteRotator.draw(canvas, cameraPosition);
			orangeRotator.draw(canvas, cameraPosition);
			blueRotator.draw(canvas, cameraPosition);
			
			ship.draw(canvas, cameraPosition);
			star.draw(canvas, cameraPosition);			
			
			skull.draw(canvas, cameraPosition);

			border.draw(canvas, cameraPosition);
			*/
		}
		
	}

}