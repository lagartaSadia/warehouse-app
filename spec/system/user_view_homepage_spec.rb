require 'rails_helper'

describe 'Visitante acessa a tela inicial' do
    it 'e vê o nome da app' do
        # Arrange

        # Act
        visit('/')

        # Assert
        expect(page).to have_content('Sistema de Galpões e Estoque')
    end

    it 'e vê a lista de galpões' do
        # Arrange
        Warehouse.create(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60_000)
        Warehouse.create(name: 'Maceio', code: 'MCZ', city: 'Maceio', area: 50_000)

        # Act
        visit('/')

        # Assert
        expect(page).not_to have_content('Não existem galpões cadastrados')
        expect(page).to have_content('Rio')
        expect(page).to have_content('Código: SDU')
        expect(page).to have_content('Cidade: Rio de Janeiro')
        expect(page).to have_content('60000 m²')

        expect(page).to have_content('Maceio')
        expect(page).to have_content('Código: MCZ')
        expect(page).to have_content('Cidade: Maceio')
        expect(page).to have_content('50000 m²')
    end

    it 'e não existem galpões cadastrados' do
        # Arrange

        # Act
        visit('/')

        # Assert
        expect(page).to have_content('Não existem galpões cadastrados')
    end
end