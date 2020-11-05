Return-Path: <asitshah@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA4AC00A89
	for <linux-firmware@archiver.kernel.org>; Thu,  5 Nov 2020 07:06:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 35C382087D; Thu,  5 Nov 2020 07:06:03 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id D4015C433C8; Thu,  5 Nov 2020 07:06:02 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: asitshah)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 645CAC433C6;
	Thu,  5 Nov 2020 07:06:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 05 Nov 2020 12:36:02 +0530
From: asitshah@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, jwboyer@kernel.org
Cc: mka@chromium.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 hemantg@codeaurora.org, gubbaven@codeaurora.org,
 abhishekpandit@chromium.org, bgodavar@codeaurora.org
Subject: Request to Update WCN3991 FW file
Message-ID: <71acb08c5c7e7b10f4112b350707ee82@codeaurora.org>
X-Sender: asitshah@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9

Hello Team,

Please include updated firmware bins for WCN3991. Change includes 
updated TLV file to fix BT SSR.

Snapshot of pull request is as below, let me know if anything is 
missing.

>>>>> 

The following changes since commit 
dae4b4cd084102cd49c37aa8b579b208028ab025:

   Merge branch 'v1.1.5' of 
https://github.com/irui-wang/linux_fw_vpu_v1.1.5 into main (2020-10-23 
08:10:37 -0400)

are available in the git repository at:

   https://github.com/shahasit/bt-linux-firmware.git master

for you to fetch changes up to d7793e53b156126f6ea09c8d6e17cc9a8fe0ca77:

   QCA : Fixed BT SSR due to command timeout / IO fatal error (2020-11-05 
12:26:32 +0530)

----------------------------------------------------------------
Asit Shah (1):
       QCA : Fixed BT SSR due to command timeout / IO fatal error

  qca/crbtfw32.tlv | Bin 126832 -> 126892 bytes
  1 file changed, 0 insertions(+), 0 deletions(-)

<<<<<

Regards,
Asit
