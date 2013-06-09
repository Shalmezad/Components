package components 
{
	import entities.Entity;
	import flash.display.Bitmap;
	public class BitmapComponent implements ComponentInterface
	{
		public var image:Bitmap;
		public var position:PositionComponent;
		public function BitmapComponent(bm:Bitmap) 
		{
			image = bm;
		}
		public function attached(entity:Entity):void
		{
			position = entity.getComponent(PositionComponent) as PositionComponent;
			entity.attachEvent('draw', this.drawImage);
		}
		public function drawImage():void
		{
			Screen.screen.addChild(image);
		}
		
	}

}