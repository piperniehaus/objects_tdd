require_relative '../../lib/cash_register'

describe CashRegister do
  it 'should be a cash register' do
    expect(subject).to be_a(CashRegister)
  end
  describe '#total' do
    it 'returns 0.0 for new cash registers' do
      expect(subject.total).to eq('0.00')
    end
  end

  describe 'purchase(price)' do
    it 'should take a floating number and add that to the total' do
      expect do
        subject.purchase(10.50)
      end.to change(subject, :total).from('0.00').to('10.50')
    end

    it 'should return a number with two decimal pages as a string' do
      expect(subject.purchase(10.50)).to eq('10.50')
    end
  end

  describe '#pay(amount)' do
    context 'amount paid > total' do
      before do
        subject.purchase(10.00)
      end
      it 'should set the total to 0' do
        expect do
          subject.pay(12.00)
        end.to change(subject, :total).from('10.00').to('0.00')
      end
      it 'should return your change' do
        expect(subject.pay(12.00)).to eq('Your change is $2.00')
      end
    end

    context 'amount paid < total' do
      before do
        subject.purchase(10.00)
      end

      it 'should subtract amount paid from total' do
        expect do
          subject.pay(5.00)
        end.to change(subject, :total).from('10.00').to('5.00')
      end

      it 'should return your new total' do
        expect(subject.pay(5.00)).to eq('Your new total is $5.00')
      end
    end

    context 'amount paid == total' do
      before do
        subject.purchase(10.00)
      end

      it 'should set total to 0' do
        expect do
          subject.pay(10.00)
        end.to change(subject, :total).from('10.00').to('0.00')
      end

      it 'should return your change' do
        expect(subject.pay(10.00)).to eq('Your change is $0.00')
      end
    end
  end
end
