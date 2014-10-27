if ! pgrep -q Karabiner > /dev/null; then
  echo "\e[32mObtain accessibility for Karabiner AXNotifier\e[0m"
  sql="
    INSERT OR REPLACE INTO access
    VALUES('kTCCServiceAccessibility','org.pqrs.Karabiner-AXNotifier',0,1,0,NULL);
  "
  sudo sqlite3 /Library/Application\ Support/com.apple.TCC/TCC.db "${sql}"
  open -a Karabiner.app
fi
