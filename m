Return-Path: <asitshah@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C0FEC433DF
	for <linux-firmware@archiver.kernel.org>; Sat, 17 Oct 2020 15:33:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2446F20760; Sat, 17 Oct 2020 15:33:44 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id E4F18C433C9; Sat, 17 Oct 2020 15:33:43 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: asitshah)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 400B1C433CB;
	Sat, 17 Oct 2020 15:33:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Sat, 17 Oct 2020 21:03:42 +0530
From: asitshah@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, jwboyer@kernel.org
Cc: mka@chromium.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 hemantg@codeaurora.org, gubbaven@codeaurora.org,
 abhishekpandit@chromium.org, bgodavar@codeaurora.org
Subject: Update WCN3991 FW file
Message-ID: <b74ea9cb201bb98691ecbfb3893d2a49@codeaurora.org>
X-Sender: asitshah@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9


Hi Team,

Please include updated firmware bin for WCN3991.

Snapshot of pull request is as below, let me know if anything is 
missing.

>>>>> 

The following changes since commit 
58d41d0facca2478d3e45f6321224361519aee96:

   ice: Add comms package file for Intel E800 series driver (2020-10-05 
08:09:03 -0400)

are available in the git repository at:

   https://github.com/shahasit/bt-linux-firmware/tree/master

for you to fetch changes up to 8877322c1254f327f47c86ec02c46013b68b9a47:

   QCA : Updated firmware file for WCN3991 (2020-10-17 20:53:36 +0530)

----------------------------------------------------------------
Asit Shah (1):
       QCA : Updated firmware file for WCN3991

  qca/crbtfw32.tlv | Bin 126300 -> 126832 bytes
  1 file changed, 0 insertions(+), 0 deletions(-)

<<<<<<

Regards,
Asit
