Return-Path: <bounce+a91e02.be9e4a-linux-firmware=kernel.org@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B73EC433ED
	for <linux-firmware@archiver.kernel.org>; Wed, 28 Apr 2021 12:32:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3AAA5613AD; Wed, 28 Apr 2021 12:32:59 +0000 (UTC)
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7100C601FE
	for <linux-firmware@kernel.org>; Wed, 28 Apr 2021 12:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7100C601FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+a91e02.be9e4a-linux-firmware=kernel.org@mg.codeaurora.org
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619613178; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=8ApIFdhEvHB7ONJYT4AKP5vpkpB0yYv72B6HGLUQjZ4=; b=oAGRXPTl1tQQkPGDIi/LyUcjlXMvE6sjXNQo3WJ8kXyI5OnjwvZ/NR2ue7bCA3jq0Ta0mG3M
 Pk2qGqpAaEjJYEDRMpJ00c3haCofv6mhcr5Liht+3ED+8qK3eJVrcQDfioziNdwQcx8C2aVz
 EfM9A3l2KSRWBEHaK7Z5KlrswnU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3Mjk1MCIsICJsaW51eC1maXJtd2FyZUBrZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 608955ee74f773a664c4e2cd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 28 Apr 2021 12:32:46
 GMT
Sender: smagar=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 571A9C433D3; Wed, 28 Apr 2021 12:32:45 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: smagar)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 6DB7BC433F1;
	Wed, 28 Apr 2021 12:32:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 28 Apr 2021 18:02:44 +0530
From: smagar@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, mchehab@infradead.org,
 stanimir.varbanov@linaro.org, linux-media-owner@vger.kernel.org
Cc: vgarodia@codeaurora.org, dikshita@codeaurora.org,
 adhudase@codeaurora.org, sampnimm@codeaurora.org, mansur@codeaurora.org
Subject: Update venus firmware files for v5.4 and venus firmware files for
 VPU-2.0
Message-ID: <bee73b3fe8b04c1a2663be0cd3cc7318@codeaurora.org>
X-Sender: smagar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9

Hello Team,

Please include updated firmware bins for venus-5.4 and vpu-2.0.

I have fixed comment and title updated.

Removed 0 byte unwanted bins.

Below is combined pull request for venus-5.4 and VPU-2.0.

Please find snapshot of pull request, let me know if anything is 
missing.


The following changes since commit 
85286184d9df1b03bb76049edcfd87c39ce46e94:

   Merge branch 'for-upstream' of 
git://git.chelsio.net/pub/git/linux-firmware into main (2021-04-19 
11:34:11 -0400)

are available in the git repository at:

   https://github.com/suraj714/linux-firmware-venus.git master

for you to fetch changes up to 6cdef281cd16d967ad89c01af6fdda85529a2d80:

   qcom: Add venus firmware files for VPU-2.0 (2021-04-28 14:42:48 +0530)

----------------------------------------------------------------
smagar (2):
       qcom: update venus firmware files for v5.4
       qcom: Add venus firmware files for VPU-2.0

  WHENCE                    |  34 +++++++++++++++++++++++++++++++++-
  qcom/venus-5.4/venus.b00  | Bin 212 -> 212 bytes
  qcom/venus-5.4/venus.b01  | Bin 6808 -> 6808 bytes
  qcom/venus-5.4/venus.b02  | Bin 873680 -> 873596 bytes
  qcom/venus-5.4/venus.b03  | Bin 33792 -> 33792 bytes
  qcom/venus-5.4/venus.mbn  | Bin 919792 -> 919708 bytes
  qcom/venus-5.4/venus.mdt  | Bin 7020 -> 7020 bytes
  qcom/vpu-2.0/vpu20_1v.b00 | Bin 0 -> 692 bytes
  qcom/vpu-2.0/vpu20_1v.b01 | Bin 0 -> 7376 bytes
  qcom/vpu-2.0/vpu20_1v.b02 | Bin 0 -> 300 bytes
  qcom/vpu-2.0/vpu20_1v.b03 | Bin 0 -> 20 bytes
  qcom/vpu-2.0/vpu20_1v.b04 | Bin 0 -> 20 bytes
  qcom/vpu-2.0/vpu20_1v.b05 | Bin 0 -> 20 bytes
  qcom/vpu-2.0/vpu20_1v.b06 | Bin 0 -> 20 bytes
  qcom/vpu-2.0/vpu20_1v.b07 | Bin 0 -> 24 bytes
  qcom/vpu-2.0/vpu20_1v.b08 | Bin 0 -> 16 bytes
  qcom/vpu-2.0/vpu20_1v.b09 | Bin 0 -> 939184 bytes
  qcom/vpu-2.0/vpu20_1v.b10 | Bin 0 -> 42976 bytes
  qcom/vpu-2.0/vpu20_1v.b19 |   1 +
  qcom/vpu-2.0/vpu20_1v.mbn | Bin 0 -> 2031188 bytes
  qcom/vpu-2.0/vpu20_1v.mdt | Bin 0 -> 8068 bytes
  21 files changed, 34 insertions(+), 1 deletion(-)
  create mode 100644 qcom/vpu-2.0/vpu20_1v.b00
  create mode 100644 qcom/vpu-2.0/vpu20_1v.b01
  create mode 100644 qcom/vpu-2.0/vpu20_1v.b02
  create mode 100644 qcom/vpu-2.0/vpu20_1v.b03
  create mode 100644 qcom/vpu-2.0/vpu20_1v.b04
  create mode 100644 qcom/vpu-2.0/vpu20_1v.b05
  create mode 100644 qcom/vpu-2.0/vpu20_1v.b06
  create mode 100644 qcom/vpu-2.0/vpu20_1v.b07
  create mode 100644 qcom/vpu-2.0/vpu20_1v.b08
  create mode 100644 qcom/vpu-2.0/vpu20_1v.b09
  create mode 100644 qcom/vpu-2.0/vpu20_1v.b10
  create mode 100644 qcom/vpu-2.0/vpu20_1v.b19
  create mode 100644 qcom/vpu-2.0/vpu20_1v.mbn
  create mode 100644 qcom/vpu-2.0/vpu20_1v.mdt


Regards,
Suraj Magar
