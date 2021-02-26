require_relative '../app/banco'

describe ContaCorrente do
    
    describe 'Saque' do
        context 'quando o valor é positivo' do
            before(:all) do
                @conta = ContaCorrente.new(1000.00)
                @conta.saque(200)
                # o @ deixa a variável disponível para todo contexto
            end
            it 'então atualiza saldo' do
                expect(@conta.saldo).to eql 800.00
            end
        end

        context 'quando o saldo é zero' do
            before(:all) do
                @conta = ContaCorrente.new(0.00)
                @conta.saque(100.00)
            end
            it 'então vejo mensagem' do
                expect(@conta.mensagem).to eql 'Saldo insuficiente para saque :('
            end
            it 'e o saldo final com zeros' do
                expect(@conta.saldo).to eql 0.00
            end
        end

        context 'quando o saldo é insuficiente' do
            before(:all) do
                @conta = ContaCorrente.new(100.00)
                @conta.saque(101.00)
            end
            it 'então vejo mensagem' do
                expect(@conta.mensagem).to eql 'Saldo insuficiente para saque :('
            end
            it 'e o saldo permanece' do
                expect(@conta.saldo).to eql 100.00
            end
        end

        context 'quando excede o limite de saque' do
            before(:all) do
                @conta = ContaCorrente.new(1000.00)
                @conta.saque(700.01)
            end
            it 'então exibe mensagem' do
                expect(@conta.mensagem).to eql 'Limite máximo por saque é de R$ 700'
            end
            it 'e o saldo permanece' do
                expect(@conta.saldo).to eql 1000.00
            end
        end
    end

end