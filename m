Return-Path: <rjliao@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F24C3F2D1
	for <linux-firmware@archiver.kernel.org>; Sat, 29 Feb 2020 03:01:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 27E41246AE; Sat, 29 Feb 2020 03:01:27 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id E5BACC433A2; Sat, 29 Feb 2020 03:01:26 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: rjliao)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id B2A24C43383;
	Sat, 29 Feb 2020 03:01:26 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Sat, 29 Feb 2020 11:01:26 +0800
From: Rocky Liao <rjliao@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PULL] btqca firmware 20200229
Message-ID: <87e4fd88a5a72fe40fe83d31a0762c95@codeaurora.org>
X-Sender: rjliao@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if 
you have any problems.

The following changes since commit
efcfa03ae6100dfe523ebf612e03c3a90fc4c794:

    linux-firmware: Update firmware file for Intel Bluetooth AX201 
(2020-02-24 16:54:19 +0530)

are available in the Git repository at:

    https://github.com/rjliao-qca/qca-btfw.git

for you to fetch changes up to 2db3978ce4a0c5b8ab04a81701b4eb010c721b2d:
----------------------------------------------------------------
Rocky Liao (1):
        qca: Fix blueooth firmware name for QCA6174 (2020-02-29 09:20:06 
+0800)

  WHENCE                        |   2 --
  qca/rampatch_00440302.bin     | Bin 64940 -> 66332 bytes
  qca/rampatch_00440302.tlv     | Bin 66332 -> 0 bytes
  qca/rampatch_usb_00000302.bin | Bin 64168 -> 66964 bytes
  qca/rampatch_usb_00000302.tlv | Bin 66964 -> 0 bytes
  5 files changed, 2 deletions(-)
  delete mode 100644 qca/rampatch_00440302.tlv
  delete mode 100644 qca/rampatch_usb_00000302.tlv




