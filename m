Return-Path: <kvalo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8424C77B6E
	for <linux-firmware@archiver.kernel.org>; Wed, 12 Apr 2023 09:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B0FF2C4339E; Wed, 12 Apr 2023 09:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 676E3C4339C;
	Wed, 12 Apr 2023 09:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681292217;
	bh=59wVY3/LuZKY9TMD37GIsizY4kqoEg6quzbNKB7N/To=;
	h=From:To:List-Id:Cc:Subject:References:Date:In-Reply-To:From;
	b=uv8HdqXLam4ULkTjp5ZhSnbMfwlERdPjID5oxeJATNWd1JWuXSeAYydT+ktCTml4H
	 LCXGPlUD/4uCFCahaS9GhVMXcQyvIAuC8f9ob2gSCeWmzcmlHAZIqWWRmjZAHzdFZR
	 /bT6pwppaX2o+i+j3ZPrCmdmgSW7cf7eiAmsGOqLY5RwXlvbHhiFIwUMl/WF2dlct5
	 pFXTBFW44EsSs/rtOKvBwpvH09uGirCNEkFyYKKR1V5UqlKhIkxF0/S50BaTw2O6IW
	 CQXtDWcCyTM+oHZJm4tR21xjE6Xss5pCvB33aW9DUhSIi0uGpgRRIuQoP7GRtkNWTu
	 zRyCU9Q7yQPiw==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,  linux-wireless@vger.kernel.org,  ath10k@lists.infradead.org,  ath11k@lists.infradead.org
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20230405
References: <87cz4ia35m.fsf@kernel.org>
	<8ceeee1e-8828-69a9-facb-20c3787207bd@linaro.org>
Date: Wed, 12 Apr 2023 12:36:51 +0300
In-Reply-To: <8ceeee1e-8828-69a9-facb-20c3787207bd@linaro.org> (Dmitry
	Baryshkov's message of "Fri, 7 Apr 2023 16:35:08 +0300")
Message-ID: <87jzyh8mrw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> Hi Kalle,
>
> On 05/04/2023 16:07, Kalle Valo wrote:
>> Hi,
>>
>> Here's a pull request for ath10k and ath11k. For ath10k we have lots of
>> board file updates in multiple hardware families. For ath11k we have new
>> firmware branches for QCN9074, IPQ6018 and IPQ8074. WCN6750 also got a
>> firmware update and WCN6855 has board file updates.
>>
>> Please let me know if there are any problems.
>>
>> Kalle
>
> Excuse me, a gentle reminder regarding WCN3990 board-2.bin. It was not
> included into this pull request.

Oh man, sorry about that. I guess my installation script was buggy and
missed it somehow, I'll look at it later and make sure WCN3990 is not
skipped anymore.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
