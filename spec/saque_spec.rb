class ContaCorrente
    attr_accessor :saldo
    
    def initialize(saldo)
        self.saldo = saldo
    end

    def saque(valor)
        self.saldo -= valor
    end
end

describe ContaCorrente do
    
    describe 'Saque' do
        context 'quando o valor é positivo' do
            before(:all) do
                @conta = ContaCorrente.new(1000.00)
                @conta.saque(200)
                # o @ deixa a variável disponível para todo contexto
            end
            it 'entao atualiza saldo' do
                expect(@conta.saldo).to eql 800.00
            end
        end
    end
    
end