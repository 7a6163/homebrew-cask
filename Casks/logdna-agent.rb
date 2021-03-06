cask 'logdna-agent' do
  version '1.4.1'
  sha256 '07bdde9b4908ab957ad31a9f7b7966d77c97aa849908c2941dc7abaed0df76cf'

  # github.com/logdna/logdna-agent was verified as official when first introduced to the cask
  url "https://github.com/logdna/logdna-agent/releases/download/#{version}/logdna-agent-#{version}.pkg"
  appcast 'https://github.com/logdna/logdna-agent/releases.atom',
          checkpoint: 'cee7186ede988c251a7212238182afa99a5a31814b581c7c6567caa1d0bd49c9'
  name 'LogDNA Agent'
  homepage 'https://logdna.com/'

  pkg "logdna-agent-#{version}.pkg"

  uninstall pkgutil:   'com.logdna.logdna-agent',
            launchctl: 'com.logdna.logdna-agentd'

  caveats <<-EOS.undent
    When you first start logdna-agent, you must set your LogDNA API key with the command:
      sudo logdna-agent -k <api-key>

    To always run logdna-agent in the background, use the command:
      sudo launchctl load -w /Library/LaunchDaemons/com.logdna.logdna-agent.plist
  EOS
end
