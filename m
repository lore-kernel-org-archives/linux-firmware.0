Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913BACF9C73
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 56AC7C4AF0E; Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29600C4CECD;
	Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727096983;
	bh=dSzJv8s6B0lDFTSCiE9b4w+ai93VoUD5YEsgxw03ZLg=;
	h=From:Subject:Date:List-Id:To:Cc:Reply-To:From;
	b=fOaGwbi8q/1ND+II9K4v4PioybtnCKgL3XkTo6Vafeyu3eOrjEip+eU3xywvsoXq9
	 C/RC/NwqlF5fbrsAamQHU10UJlLXC7sZEemH+zkL94FmjdtWpR/2HKzsefkWAzyTQ4
	 ZMWNL9K+MNsLrNJPilQkPRZ3Ij8BkpYe1zL6bbruvUtae5ecMqYuvv8/Ob0NtoCMBF
	 oXmmd6ChTkpqxyCXZbeoWNAaD/4DQFn3kbAJ5MiBwjSI/bcXguQBgMHGi2zzfRYRY9
	 u8aL2W10orcOtFgjUGfXuR5k1+2dJ42BAB9vXVl8LDT+KWhWcZIgbdhZE82IqowXrC
	 vyxdYiB0AMMug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E65B2CF9C72;
	Mon, 23 Sep 2024 13:09:42 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Subject: [PATCH v2 00/16] Range of copy-firmware/check_whence fixes
Date: Mon, 23 Sep 2024 14:09:28 +0100
Message-Id: <20240923-misc-fixes-v2-0-397f23443628@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIho8WYC/22MTQ6CMBBGr0Jm7Zi2oFBX3sOwaMYRJrGUtKbRk
 N7dytrl+37eBomjcIJLs0HkLEnCUsEcGqDZLROj3CuDUaZT1hj0kggf8uaEg9OtI+q1sy3Uwxp
 5L+r+NlaeJb1C/OzurH/pX03WqHCgM5+MtT3Z7jp5J88jBQ9jKeUL+ld82aQAAAA=
X-Change-ID: 20240922-misc-fixes-8a13acc71a93
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>, 
 Juerg Haefliger <juerg.haefliger@canonical.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727096979; l=2708;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=dSzJv8s6B0lDFTSCiE9b4w+ai93VoUD5YEsgxw03ZLg=;
 b=c3nTbosZXc9KCUSDWMqg4/Fqws7MtQpqu2jI9++WKvjfIPXia4eSffnTCvywuO1ZCW5BaHSqw
 Aw+S5qOTdxHDC3CIYvOmz9JJnt+ByJlGgGcvE2yJDuHY9yg9jxDBXMy
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received: by B4 Relay for emil.l.velikov@gmail.com/20230301 with
 auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: emil.l.velikov@gmail.com

Hello all,

With the latest python 3.12 check_whence.py started throwing some
warnings. The more I looked around, the more loose ends and bugs reared
their (ugly) heads.

In this series:
 - check_whence.py: sort the filenames, use consistent variable names
 - check_whence.py: fix links-to-links and band them
 - editorconfig: add the config and fix the yaml+sh indentation
 - copy-firmware.sh: factor out dedup fix broken ad-hoc symlink handling
 - copy-firmware.sh: remove the hacky argument injection
 - copy-firmware.sh: warn if the destination folder is NOT empty
 - copy-firmware.sh: call ./check_whence.py and remove the dead code

The series is a mix of cosmetics (style, names), existing bug fixes and
trying loose ends. I'm happy to split it in sub-series, as per your
suggestions.

As always, input is highly appreciated. Thanks o/

To: linux-firmware@kernel.org

Changes in v2:
- Commit message tweaks
- Correct a few flipped test checks
- Rename deduplicate-firmware.sh to dedup-firmware.sh
- Change line width (editorconfig) to 90
- Properly handle destdir
- Link to v1: https://lore.kernel.org/r/20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com

---
Emil Velikov (16):
      check_whence.py: use consistent naming
      check_whence.py: ban link-to-a-link
      check_whence.py: LC_ALL=C sort -u the filelist
      check_whence.py: annotate replacement strings as raw
      editorconfig: add initial config file
      Style update yaml files
      copy-firmware.sh: flesh out and fix dedup-firmware.sh
      Revert "copy-firmware: Support additional compressor options"
      copy-firmware.sh: reset and consistently handle destdir
      copy-firmware.sh: fix indentation
      copy-firmware.sh: add err() helper
      copy-firmware.sh: warn if the destination folder is not empty
      copy-firmware.sh: call ./check_whence.py before parsing the file
      copy-firmware.sh: remove no longer reachable test -f
      copy-firmware.sh: remove no longer reachable test -L
      copy-firmware.sh: rename variables in symlink hanlding

 .editorconfig           |  21 +++++++++
 .gitlab-ci.yml          |   2 +-
 .pre-commit-config.yaml |  38 ++++++++--------
 Makefile                |   9 ++--
 WHENCE                  |  14 +++---
 check_whence.py         |  42 +++++++++++-------
 copy-firmware.sh        | 113 +++++++++++++-----------------------------------
 dedup-firmware.sh       |  52 ++++++++++++++++++++++
 8 files changed, 162 insertions(+), 129 deletions(-)
---
base-commit: 6c88d9b8253b8ec6df701a551a56438ea2e5bacf
change-id: 20240922-misc-fixes-8a13acc71a93

Best regards,
-- 
Emil Velikov <emil.l.velikov@gmail.com>


