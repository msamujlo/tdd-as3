package examples.range {
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;

	public class RangeTest {

		private var single_point_range:Range;

		private var start_point:int;

		[Before]
		public function setUp():void {
			start_point = 0;
			single_point_range=new Range(start_point, start_point);
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

		[Test]
		public function single_point_range_contains_start_point():void {
			assertTrue(single_point_range.contains(start_point));
		}

		[Test]
		public function single_point_range_doesnt_contain_nearest_points():void {
			assertFalse(single_point_range.contains(start_point - 1));
			assertFalse(single_point_range.contains(start_point + 1));
		}

	}
}
