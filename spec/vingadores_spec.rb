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
        vingadores = Vingadores.new

        vingadores.put('Homem-aranha')
        expect(vingadores.list).to include 'Homem-aranha'
    end

    it 'deve adicionar uma lista de vingadores' do
       vingadores = Vingadores.new
       vingadores.put('Thor')
       vingadores.put('Hulk')
       vingadores.put('Homem-aranha')
       
       resultado = vingadores.list.size > 0
       expect(resultado).to be true
    end

    it 'Thor deve ser o primeiro da lista' do
        vingadores = Vingadores.new
        
        vingadores.put('Thor')
        vingadores.put('Hulk')
        vingadores.put('Homem-aranha')

        expect(vingadores.list).to start_with('Thor')
    end

    it 'Homem de Ferro deve ser o último da lista' do
        vingadores = Vingadores.new
        
        vingadores.put('Thor')
        vingadores.put('Hulk')
        vingadores.put('Homem-aranha')
        vingadores.put('Homem de Ferro')

        expect(vingadores.list).to end_with('Homem de Ferro')
    end

    it 'deve conter o sobrenome' do
        vingador = 'Peter Parker'

        expect(vingador).to match(/Peter Parker/)
        expect(vingador).not_to match(/Paulo/)
    end
end