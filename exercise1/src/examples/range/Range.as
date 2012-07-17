package examples.range {

	public class Range {
		private var to:int;
		private var from:int;

		public function Range(from:uint, to:uint) {
			this.from=from;
			this.to=to;
		}

		public function contains(value:int):Boolean {
			return value >= from && value <= to;
		}
	}
}
