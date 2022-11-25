module Finder 
    class MainApplicationWin < Gtk::Window 
        type_register
        #attr_accessor :len_entry
        class << self
            def init
                set_template resource: '/com/iridakos/Crypto/Crypto.ui'
                bind_template_child 'go_button'
                bind_template_child 'fwin_combo'
            end
        end

        

        def initialize(application)
            super application: application
            set_title 'Cryptography'

            model = Gtk::ListStore.new(String)
            Finder::Application::DROPDOWN.each do |dropdown|
                    iterator = model.append
                    iterator[0] = dropdown
            end

            fwin_combo.model = model 
                renderer = Gtk::CellRendererText.new
                fwin_combo.pack_start(renderer, true)
                fwin_combo.set_attributes(renderer, "text" => 0)
                fwin_combo.set_active(Finder::Application::DROPDOWN.index(application.dropdown)) if application.dropdown
            
            # cancel_button.signal_connect 'clicked' do |button|
            #     close
            # end

            go_button.signal_connect 'clicked' do |button|
                if fwin_combo.active == 0
                    close 
                    #signal_connect :activate do |application|
                    c_window = Finder::CaesarApplicationWin.new(application)
                    c_window.present
                else 
                    close
                    v_window = Finder::VigApplicationWin.new(application)
                    v_window.present 
                end
                # second_win = Finder::Second_Win.new(application)
            end
                
                
        end 
    end
end

       
