Return-Path: <bounce+a91e02.be9e4a-linux-firmware=kernel.org@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8185BC4338F
	for <linux-firmware@archiver.kernel.org>; Wed, 11 Aug 2021 07:09:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 60FCE60E78; Wed, 11 Aug 2021 07:09:54 +0000 (UTC)
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C983160FA0
	for <linux-firmware@kernel.org>; Wed, 11 Aug 2021 07:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C983160FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=mg.codeaurora.org
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628665794; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=1ntaw5D759eOuFXtOeoFgSLblVXZtGI3/6FXB3aSOSI=;
 b=QZ/DP2FP7TXyQUKhwvDLWqyKkcepWjgqkZt7ZjsElvnQcTa0kZAn6Wi/Sez7qmuQquMPBGwJ
 iXEQ+KikHqCxjUceO7UhqreTgxYjYHRHl8zx1a7t5c6diyQaHQuMMEd6j+yW1GvaYRxYGrhl
 2YT4Gp6NGSP6/Lul0jMMJnAm7O0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3Mjk1MCIsICJsaW51eC1maXJtd2FyZUBrZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 611377c0f746c298d90fa239 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 11 Aug 2021 07:09:52
 GMT
Sender: smagar=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 1B7C7C4338A; Wed, 11 Aug 2021 07:09:52 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: smagar)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id B6F99C433D3;
	Wed, 11 Aug 2021 07:09:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 11 Aug 2021 12:39:51 +0530
From: smagar@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, jwboyer@kernel.org
Cc: mka@chromium.org, linux-kernel@vger.kernel.org,
 linux-bluethoth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 hemantg@codeaurora.org, abhishekpandit@chromium.org,
 bgodavar@codeaurora.org, adhudase@codeaurora.org, sampnimm@codeaurora.org
Subject: Re: Request to update WCN6750 FW file
In-Reply-To: <9196f77c4b203dce3982e31d241392de@codeaurora.org>
References: <9196f77c4b203dce3982e31d241392de@codeaurora.org>
Message-ID: <2a70be94a1529153aed2a158e7b1e523@codeaurora.org>
X-Sender: smagar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9

On 2021-07-27 10:03, smagar@codeaurora.org wrote:
> Hello Team,
> 
> Please include new firmware bins for QCA BT SoC WCN6750.
> 
> Snapshot of pull request is as below, let me know if anything is 
> missing.
> 
> 
> 
> The following changes since commit 
> 168452ee695b5edb9deb641059bc110b9c5e8fc7:
> 
>   Merge tag 'iwlwifi-fw-2021-07-19' of
> git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware
> into main (2021-07-19 14:35:47 -0400)
> 
> are available in the git repository at:
> 
>   https://github.com/suraj714/linux-firmware-bluetooth master
> 
> for you to fetch changes up to 
> 5dd32d878e7561789422f3e1fe0f7c48fcc00e04:
> 
>   qca: Add firmware files for BT chip WCN6750. (2021-07-26 16:38:01 
> +0530)
> 
> ----------------------------------------------------------------
> smagar (1):
>       qca: Add firmware files for BT chip WCN6750.
> 
>  WHENCE           |   6 ++++++
>  qca/msbtfw11.mbn | Bin 0 -> 129348 bytes
>  qca/msbtfw11.tlv | Bin 0 -> 117136 bytes
>  qca/msnv11.bin   | Bin 0 -> 5633 bytes
>  4 files changed, 6 insertions(+)
>  create mode 100644 qca/msbtfw11.mbn
>  create mode 100644 qca/msbtfw11.tlv
>  create mode 100644 qca/msnv11.bin
> 
> 
> 
> Regards,
> Suraj Magar

Hi Team,

Any update on this?
