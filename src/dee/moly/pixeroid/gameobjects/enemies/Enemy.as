package dee.moly.pixeroid.gameobjects.enemies 
{	
	import content.Content;
	import dee.moly.framework.GameSprite;
	import dee.moly.framework.graphics.Canvas;
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	/**
	 * A base class for enemies
	 * @author moly
	 */
	
	public class Enemy extends GameSprite
	{	
		private static const _enemyTexture:BitmapData = Content.createTexture(Content.EnemyTexture);
		
		private var _followers:Vector.<EnemyMini>;
		public function get miniEnemies():Vector.<EnemyMini> {
			return _followers;
		}
		
		private var _pastPoints:Vector.<Point>;
		
		public function Enemy(numFollowers:int) 
		{	
			super(_enemyTexture);
			
			_pastPoints = new Vector.<Point>();
			
			_followers = new Vector.<EnemyMini>();
			
			for (var i:int = 0; i < numFollowers; i++)
				_followers.push(new EnemyMini());
		}
		
		override public function update(dtSeconds:int):void
		{
			moveFollowers();
			_pastPoints.push(_position);
		}
		
		override public function draw(canvas:Canvas, cameraPosition:Point = null):void 
		{	
			super.draw(canvas, cameraPosition.subtract(new Point( -_texture.width / 2, -_texture.height / 2)));
			
			for each (var f:EnemyMini in _followers)
				f.draw(canvas, cameraPosition.subtract(new Point( -f.width / 2, -f.height / 2)));
		}
		
		private function moveFollowers():void 
		{	
			for (var i:int = 0; i < _followers.length; i++) 
			{
				if (_pastPoints.length > i * 5)
				{
					_followers[i].x = _pastPoints[i * 5].x;
					_followers[i].y = _pastPoints[i * 5].y;
				}
			}
			
			if (_pastPoints.length > _followers.length * 5)
				_pastPoints.shift();
		}
		
	}

}