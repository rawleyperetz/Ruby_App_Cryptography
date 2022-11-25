module Finder
    class Application < Gtk::Application
        PROPERTIES = [:dropdown, :length_entry, :width_entry].freeze
        DROPDOWN = ["Caesar Cipher", "Vigenere"].freeze
        attr_accessor *PROPERTIES
        def initialize
            super 'com.iridakos.Crypto', Gio::ApplicationFlags::FLAGS_NONE
            #@dropdown = DROPDOWN
            signal_connect :activate do |application|
                window = Finder::MainApplicationWin.new(application)
                window.present
            end
        end
    end
end 