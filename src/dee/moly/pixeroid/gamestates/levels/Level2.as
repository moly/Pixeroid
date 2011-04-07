package dee.moly.pixeroid.gamestates.levels 
{	
	import dee.moly.framework.graphics.Canvas;
	import dee.moly.pixeroid.gamestates.Level;
	import dee.moly.pixeroid.gameobjects.Background;
	import dee.moly.framework.GameGroup;
	import dee.moly.framework.GameSprite;
	import dee.moly.pixeroid.gameobjects.items.Coin;
	import dee.moly.pixeroid.gameobjects.enemies.Enemy;
	import dee.moly.pixeroid.gameobjects.enemies.EnemyMini;
	import dee.moly.pixeroid.gameobjects.enemies.WaypointEnemy;
	import dee.moly.pixeroid.gameobjects.enemies.CirclePathEnemy;
	import flash.display.BlendMode;
	import flash.display.BitmapData;
	import dee.moly.pixeroid.gameobjects.Ship;
	import dee.moly.pixeroid.gameobjects.items.Star;
	import flash.geom.Point;
	
	/**
	 * A pentagram like level
	 * @author moly
	 */
	
	public final class Level2 extends Level
	{	
		private static const START_POINT:Point = new Point(0, 0);
		private static const END_POINT:Point = new Point(430, 310);
		
		private var _bg:Background;
		
		private var _enemies:GameGroup;
		
		private var _wayPoints1:Vector.<Point>;
		private var _wayPoints2:Vector.<Point>;
		private var _wayPoints3:Vector.<Point>;
		
		private var _coins:GameGroup;
		
		[Embed(source='/Content/level2/border.png')]
		private static const BorderTexture:Class;
		private static const borderTexture:BitmapData = new BorderTexture().bitmapData;
		
		[Embed(source = '/Content/level2/bg.png')]
		private static const BGTexture:Class;
		private static const bgTexture:BitmapData = new BGTexture().bitmapData;
		
		public function Level2() 
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
			
			_followSprite = _ship;
			
			_star = new Star(END_POINT.x, END_POINT.y);
			add(_star);
			
			_wayPoints1 = new Vector.<Point>();
			_wayPoints1.push(new Point(454, 84), new Point(777, 270), new Point(578, 382), new Point(453, 292), new Point(324, 384), new Point(131, 273));
			
			_wayPoints2 = new Vector.<Point>();
			_wayPoints2.push(new Point(454, 293), new Point(607, 405), new Point(548, 586), new Point(356, 584), new Point(301, 402));
			
			_wayPoints3 = new Vector.<Point>();
			_wayPoints3.push(new Point(453, 78), new Point(780, 644), new Point(129, 642));
			
			_enemies = new GameGroup();
			_enemies.add(new WaypointEnemy(_wayPoints1, 0, 3),
							new WaypointEnemy(_wayPoints2, 3, 3),
							new WaypointEnemy(_wayPoints3, 2, 3),
							new CirclePathEnemy(453, 450, 374 , 5)
						);
			add(_enemies);
			
			_coins = new GameGroup();
			_coins.add(new Coin(445, 170), new Coin(445, 191), new Coin(445, 211), new Coin(445, 236), new Coin(445, 257),
						new Coin(426, 191), new Coin(462, 191));
						
			_coins.add(new Coin(181, 367), new Coin(181, 405), new Coin(147, 403), new Coin(148, 441), new Coin(147, 491));
			
			_coins.add(new Coin(362, 450), new Coin(545, 448), new Coin(455, 524));
			
			_coins.add(new Coin(414, 562), new Coin(415, 546), new Coin(434, 545), new Coin(454, 545), new Coin(476, 543),
						new Coin(497, 543), new Coin(497, 564));
			
			_coins.add(new Coin(360, 611), new Coin(381, 611), new Coin(402, 611), new Coin(423, 611), new Coin(444, 611),
						new Coin(465, 611), new Coin(486, 611), new Coin(507, 611), new Coin(528, 611));
			add(_coins);			
						
			
			_border = new Background(borderTexture);
			add(_border);
		}
		
		override public function update(dtSeconds:int):void 
		{	
			super.update(dtSeconds);
			
			for each(var enemy:Enemy in _enemies.members) 
			{					
				if (_ship.checkCollision(enemy, 0x22)) {
					
					_ship.onCollision();
				}
					
				for each(var miniEnemy:EnemyMini in enemy.miniEnemies) 
				{
					if (_ship.checkCollision(miniEnemy, 0x22)) {
						// TODO: 
						_ship.onCollision();
					}
				}
				
			}
			
			for (var i:int = _coins.count - 1; i >= 0; --i) 
			{
				if (_ship.checkCollision(_coins.members[i] as GameSprite, 0x22))
					_coins.members.splice(i, 1);
			}
			
			if (_ship.checkCollision(_star, 0xDD) && _coins.count == 0)
				changeState(Level1);
		}
		
	}

}