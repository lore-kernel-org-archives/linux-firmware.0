Return-Path: <bgodavar@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4BDC433DF
	for <linux-firmware@archiver.kernel.org>; Mon, 22 Jun 2020 09:05:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DD2DC206E2; Mon, 22 Jun 2020 09:05:57 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id A9353C433C8; Mon, 22 Jun 2020 09:05:57 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: bgodavar)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 569D3C433C6;
	Mon, 22 Jun 2020 09:05:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 22 Jun 2020 14:35:57 +0530
From: bgodavar@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: mka@chromium.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
 linux-arm-msm@vger.kernel.org, gubbaven@codeaurora.org,
 abhishekpandit@chromium.org
Subject: Update WCN3991 FW with new enhancements
Message-ID: <251806a04b162259103050eb11c48bf1@codeaurora.org>
X-Sender: bgodavar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9

The following changes since commit 
887d2a103c2bdd267dbca5bed39b1b493d6cbe13:

   linux-firmware: Update firmware file for Intel Bluetooth AX200 
(2020-06-10 08:32:52 -0400)

are available in the git repository at:

   https://github.com/bgodavar/qca_wcn3991

for you to fetch changes up to 24cc617d85a466ba58a94e3040690d0a43c83226:

   QCA: Update WCN3991 FW files (2020-06-22 14:20:47 +0530)

----------------------------------------------------------------
Balakrishna Godavarthi (1):
       QCA: Update WCN3991 FW files

  qca/crbtfw32.tlv | Bin 95784 -> 125896 bytes
  qca/crnv32.bin   | Bin 5388 -> 5299 bytes
  2 files changed, 0 insertions(+), 0 deletions(-)

Regards
Balakrishna
