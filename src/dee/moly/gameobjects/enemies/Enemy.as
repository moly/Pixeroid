package dee.moly.gameobjects.enemies 
{	
	import dee.moly.gameobjects.GameSprite;
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	/**
	 * A base class for enemies
	 * @author moly
	 */
	
	public class Enemy extends GameSprite
	{	
		public function get miniEnemies():Vector.<EnemyMini> {
			return followers;
		}
		private var followers:Vector.<EnemyMini>;
		
		private var pastPoints:Vector.<Point>;
		
		[Embed(source = '/Content/level2/enemy.png')]
		private static const EnemyTexture:Class;
		private static const enemyTexture:BitmapData = new EnemyTexture().bitmapData;
		
		public function Enemy(numFollowers:int) 
		{	
			super(enemyTexture);
			
			pastPoints = new Vector.<Point>();
			
			followers = new Vector.<EnemyMini>();
			
			for (var i:int = 0; i < numFollowers; i++)
				followers.push(new EnemyMini());
		}
		
		override public function update(dtSeconds:int):void
		{
			moveFollowers();
			pastPoints.push(_position);
		}
		
		override public function draw(canvas:BitmapData, cameraPosition:Point):void 
		{	
			super.draw(canvas, cameraPosition.subtract(new Point( -_texture.width / 2, -_texture.height / 2)));
			
			for each (var f:EnemyMini in followers)
				f.draw(canvas, cameraPosition.subtract(new Point( -f.width / 2, -f.height / 2)));
		}
		
		private function moveFollowers():void 
		{	
			for (var i:int = 0; i < followers.length; i++) 
			{
				if (pastPoints.length > i * 5)
				{
					followers[i].x = pastPoints[i * 5].x;
					followers[i].y = pastPoints[i * 5].y;
				}
			}
			
			if (pastPoints.length > followers.length * 5)
				pastPoints.shift();
		}
		
	}

}