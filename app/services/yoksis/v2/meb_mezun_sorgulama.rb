module Services
  module Yoksis
    module V2
      # client = Services::Yoksis::V2::MebMezunSorgulama.new
      class MebMezunSorgulama
        def initialize
          @client = Savon.client(
            wsdl: 'https://servisler.yok.gov.tr/ws/mebmezunsorgulav2?WSDL',
            convert_request_keys_to: :camelcase,
            basic_auth: [ENV['YOKSIS_USER'], ENV['YOKSIS_PASSWORD']],
            soap_version: 2
          )
        end

        def mezuniyet_verilerini_getir(queried_id_number)
          message = {
            'TCKIMLIKNO' => queried_id_number,
            'ServicePassWord' => ENV['YOKSIS_USER']
          }

          @client.call(__method__, message: message)
                 .body[:mezuniyet_verilerini_getir_response]
        end

        def mezuniyet_verilerini_getir_detay
          message = {
            'TCKIMLIKNO' => queried_id_number,
            'ServicePassWord' => ENV['YOKSIS_USER']
          }

          @client.call(__method__, message: message)
                 .body[:mezuniyet_verilerini_getir_detay_response]
        end
      end
    end
  end
end