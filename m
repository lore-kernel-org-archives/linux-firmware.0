Return-Path: <kvalo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9571D0E6D3
	for <linux-firmware@archiver.kernel.org>; Mon, 21 Oct 2024 08:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 970DBC4CEE5; Mon, 21 Oct 2024 08:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57906C4CEC3;
	Mon, 21 Oct 2024 08:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729501083;
	bh=mf2/OOYJ8LwJZUCqardXjuJg508jYSPac/BVpOaGjUk=;
	h=From:To:List-Id:Cc:Subject:References:Date:In-Reply-To:From;
	b=mXx5okYeMcmRy5c+sdO7dq6Bt0uUlQwuC5jxZMJbr4NhsMt8vuLqBBznd1zSO539g
	 C9zRbAKCGVKNcE30BkvOMKe2kmHTIWo2YnexuXybYH8MDXadjl2IT84yVPBDUF7+ML
	 mvdyGw3TyspG/W/BNN9IwyBiXuSVPCPlUvr1aJSN6xrURW+neJSESTvWh/wP/s4EUt
	 Wzew2aN8UsbZVGEZcwtF0thyL2tm5VLs7pbT/Uiz1r/VtNT9eENbUg1c3ofB/ilMtj
	 pVuDCRg65vbaff32ELs2lcw1a1x+FVFRLTUBy1V82gt3EO6BWMfcneTglCtKXSBG2G
	 x7DO0fU+Z8oxA==
From: Kalle Valo <kvalo@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  linux-firmware@kernel.org,
  ath12k@lists.infradead.org,  Jeff Johnson <jjohnson@kernel.org>
Subject: Re: [PULL linux-firmware] ath12k firmware 20241009
References: <015383e1-f37e-4a1d-b2de-f3261f5ea1f4@quicinc.com>
	<d496a87e-73a1-45e7-8ebb-b907d58dd4f2@amd.com>
Date: Mon, 21 Oct 2024 11:58:00 +0300
In-Reply-To: <d496a87e-73a1-45e7-8ebb-b907d58dd4f2@amd.com> (Mario
	Limonciello's message of "Thu, 10 Oct 2024 14:52:49 -0500")
Message-ID: <87bjzdq1d3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain

Mario Limonciello <mario.limonciello@amd.com> writes:

> On 10/10/2024 13:49, Jeff Johnson wrote:
>> Hi,
>> Here's a pull request for ath12k. We have a new ath12k hardware
>> QCN9274 hw2.0 and an updated board file for WCN7850 hw2.0 which
>> addresses the issue described at:
>> https://lore.kernel.org/all/44ae68d2-24b6-49d2-a4f9-ae9cbf6f9950@heusel.eu/
>> The following changes since commit
>> 919f79f9fb5536c1928a15ac82a2e53183b213cf:
>>    Merge branch 'amd-staging' into 'main' (2024-10-04 21:12:04
>> +0000)
>> are available in the Git repository at:
>>    git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git
>> ath-20241009
>> for you to fetch changes up to
>> 42d754dc98e77e43bcb86def5ea60e009cc49be2:
>>    ath12k: WCN7850 hw2.0: update board-2.bin (2024-10-09 14:24:59
>> -0700)
>> 
>
> Hi,
>
> This is pulled after a rebase to main.  FYI we had a revert in place
> upstream for that board-2.bin because of the regressions.
>
> You can double check the result looks good.

Could you cc the ath12k list if you make changes to ath12k files,
please? That way we would have avoided the conflict in the first place.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
