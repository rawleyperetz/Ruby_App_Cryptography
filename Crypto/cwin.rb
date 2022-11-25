module Finder
    class CaesarApplicationWin < Gtk::Window
        type_register
        class << self
            def init
                set_template resource: '/com/iridakos/Crypto/caesarwin.ui'
                bind_template_child 'pt_label'
                bind_template_child 'ready_label'
                bind_template_child 'brute_button'
                bind_template_child 'pt_entry'
            end
        end

        def initialize(application)
            super application: application
            set_title 'Caesar Cipher'
            
            brute_button.signal_connect 'clicked' do |button|
                require '/home/rawleyperetz/Desktop/RubyApp/Crypto/caesar.rb'
                ctexts = Cryptscript.new(pt_entry.text)
                ciphertexts = ctexts.caesar_brute()
                ready_label.text = ciphertexts
                #second_win = Finder::Second_Win.new(application)
            end

        end
    end
end