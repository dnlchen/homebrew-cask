cask :v1 => 'switchresx' do
  version '4.5.1'
  sha256 'b4995cb72046cc2d0ef47d81ec885ca8bc32e52fe80f5bd50f561cb00c06b212'

  url "http://www.madrau.com/data/switchresx/SwitchResX#{version.to_i}.zip"
  name 'SwitchResX'
  homepage 'http://www.madrau.com'
  license :unknown    # todo: change license and remove this comment; ':unknown' is a machine-generated placeholder

  prefpane 'SwitchResX.prefPane'

  uninstall :quit   => [
                        'fr.madrau.switchresx.app',
                        'fr.madrau.switchresx.daemon',  # note, daemon does not :quit cleanly
                       ],
            :signal => [
                        [ 'INT',  'fr.madrau.switchresx.daemon' ],
                        [ 'KILL', 'fr.madrau.switchresx.daemon' ],
                      ],
            :delete => [
                        '/Library/ScriptingAdditions/SwitchResX Extensions.osax',
                        '/Library/ScriptingAdditions/SwitchResX Menu.osax',
                       ]
end
