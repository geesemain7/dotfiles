rule = {
  matches = {
    {
      { "node.name", "matches", "alsa_output.usb-Schiit_Audio_Modi_-00.pro-output-0" },
    },
  },
  apply_properties = {
      ["node.description"]       = "Schiit Modi+ Pro",
      ["audio.format"]           = "S24LE",
      ["audio.rate"]             = 192000,
      ["audio.channels"]         = 2
  },
}
table.insert(alsa_monitor.rules,rule)
