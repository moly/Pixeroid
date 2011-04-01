package dee.moly.gamestates.levels {
	
	import dee.moly.gameobjects.Background;
	import dee.moly.gameobjects.items.Coin;
	import dee.moly.gameobjects.enemies.Enemy;
	import dee.moly.gameobjects.enemies.EnemyMini;
	import dee.moly.gameobjects.enemies.WaypointEnemy;
	import dee.moly.gameobjects.enemies.CirclePathEnemy;
	import flash.display.BlendMode;
	import flash.display.BitmapData;
	import dee.moly.gameobjects.Ship;
	import dee.moly.gameobjects.items.Star;
	import flash.geom.Point;
	
	/**
	 * A pentagram like level
	 * @author moly
	 */
	
	public final class Level2 extends LevelState{
		
		private static const START_POINT:Point = new Point(0, 0);
		private static const END_POINT:Point = new Point(430, 310);
		
		private var bg:Background;
		
		private var enemies:Vector.<Enemy>;
		
		private var wayPoints1:Vector.<Point>;
		private var wayPoints2:Vector.<Point>;
		private var wayPoints3:Vector.<Point>;
		
		private var coins:Vector.<Coin>;
		
		[Embed(source='/Content/level2/border.png')]
		private static const BorderTexture:Class;
		private static const borderTexture:BitmapData = new BorderTexture().bitmapData;
		
		[Embed(source = '/Content/level2/bg.png')]
		private static const BGTexture:Class;
		private static const bgTexture:BitmapData = new BGTexture().bitmapData;
		
		public function Level2() {
			
			border = new Background(borderTexture);
			
			bg = new Background(bgTexture);
			
			ship = new Ship(START_POINT.x, START_POINT.y, border.width, border.height);
			
			star = new Star(END_POINT.x, END_POINT.y);
			
			wayPoints1 = new Vector.<Point>();
			wayPoints1.push(new Point(454, 84), new Point(777, 270), new Point(578, 382), new Point(453, 292), new Point(324, 384), new Point(131, 273));
			
			wayPoints2 = new Vector.<Point>();
			wayPoints2.push(new Point(454, 293), new Point(607, 405), new Point(548, 586), new Point(356, 584), new Point(301, 402));
			
			wayPoints3 = new Vector.<Point>();
			wayPoints3.push(new Point(453, 78), new Point(780, 644), new Point(129, 642));
			
			enemies = new Vector.<Enemy>();
			enemies.push(new WaypointEnemy(wayPoints1, 0, 3),
							new WaypointEnemy(wayPoints2, 3, 3),
							new WaypointEnemy(wayPoints3, 2, 3),
							new CirclePathEnemy(453, 450, 374 , 5)
						);
			
			coins = new Vector.<Coin>();
			coins.push(new Coin(445, 170), new Coin(445, 191), new Coin(445, 211), new Coin(445, 236), new Coin(445, 257),
						new Coin(426, 191), new Coin(462, 191));
						
			coins.push(new Coin(181, 367), new Coin(181, 405), new Coin(147, 403), new Coin(148, 441), new Coin(147, 491));
			
			coins.push(new Coin(362, 450), new Coin(545, 448), new Coin(455, 524));
			
			coins.push(new Coin(414, 562), new Coin(415, 546), new Coin(434, 545), new Coin(454, 545), new Coin(476, 543),
						new Coin(497, 543), new Coin(497, 564));
			
			coins.push(new Coin(360, 611), new Coin(381, 611), new Coin(402, 611), new Coin(423, 611), new Coin(444, 611),
						new Coin(465, 611), new Coin(486, 611), new Coin(507, 611), new Coin(528, 611));
						
		}
		
		override public function update(dtSeconds:int):void {
			
			scrollCamera();
			
			ship.update(dtSeconds);
			
			for each(var enemy:Enemy in enemies) {
				
				enemy.update(dtSeconds);
				
				if (ship.checkCollision(enemy, 0x22))
					ship.onCollision();
					
				for each(var miniEnemy:EnemyMini in enemy.miniEnemies) {
					if (ship.checkCollision(miniEnemy, 0x22))
						ship.onCollision();
				}
				
			}
			
			for (var i:int = coins.length - 1; i >= 0; --i) {
				if (ship.checkCollision(coins[i], 0x22))
					coins.splice(i, 1);
			}
			
			if (ship.checkCollision(star, 0xDD) && coins.length == 0)
				changeState(Level1);
			
		}
		
		override public function draw(canvas:BitmapData):void {
			
			bg.draw(canvas, cameraPosition);
			
			ship.draw(canvas, cameraPosition);
			star.draw(canvas, cameraPosition);
			
			for each(var enemy:Enemy in enemies)
				enemy.draw(canvas, cameraPosition);
				
			for each(var coin:Coin in coins)
				coin.draw(canvas, cameraPosition);
			
			border.draw(canvas, cameraPosition);
			
		}
		
	}

}