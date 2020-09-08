Return-Path: <jcrouse@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3CBC433E2
	for <linux-firmware@archiver.kernel.org>; Tue,  8 Sep 2020 17:11:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F1EA6216C4; Tue,  8 Sep 2020 17:11:18 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id B2310C433FE; Tue,  8 Sep 2020 17:11:18 +0000 (UTC)
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: jcrouse)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 01565C433C6;
	Tue,  8 Sep 2020 17:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 01565C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Tue, 8 Sep 2020 11:11:14 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: Adreno GPU microcode update
Message-ID: <20200908171114.GA12080@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: linux-firmware@kernel.org,
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)

The following changes since commit d5f9eea5a251d43412b07f5295d03e97b89ac4a5:

  wl18xx: update firmware file 8.9.0.0.83 (2020-09-01 08:07:59 -0400)

are available in the Git repository at:

  https://github.com/CosmicPenguin/linux-firmware.git for-master

for you to fetch changes up to f48fec44127f88ce83ea1bcaf5824de4146ca2f9:

  qcom: Add updated a5xx and a6xx microcode (2020-09-08 10:03:36 -0600)

----------------------------------------------------------------
Jordan Crouse (1):
      qcom: Add updated a5xx and a6xx microcode

 qcom/a530_pfp.fw | Bin 15876 -> 16144 bytes
 qcom/a630_sqe.fw | Bin 31316 -> 32056 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
