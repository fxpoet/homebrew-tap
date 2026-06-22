cask "prompt-combo" do
  version "0.9.9"
  # arm64 mac dmg 의 sha256. mac 빌드(npm run build:mac) 후 릴리스에 dmg가 올라가면 아래 명령으로 계산해 교체:
  #   shasum -a 256 dist/PromptCombo-#{version}-arm64-mac.dmg
  # 또는 릴리스에서 받아서:  curl -L <dmg-url> | shasum -a 256
  sha256 "c24ffb155d5a14e7db7f7d8f1d5a1e5cbdd49c0461558e039e2336826d9e2193"

  url "https://github.com/fxpoet/prompt-combo-releases/releases/download/v#{version}/PromptCombo-#{version}-arm64-mac.dmg",
      verified: "github.com/fxpoet/prompt-combo-releases/"
  name "PromptCombo"
  desc "Desktop workbench for chaining AI coding prompts into workflows"
  homepage "https://prompt-combo.com/"

  # electron-updater 가 앱 스스로 업데이트하므로 Homebrew 는 버전 관리에서 손을 뗀다.
  # (이 줄이 없으면 brew 와 앱 자가 업데이트가 버전 기록을 두고 충돌한다)
  auto_updates true

  # mac 빌드가 arm64 전용이다(electron-builder.config.cjs 에서 x64 주석처리).
  depends_on arch: :arm64
  depends_on macos: ">= :big_sur"

  app "PromptCombo.app"

  # 앱의 "언인스톨용 데이터 삭제"(src/main/modules/preferences/wipe-for-uninstall.ts)가
  # macOS 에서 지우는 경로와 맞춤. userData/logs 는 productName(PromptCombo) 기준.
  zap trash: [
    "~/Library/Application Support/PromptCombo", # app.getPath('userData')
    "~/Library/Caches/PromptCombo",
    "~/Library/Caches/prompt-combo-updater",     # electron-updater 캐시(win 분기에서 삭제, mac 보강)
    "~/Library/HTTPStorages/kr.co.mark2.promptcombo",
    "~/Library/Logs/PromptCombo",                # app.getPath('logs')
    "~/Library/Preferences/kr.co.mark2.promptcombo.plist",
    "~/Library/Saved Application State/kr.co.mark2.promptcombo.savedState",
  ]
end
