Return-Path: <rjliao@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F6CC2D0A3
	for <linux-firmware@archiver.kernel.org>; Thu, 12 Nov 2020 05:15:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F3FE72078D; Thu, 12 Nov 2020 05:15:55 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id A31F2C433C9; Thu, 12 Nov 2020 05:15:55 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: rjliao)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 6F978C433C8
	for <linux-firmware@kernel.org>; Thu, 12 Nov 2020 05:15:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 12 Nov 2020 13:15:55 +0800
From: Rocky Liao <rjliao@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: [PULL] btqca firmware 20201112
Message-ID: <434716095a78523311708196d57be797@codeaurora.org>
X-Sender: rjliao@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if 
you have any problems.

The following changes since commit
dae4b4cd084102cd49c37aa8b579b208028ab025:

    Merge branch 'v1.1.5' of 
https://github.com/irui-wang/linux_fw_vpu_v1.1.5 into main (2020-10-23 
08:10:37 -0400)

are available in the Git repository at:

    https://github.com/rjliao-qca/qca-btfw.git

for you to fetch changes up to 463fdea3d3f33bbbc62a97cbe1ca72329dd42b95:
----------------------------------------------------------------
Rocky Liao (1):
         QCA: Update Bluetooth firmware for QCA6390 (2020-11-13 13:05:56 
+0800)
