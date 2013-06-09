package components 
{
	import entities.Entity;
	import flash.display.BitmapData;
	public class BitmapDataComponent implements ComponentInterface
	{
		
		public var image:BitmapData;
		public var position:PositionComponent;
		public function BitmapDataComponent(bm:BitmapData) {
			image = bm;
		}
		public function attached(entity:Entity) :void
		{
			position = entity.getComponent(PositionComponent) as PositionComponent; //Get the position component
			entity.attachEvent('draw',this.drawImage); //When the event 'draw' triggers, run function drawImage
		}
		public function drawImage() :void
		{
			//Screen.copyPixels(image,position.x,position.y,image.width,image.height); //Draw the image according to the position coordinates.
		}
		
	}

}