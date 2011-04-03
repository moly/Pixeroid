package dee.moly.framework.utils 
{
	/**
	 * Some common maths functions not available in Math.as
	 * @author moly
	 */
	
	public class MathExtension
	{
		
		public function MathExtension() 
		{
				throw new Error("Cannot instantiate static class MathExtension");
		}
		
		public static function clamp(value:Number, min:Number, max:Number):Number
		{	
			if(value < min)
				return min;
				
			if(value > max)
				return max;
				
			return value <= 0 || value >= 0 ? value : 0;
		}
		
	}

}