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
			Screen.screen.addChild(image);
			image.visible = false;
			entity.attachEvent('draw', this.drawImage);
			entity.attachEvent('update', this.update);
		}
		public function drawImage(data:Object):void
		{
			image.visible = true;
		}
		public function update(data:Object):void
		{
			image.x = position.x;
			image.y = position.y;
			image.visible = false;
		}
		
	}

}