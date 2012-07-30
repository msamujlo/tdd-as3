package examples.actionsQueue {

	public class ActionsQueue {

		private var _actions:Vector.<Action>=new Vector.<Action>();

		public function ActionsQueue() {
		}

		public function get actionsLeft():uint {
			return _actions.length;
		}

		public function add(action:Action):void {
			_actions.push(action);
		}

		public function start():void {
			var currentAction:Action=_actions.shift();
			currentAction.execute();
		}
	}
}
