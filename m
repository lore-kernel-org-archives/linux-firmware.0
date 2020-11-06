Return-Path: <asitshah@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1F7C2D0A3
	for <linux-firmware@archiver.kernel.org>; Fri,  6 Nov 2020 05:10:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 49CFB2078B; Fri,  6 Nov 2020 05:10:28 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id F0673C433CB; Fri,  6 Nov 2020 05:10:27 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: asitshah)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 7A664C433C8;
	Fri,  6 Nov 2020 05:10:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 06 Nov 2020 10:40:27 +0530
From: asitshah@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, linux-arm-kernel@lists.infradead.org,
 mchehab@infradead.org, linux-media@vger.kernel.org,
 stanimir.varbanov@linaro.org, linux-media-owner@vger.kernel.org
Cc: vgarodia@codeaurora.org, dikshita@codeaurora.org
Subject: Update venus firmware files for v5.4
Message-ID: <c1bcb5eedc160e99d65576d431816a41@codeaurora.org>
X-Sender: asitshah@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9

Hi Team,

Please include updated Venus Firmware bins for v5.4.

Snapshot of pull request is as below, let me know if anything is 
missing.

>>>>>> 

The following changes since commit 
dae4b4cd084102cd49c37aa8b579b208028ab025:

   Merge branch 'v1.1.5' of 
https://github.com/irui-wang/linux_fw_vpu_v1.1.5 into main (2020-10-23 
08:10:37 -0400)

are available in the git repository at:

   https://github.com/shahasit/video-linux-firmware/tree/master

for you to fetch changes up to 8a46c32a26b3f22835543b158877aa0b0e01e8d6:

   qcom : updated venus firmware files for v5.4 (2020-11-06 10:33:37 
+0530)

----------------------------------------------------------------
Asit Shah (1):
       qcom : updated venus firmware files for v5.4

  qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
  qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
  qcom/venus-5.4/venus.b02 | Bin 873100 -> 873680 bytes
  qcom/venus-5.4/venus.b03 | Bin 33792 -> 33792 bytes
  qcom/venus-5.4/venus.mbn | Bin 919212 -> 919792 bytes
  qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
  6 files changed, 0 insertions(+), 0 deletions(-)

<<<<<<

Regards,
Asit
