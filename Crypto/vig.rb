module Finder
    class VigApplicationWin < Gtk::Window
        type_register
        class << self
            def init
                set_template resource: '/com/iridakos/Crypto/vig.ui'
                bind_template_child 'key_label'
                bind_template_child 'key_entry'
                bind_template_child 'txt_label'
                bind_template_child 'txt_entry'
                bind_template_child 'go_button'
                bind_template_child 'load_label'
            end
        end

        def initialize(application)
            super application: application
            set_title 'Vigenere Cipher'
            go_button.signal_connect 'clicked' do |button|
                require '/home/rawleyperetz/Desktop/RubyApp/Crypto/caesar.rb'
                ctexts = Cryptscript.new(txt_entry.text)
                cptexts = ctexts.vigenere(txt_entry.text, key_entry.text)
                load_label.text = cptexts
                #second_win = Finder::Second_Win.new(application)
            end
        end
    end
end
