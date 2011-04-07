package dee.moly.framework.graphics 
{
	import flash.display.BitmapData;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author moly
	 */
	
	public class AnimationPlayer
	{
		private var _animation:Animation;
		public function get animation():Animation{
			return _animation;
		}
		
		private var _frameIndex:int;
		public function get frameIndex():int{
			return _frameIndex;
		}
		
		private var _clipRect:Rectangle;
		
		// The amount of time in seconds that the current frame has been shown for
		private var _time:Number;

		public function AnimationPlayer()
		{

		}

		public function playAnimation(animation:Animation):void
		{
			// if this animation is already running, do not restart it.
			if(_animation == animation)
				return;

			_animation = animation;
			_frameIndex = 0;
			_time = 0;

			_clipRect = new Rectangle(0, 0, _animation.frameWidth, _animation.frameHeight);
		}
		
		public function update(dtSeconds:int):void
		{
			// process passing time.
			_time += dtSeconds / 1000;
			
			while (_time > _animation.frameTime)
			{
				_time -= _animation.frameTime;

				// advance the frame index; looping or clamping as appropriate.
				if(_animation.repeat)
					_frameIndex  = (_frameIndex + 1) % _animation.frameCount;
				else
					_frameIndex = Math.min(_frameIndex + 1, _animation.frameCount - 1);				
			}
			
			_clipRect.x = _frameIndex * _animation.frameWidth;
		}
		
		public function draw(canvas:Canvas, position:Point, blendMode:String):void
		{
			canvas.draw(_animation.texture, _clipRect, position, blendMode);
		}

	}

}