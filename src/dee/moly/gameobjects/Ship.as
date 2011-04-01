package dee.moly.gameobjects {
	
	import dee.moly.utils.Animation;
	import dee.moly.utils.Key;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	
	/**
	 * Hero ship
	 * @author moly
	 */
	
	public final class Ship extends GameObject{
		
		private var startPoint:Point;
		
		private var rightBounds:int;
		private var lowerBounds:int;
		
		private var isAlive:Boolean;
		
		private var dieingAnimation:Animation;
		
		[Embed(source = '/Content/ship.png')]
		private static const ShipTexture:Class;
		private static const shipTexture:BitmapData = new ShipTexture().bitmapData;
		
		[Embed(source = '/Content/shipSheet.png')]
		private static const ShipSheet:Class;
		private static const shipSheet:BitmapData = new ShipSheet().bitmapData;
		
		public function Ship(x:int, y:int, levelWidth:int, levelHeight:int) {
			
			super(shipTexture, x, y);
			
			startPoint = new Point(x, y);
			
			rightBounds = levelWidth;
			lowerBounds = levelHeight;
			
			reset();
		}
		
		override public function update(dtSeconds:int):void {
			
			if (isAlive != true) {
				moveBackToStart(dtSeconds);
				return;
			}
			
			velocity.y += 0.1;
			
			position = position.add(velocity);
			
			checkBounds();
			
			handleInput();
			
		}
		
		override public function onCollision():void {
			
			if (isAlive != true)
				return;
				
			isAlive = false;
			texture = dieingAnimation;
			
			var dist:int = Math.sqrt(Math.pow(startPoint.x - position.x, 2) + Math.pow(startPoint.y - position.y, 2));
			velocity.x = ((startPoint.x - position.x) / dist) * 20;
			velocity.y = ((startPoint.y - position.y) / dist) * 20;
			
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
		
		private function reset():void {
			
			texture = shipTexture;
			dieingAnimation = new Animation(3, 5, 14, shipSheet);
			
			position = new Point(startPoint.x, startPoint.y);
			velocity = new Point(0, 0);
			
			isAlive = true;
			
		}
		
		private function moveBackToStart(dtSeconds:int):void {
			
			dieingAnimation.update(dtSeconds);
			
			if (dieingAnimation.currentFrame == dieingAnimation.numFrames)
				position = position.add(velocity);
				
			if (Math.pow(startPoint.x - position.x, 2) + Math.pow(startPoint.y - position.y, 2) < 275)
				reset();
			
		}
		
	}

}