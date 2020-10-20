Return-Path: <asitshah@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A20D1C433DF
	for <linux-firmware@archiver.kernel.org>; Tue, 20 Oct 2020 05:47:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 61B7322282; Tue, 20 Oct 2020 05:47:57 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 1DCB5C433C9; Tue, 20 Oct 2020 05:47:57 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: asitshah)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 4667DC433C9;
	Tue, 20 Oct 2020 05:47:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 20 Oct 2020 11:17:55 +0530
From: asitshah@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, linux-arm-kernel@lists.infradead.org,
 mchehab@infradead.org, linux-media@vger.kernel.org,
 stanimir.varbanov@linaro.org, linux-media-owner@vger.kernel.org
Cc: vgarodia@codeaurora.org, dikshita@codeaurora.org
Subject: Re: Update venus firmware files for v5.4
In-Reply-To: <290a085b0fb686ce6aacbd02be560e52@codeaurora.org>
References: <290a085b0fb686ce6aacbd02be560e52@codeaurora.org>
Message-ID: <dfbf51326d00ae72ed2b6149e7ccf570@codeaurora.org>
X-Sender: asitshah@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9

Hi Team,

Gentle Reminder. Please let me know if anything is missing.

Regards,
Asit


On 2020-10-08 15:20, asitshah@codeaurora.org wrote:
> Hi Team,
> 
> Please include updated Venus Firmware bins for v5.4.
> 
> Snapshot of pull request is as below, let me know if anything is 
> missing.
> 
>>>>>>> 
> 
> The following changes since commit 
> 00a84c516078defb76fbd57543b8d5c674a9a2be:
> 
>   linux-firmware: Update AMD SEV firmware (2020-09-16 08:01:44 -0400)
> 
> are available in the git repository at:
> 
>   https://github.com/shahasit/video-linux-firmware/tree/master
> 
> for you to fetch changes up to 
> a09b728b77f5e3b335ff85c6c729248e0121f02c:
> 
>   qcom : updated venus firmware files for v5.4 (2020-10-08 15:07:59 
> +0530)
> 
> ----------------------------------------------------------------
> Asit Shah (1):
>       qcom : updated venus firmware files for v5.4
> 
>  qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
>  qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
>  qcom/venus-5.4/venus.b02 | Bin 870812 -> 873100 bytes
>  qcom/venus-5.4/venus.b03 | Bin 33792 -> 33792 bytes
>  qcom/venus-5.4/venus.mbn | Bin 916924 -> 919212 bytes
>  qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
>  6 files changed, 0 insertions(+), 0 deletions(-)
> 
> Regards,
> Asit
