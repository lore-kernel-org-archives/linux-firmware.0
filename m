Return-Path: <asitshah@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED741C5519F
	for <linux-firmware@archiver.kernel.org>; Wed, 25 Nov 2020 08:41:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AD164208CA; Wed, 25 Nov 2020 08:41:36 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 5BACCC43460; Wed, 25 Nov 2020 08:41:36 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: asitshah)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id DC1EDC43460;
	Wed, 25 Nov 2020 08:41:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 25 Nov 2020 14:11:35 +0530
From: asitshah@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, linux-arm-kernel@lists.infradead.org,
 mchehab@infradead.org, linux-media@vger.kernel.org,
 stanimir.varbanov@linaro.org, linux-media-owner@vger.kernel.org
Cc: vgarodia@codeaurora.org, dikshita@codeaurora.org,
 sampnimm@codeaurora.org
Subject: Update venus firmware files for v5.4 and v5.2
Message-ID: <78c092f9b8d8b3833d7ac4f36253f7d3@codeaurora.org>
X-Sender: asitshah@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9

Hi Team,

Please include updated Venus Firmware bins for v5.4 and v5.2 .

Snapshot of pull request is as below, let me know if anything is 
missing.

>>>>>> 

The following changes since commit 
b362fd4cb8963ad75517dbcf424974f65a29a60e:

   Mellanox: Add new mlxsw_spectrum firmware xx.2008.2018 (2020-11-24 
09:55:03 -0500)

are available in the git repository at:

   https://github.com/shahasit/linux-firmware-video/tree/master

for you to fetch changes up to e6459dce893a5b8dbf684762d5396acc11149186:

   qcom : updated venus firmware files for v5.2 (2020-11-25 14:02:10 
+0530)

----------------------------------------------------------------
Asit Shah (2):
       qcom : updated venus firmware files for v5.4
       qcom : updated venus firmware files for v5.2

  qcom/venus-5.2/venus.b00 | Bin 212 -> 212 bytes
  qcom/venus-5.2/venus.b01 | Bin 6600 -> 6808 bytes
  qcom/venus-5.2/venus.b02 | Bin 837304 -> 856432 bytes
  qcom/venus-5.2/venus.b03 | Bin 33640 -> 33648 bytes
  qcom/venus-5.2/venus.mbn | Bin 883264 -> 902400 bytes
  qcom/venus-5.2/venus.mdt | Bin 6812 -> 7020 bytes
  qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
  qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
  qcom/venus-5.4/venus.b02 | Bin 873680 -> 873704 bytes
  qcom/venus-5.4/venus.b03 | Bin 33792 -> 33792 bytes
  qcom/venus-5.4/venus.mbn | Bin 919792 -> 919816 bytes
  qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
  12 files changed, 0 insertions(+), 0 deletions(-)

<<<<<<

Regards,
Asit
