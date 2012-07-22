package examples.range {

	public class Range {

		private var _start:int;
		private var _end:int;

		public function Range(startValue:int, endValue:int) {
			this._start = startValue;
			this._end   = endValue;
		}

		public function get end():int {
			return _end;
		}

		public function get start():int {
			return _start;
		}

		public function contains(value:int):Boolean {
			return value >= _start && value <= _end;
		}

		public function intersection(range2:Range):Range {
			return new Range(Math.max(this._start, range2._start), Math.min(this._end, range2._end));
		}
	}
}
