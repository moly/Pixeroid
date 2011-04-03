package dee.moly.pixeroid.gamestates.levels 
{	
	import content.Content;
	import dee.moly.pixeroid.gameobjects.Background;
	import dee.moly.framework.GameObject;
	import dee.moly.pixeroid.gameobjects.items.RotatingParallaxWall;
	import dee.moly.pixeroid.gameobjects.items.Star;
	import dee.moly.pixeroid.gameobjects.items.ParallaxWall;
	import dee.moly.pixeroid.gameobjects.items.Skull;
	import dee.moly.pixeroid.gameobjects.Ship;
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
		
		private static const _borderTexture:BitmapData = Content.createTexture(Content.BorderTexture);
		private static const _bgTexture:BitmapData = Content.createTexture(Content.BGTexture);
		
		private static const _whiteWallsTexture:BitmapData = Content.createTexture(Content.WhiteWallsTexture);
		private static const _orangeWallsTexture:BitmapData = Content.createTexture(Content.OrangeWallsTexture);
		private static const _blueWallsTexture:BitmapData = Content.createTexture(Content.BlueWallsTexture);
		
		private static const _whiteRotatorTexture:BitmapData = Content.createTexture(Content.WhiteRotatorTexture);
		private static const _orangeRotatorTexture:BitmapData = Content.createTexture(Content.OrangeRotatorTexture);
		private static const _blueRotatorTexture:BitmapData = Content.createTexture(Content.BlueRotatorTexture);
		
		public function Level1() 
		{	
			
		}
		
		override public function init():void 
		{
			super.init();
			
			_levelWidth = _borderTexture.width;
			_levelHeight = _borderTexture.height;
			
			_bg = new Background(_bgTexture);
			add(_bg);
			
			_ship = new Ship(START_POINT.x, START_POINT.y, _levelWidth, _levelHeight);
			add(_ship);
			
			_star = new Star(END_POINT.x, END_POINT.y);
			add(_star);
			
			_skull = new Skull(580, 100);
			add(_skull);
			
			_whiteWalls = new ParallaxWall(_whiteWallsTexture, 0, 0, _ship, 0.1);
			_orangeWalls = new ParallaxWall(_orangeWallsTexture, 0, 0, _ship, 0.2);
			_blueWalls = new ParallaxWall(_blueWallsTexture, 0, 0, _ship, 0.3);
			add(_whiteWalls); add(_orangeWalls); add(_blueWalls);
			
			_whiteRotator = new RotatingParallaxWall(_whiteRotatorTexture, 420, 650, _ship, 0.1);
			_orangeRotator = new RotatingParallaxWall(_orangeRotatorTexture, 420, 650, _ship, 0.2);
			_blueRotator = new RotatingParallaxWall(_blueRotatorTexture, 420, 650, _ship, 0.3);
			add(_whiteRotator); add(_orangeRotator); add(_blueRotator);
			
			_border = new Background(_borderTexture);
			add(_border);
		}
		
		override public function update(dtSeconds:int):void 
		{	
			super.update(dtSeconds);
						
			if (_ship.checkCollision(_whiteWalls, 0xDD))
				_ship.onCollision();
				
			if (_ship.checkCollision(_star, 0xEE))
				changeState(Level2);	
		}
		
	}

}