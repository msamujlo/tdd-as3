package examples.actionsQueue {

	import org.flexunit.Assert;
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.asserts.fail;
	import org.hamcrest.collection.array;
	import org.hamcrest.object.equalTo;

	public class ActionsQueueTest {

		[Before]
		public function setUp():void {
		}

		[After]
		public function tearDown():void {
		}

		[BeforeClass]
		public static function setUpBeforeClass():void {
		}

		[AfterClass]
		public static function tearDownAfterClass():void {
		}

		[Test('state verification example')]
		public function can_add_actions_to_queue():void {
			// arrange 
			var queue:ActionsQueue=new ActionsQueue();

			// act
			queue.add(new DummyAction());
			queue.add(new DummyAction());
			queue.add(new DummyAction());

			// assert
			assertThat(queue.actionsLeft, equalTo(3));
		}

		[Test(description='delta assertion example')]
		public function executes_added_action_when_started():void {
			// arrange
			var queue:ActionsQueue=new ActionsQueue();
			var action:DummyAction=new DummyAction();
			queue.add(action);

			// act
			queue.start();

			// assert
			assertTrue(action.executed);
		}

		[Ignore]
		[Test(description='exception handling and ignoring test', expects="examples.actionsQueue.QueueError")]
		public function cant_add_actions_after_start():void {
			throw new QueueError();
		}

		[Ignore]
		[Test(description='handling asynchronous events', async)]
		public function dispatches_complete_event_when_all_actions_were_executed():void {
			fail("not implemented");
		}

	}
}
import examples.actionsQueue.Action;

class DummyAction implements Action {
	private var _executed:Boolean;
	public function get executed():Boolean {
		return _executed;
	}
	public function execute():void {
		_executed=true;
	}
}