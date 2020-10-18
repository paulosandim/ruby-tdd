class Vingadores
    attr_accessor :list

    def initialize
        self.list = []
    end

    def put(vingador)
        self.list.push(vingador)
    end
    
end

# TDD - Desenvolvimento Guiado por Testes
# A Classe só foi criada por conta do teste abaixo
describe Vingadores do
    it 'deve adicionar um vingador' do
        vi = Vingadores.new

        vi.put('Homem Aranha')
        expect(vi.list).to eql ['Homem Aranha']
    end
end