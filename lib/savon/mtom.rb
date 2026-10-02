# frozen_string_literal: true

module Savon
  # MTOM request encoding (https://www.w3.org/TR/soap12-mtom/) for {Savon::Builder}.
  module Mtom
    private

    def apply_mtom_encoding(multipart_message, message_xml)
      multipart_message.transport_encoding = 'binary'
      message_xml.force_encoding('BINARY')
    end

    def xml_part_content_type
      return 'text/xml' unless @locals[:mtom]

      "application/xop+xml; charset=#{@globals[:encoding]}; type=\"text/xml\""
    end
  end
end
