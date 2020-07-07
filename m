Return-Path: <rjliao@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 320D0C433DF
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Jul 2020 04:58:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2341A20738; Tue,  7 Jul 2020 04:58:08 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id E21BFC433C8; Tue,  7 Jul 2020 04:58:07 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: rjliao)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id AF5F6C433C6;
	Tue,  7 Jul 2020 04:58:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 07 Jul 2020 12:58:07 +0800
From: Rocky Liao <rjliao@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PULL] btqca firmware 20200401
Message-ID: <ff2e158ad88a7bf1ce5e42de86342f35@codeaurora.org>
X-Sender: rjliao@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if 
you have any problems.

The following changes since commit
74ac3b5a7e7962cd1135ef691c72d48cb5210251:

    Merge https://github.com/bgodavar/qca_wcn3991 into main (2020-07-02 
08:23:09 -0400)

are available in the Git repository at:

    https://github.com/rjliao-qca/qca-btfw.git

for you to fetch changes up to c4e04b49b46a3e3e4c0bf4a3007f352d09c7ae0c:
----------------------------------------------------------------
Rocky Liao (1):
         QCA: Update Bluetooth firmware for QCA6390 (2020-07-07 12:45:15 
+0800)
