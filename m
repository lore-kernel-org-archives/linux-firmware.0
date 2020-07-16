Return-Path: <bgodavar@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A6B4C433E5
	for <linux-firmware@archiver.kernel.org>; Thu, 16 Jul 2020 16:25:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 698CA2074B; Thu, 16 Jul 2020 16:25:20 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 35F0BC43391; Thu, 16 Jul 2020 16:25:20 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: bgodavar)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id D70DEC433C6;
	Thu, 16 Jul 2020 16:25:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 16 Jul 2020 21:55:19 +0530
From: bgodavar@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, jwboyer@kernel.org
Cc: mka@chromium.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
 linux-arm-msm@vger.kernel.org, gubbaven@codeaurora.org,
 abhishekpandit@chromium.org
Subject: QCA: Add correct bin file for WCN3991
Message-ID: <6abd991d5d7d5175f5b7c6b168af770b@codeaurora.org>
X-Sender: bgodavar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9

The following changes since commit 
3d3a06f720856cb897a8541951edd0b8f6f54a98:

   linux-firmware: Update firmware file for Intel Bluetooth AX201 
(2020-07-13 07:51:54 -0400)

are available in the git repository at:

   https://github.com/bgodavar/qca_bt_fw/tree/qca_0714

for you to fetch changes up to 3882702815e4b88bfd2f20b7eb66a3e85cbbb9b9:

   QCA: Add correct bin file for WCN3991 (2020-07-14 11:00:13 +0530)

----------------------------------------------------------------
Balakrishna Godavarthi (1):
       QCA: Add correct bin file for WCN3991

  qca/crnv32.bin | Bin 5299 -> 5299 bytes
  1 file changed, 0 insertions(+), 0 deletions(-)
