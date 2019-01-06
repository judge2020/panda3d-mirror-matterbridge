#!/bin/bash

tee -a /matterbridge.toml << EOF
[irc]
  [irc.freenode]
  Server="chat.freenode.net:6697"
  UseTLS=true
  UseSASL=true
  SkipTLSVerify=false
  Nick="${FREENODE_NICK}"
  NickServNick="${FREENODE_NICK}"
  NickServPassword="${FREENODE_PASS}"
  RemoteNickFormat="[{PROTOCOL}] <{NICK}> "
  MessageQueue=30

[discord]
  [discord.channel]
  WebhookURL="${DISCORD_WEBHOOK_URL}"
  ShowJoinPart=true
  Token="${DISCORD_TOKEN}"
  Server="${DISCORD_SERVER_NAME}"
  RemoteNickFormat="[{PROTOCOL}] {NICK} "

[[gateway]]
name="gateway"
enable=true
  [[gateway.in]]
  account="irc.freenode"
  channel="#panda3d"
  [[gateway.out]]
  account="discord.channel"
  channel="${DISCORD_SERVER_CHANNEL_NAME}"

EOF
/bin/matterbridge
