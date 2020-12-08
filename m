Return-Path: <sampnimm@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34413C4361B
	for <linux-firmware@archiver.kernel.org>; Tue,  8 Dec 2020 12:25:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E3AD823A5B; Tue,  8 Dec 2020 12:25:42 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id A438AC43461; Tue,  8 Dec 2020 12:25:42 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: sampnimm)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 33964C433CA;
	Tue,  8 Dec 2020 12:25:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 08 Dec 2020 17:55:42 +0530
From: sampnimm@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, jwboyer@kernel.org
Cc: mka@chromium.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 hemantg@codeaurora.org, gubbaven@codeaurora.org,
 abhishekpandit@chromium.org, bgodavar@codeaurora.org
Subject: Request to Update WCN3991 FW files
Message-ID: <d83f762bf0b5e27f624a57c17c9dc3db@codeaurora.org>
X-Sender: sampnimm@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9

Hello Team,

       Please include updated firmware bins for WCN3991.
       Snapshot of pull request is as below, let me know if anything is 
missing.

>>>>> 	

The following changes since commit 
7455a36066741a6e52fba65e04f6451b4cdfd9c4:

   Merge branch 'guc_v49' of 
git://anongit.freedesktop.org/drm/drm-firmware into main (2020-11-30 
09:26:11 -0500)

are available in the git repository at:

   https://github.com/sampnimm/linux-firmware-BT.git master

for you to fetch changes up to 1a08ec9262e943c1e50b1223e3feb5845936b5a6:

   QCA : Updated firmware files for WCN3991 (2020-12-08 17:38:49 +0530)

----------------------------------------------------------------
sampnimm (1):
       QCA : Updated firmware files for WCN3991

  qca/crbtfw32.tlv | Bin 126892 -> 126772 bytes
  qca/crnv32.bin   | Bin 5407 -> 5407 bytes
  qca/crnv32u.bin  | Bin 5407 -> 5407 bytes
  3 files changed, 0 insertions(+), 0 deletions(-)

<<<<<


Thanks,
Sampath
