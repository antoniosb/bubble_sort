require_relative 'bubble_sort'

describe BubbleSort do
  describe '#bubble_sort' do
    it 'sorts an array of integers' do
      expect(subject.bubble_sort [8,7,6,5,4,3,2,1]).to eq [1,2,3,4,5,6,7,8]
    end

    it 'sort negative numbers' do
      expect(subject.bubble_sort [-1, -2, -3, -4, 0]).to eq [-4, -3, -2, -1, 0]
    end

    it 'sort with repeated numbers' do
      expect(subject.bubble_sort [0, 0, 1, 2, 2, -3, -5, -3]).to eq [-5, -3, -3, 0, 0, 1, 2, 2]
    end

    it 'raises error with invalid argument' do
      expect { subject.bubble_sort "4,3,2,1" }
        .to raise_error ArgumentError

      expect { subject.bubble_sort Hash.new ['a', 1, 'b', 2] }
        .to raise_error ArgumentError
    end
  end

  describe '#bubble_sort_by' do

    it 'yields the array elements to the block' do
      expect { |block| subject.bubble_sort_by(['hi', 'hello', 'hey', 'wazzap'], &block) }
        .to yield_successive_args(['hi','hello'],['hello','hey'],['hey','wazzap'])
    end

    it 'returns the sorted input based on block return' do
      expect(subject.bubble_sort_by(['hi', 'hello', 'hey']) do |left, right|
        right.length - left.length
      end).to eq ['hi', 'hey', 'hello']

      expect(subject.bubble_sort_by([1,2,3,4,5]) do |left, right|
        left - right
      end).to eq [5, 4, 3, 2, 1]
    end

  end
end