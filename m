Return-Path: <bgodavar@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC02C2D0E8
	for <linux-firmware@archiver.kernel.org>; Fri,  3 Apr 2020 08:55:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 64B48206E9; Fri,  3 Apr 2020 08:55:07 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 2DBF5C433F2; Fri,  3 Apr 2020 08:55:07 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: bgodavar)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id D0C2FC433D2;
	Fri,  3 Apr 2020 08:55:06 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 03 Apr 2020 14:25:06 +0530
From: bgodavar@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: mka@chromium.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
 linux-arm-msm@vger.kernel.org, gubbaven@codeaurora.org
Subject: Update fw file to enable transparent WBS
Message-ID: <4ac4959d44823e7a23618b970f68293e@codeaurora.org>
X-Sender: bgodavar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9

The following changes since commit 
edf390c23a4e185ff36daded36575f669f5059f7:

   Merge branch 'v12573.77' of https://github.com/erinlo/linux_fw_scp 
(2020-03-20 07:39:19 -0400)

are available in the git repository at:

   https://github.com/bgodavar/qca_bt_fw

for you to fetch changes up to 1a8b0dc00f77ec8bbc8aece2d1fc19222326efe5:

   qca: Enable transparent WBS for WCN3991 (2020-04-03 14:15:42 +0530)

----------------------------------------------------------------
Balakrishna Godavarthi (1):
       qca: Enable transparent WBS for WCN3991

  qca/crnv32.bin | Bin 5388 -> 5388 bytes
  1 file changed, 0 insertions(+), 0 deletions(-)
