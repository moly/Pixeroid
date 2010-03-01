﻿package dee.moly.gameobjects {
	
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	/**
	 * A base class for enemies
	 * @author moly
	 */
	
	public class Enemy extends GameObject{
		
		private var followers:Vector.<EnemyMini>;
		
		private var pastPoints:Vector.<Point>;
		
		public function Enemy(numFollowers:int) {
			
			pastPoints = new Vector.<Point>();
			
			followers = new Vector.<EnemyMini>();
			
			for (var i:int = 0; i < numFollowers; i++)
				followers.push(new EnemyMini());
			
		}
		
		override public function update(dtSeconds:int):void {
		
			moveFollowers();
			
			pastPoints.push(position);
			
		}
		
		override public function draw(canvas:BitmapData, cameraPosition:Point, blendMode:String = ""):void {
			
			super.draw(canvas, cameraPosition.subtract(new Point( -texture.width / 2, -texture.height / 2)));
			
			for each (var f:EnemyMini in followers)
				f.draw(canvas, cameraPosition.subtract(new Point( -f.width / 2, -f.height / 2)));
			
		}
		
		private function moveFollowers():void {
			
			for (var i:int = 0; i < followers.length; i++) {
				if(pastPoints.length > i * 5){
					followers[i].x = pastPoints[i * 5].x;
					followers[i].y = pastPoints[i * 5].y;
				}
			}
			
			if (pastPoints.length > followers.length * 5)
				pastPoints.shift();
			
		}
		
	}

}