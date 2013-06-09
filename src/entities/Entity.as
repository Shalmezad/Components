package entities 
{
	import components.ComponentInterface;
	public class Entity 
	{
		public var activeComponents:Array; 
		public function Entity()
		{
			activeComponents = new Array();
		}
		public function attachComponent(component:ComponentInterface):void
		{
			//add the component to the list
			//TODO: Add component to component array
			activeComponents.push(component);
			//call the components attached() 
			component.attached(this);
		}
		public function getComponent(type:Class):ComponentInterface
		{
			for each (var component:ComponentInterface in activeComponents) {
				if (component as type) {
					return component;
				}
			}
			return null;
		}
		public function dispatchEvent(keyword:String, data:Object):void
		{
			
		}
		public function attachEvent(keyword:String, callback:Function, priority:int = 0):void
		{
			
		}
	}

}