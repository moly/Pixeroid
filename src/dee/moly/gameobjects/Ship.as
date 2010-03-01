package dee.moly.gameobjects {
	
	import dee.moly.utils.ContentManager;
	import dee.moly.utils.Key;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	
	/**
	 * Hero ship
	 * @author moly
	 */
	
	public class Ship extends GameObject{
		
		private var rightBounds:int;
		private var lowerBounds:int;
		
		public function Ship(xpos:int, ypos:int, levelWidth:int, levelHeight:int) {
			
			texture = ContentManager.load("ship");
			
			position = new Point(xpos, ypos);
			
			rightBounds = levelWidth;
			lowerBounds = levelHeight;
			
			collisionTestPoints = new Vector.<Point>();
			collisionTestPoints.push(new Point(6, 25), new Point(31, 7), new Point(57, 24), new Point(23, 71), new Point(39, 71));
			
		}
		
		override public function update(dtSeconds:int):void {
			
			velocity.y += 0.1;
			
			position = position.add(velocity);
			
			checkBounds();
			
			handleInput();
			
		}
		
		override public function onCollision():void {
			
			velocity.x = -velocity.x / 2;
			velocity.y = -velocity.y / 2;
			position.x += velocity.x * 2;
			position.y += velocity.y * 2;
			
		}
		
		private function checkBounds():void {
			
			if (position.x > rightBounds - texture.width){
				position.x = rightBounds - texture.width;
				velocity.x = -velocity.x / 7;
			}
			
			if (position.x < 0) {
				position.x = 0;
				velocity.x = -velocity.x / 7;
			}
			
			if (position.y > lowerBounds - texture.height) {
				position.y = lowerBounds - texture.height;
				velocity.y = -velocity.y / 7;
			}
			
			if (position.y < 0) {
				position.y = 0;
				velocity.y = -velocity.y / 7;
			}
			
		}
		
		private function handleInput():void {
			
			if (Key.isDown(Keyboard.LEFT))
				velocity.x += -0.3;
				
			if (Key.isDown(Keyboard.RIGHT))
				velocity.x += 0.3;
				
			if (Key.isDown(Keyboard.UP))
				velocity.y += -0.3;
				
			if (Key.isDown(Keyboard.DOWN))
				velocity.y += 0.1;
				
		}
		
	}

}