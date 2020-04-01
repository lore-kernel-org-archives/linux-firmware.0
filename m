Return-Path: <rjliao@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251A2C43331
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Apr 2020 12:38:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1128A20776; Wed,  1 Apr 2020 12:38:39 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id C4945C43636; Wed,  1 Apr 2020 12:38:38 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: rjliao)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 96CAFC433BA;
	Wed,  1 Apr 2020 12:38:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 01 Apr 2020 20:38:38 +0800
From: Rocky Liao <rjliao@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PULL] btqca firmware 20200401
Message-ID: <1fce439e32d6b77970e01a797cdb70ca@codeaurora.org>
X-Sender: rjliao@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if 
you have any problems.

The following changes since commit
edf390c23a4e185ff36daded36575f669f5059f7:

    Merge branch 'v12573.77' of https://github.com/erinlo/linux_fw_scp 
(2020-03-20 07:39:19 -0400)

are available in the Git repository at:

    https://github.com/rjliao-qca/qca-btfw.git

for you to fetch changes up to 4921f73bc8fdd81cf54200f67bf44a071df50e78:
----------------------------------------------------------------
Rocky Liao (1):
        QCA: Add Bluetooth firmware for QCA6390 (2020-04-01 18:12:51 
+0800)
