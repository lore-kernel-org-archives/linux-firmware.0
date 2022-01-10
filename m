Return-Path: <kvalo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74AFC433F5
	for <linux-firmware@archiver.kernel.org>; Mon, 10 Jan 2022 15:19:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A4771C36AF3; Mon, 10 Jan 2022 15:19:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D1D8C36AE3;
	Mon, 10 Jan 2022 15:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641827953;
	bh=pxPTJzmSBgH4bIUlhYAOmUy0JXvAVcZ0GJB2upPJ0DQ=;
	h=From:To:List-Id:Cc:Subject:References:Date:In-Reply-To:From;
	b=kfWirbvtrfOgywNReNZ4KfFBr6U70gAAPLC188GP/UR4T0LyujAtZsFjme4wrFM28
	 xWmLeXqj1chaoS1v75Tqam+1PfVBFCDKZt/gD5Frp4Pgpmhpkj5yOdCvyDHFgNvmyh
	 kNLZjR4pKFzqlsjugubNg29xypdQq6kKfRdmJJFb7WV5W3Bxzxpv0OjKk9BzHTeOxo
	 0rQ7VGYGSW+WK23eqc7MMQGdFmyoaGbhA4I8v6v1lwiQHxkHAH8CAWwsfqD4ORNLBR
	 mMPAW6vJTBjyl5ezxg90T6IMWsA/jOmBVEyicZnW4Ud5sh4pyd7b5ULr95uSVzWDnU
	 kGjbLCpIJqbqA==
From: Kalle Valo <kvalo@kernel.org>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware\@kernel.org" <linux-firmware@kernel.org>,  "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>,  "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: [PULL] ath11k firmware 20211223
References: <BYAPR02MB4567669033A210A78AC397E9927E9@BYAPR02MB4567.namprd02.prod.outlook.com>
	<CA+5PVA4WEuJDB3OCKfYK-BPaccpVWd9t_au9S7MCEtpy7cdF-A@mail.gmail.com>
Date: Mon, 10 Jan 2022 17:19:07 +0200
In-Reply-To: <CA+5PVA4WEuJDB3OCKfYK-BPaccpVWd9t_au9S7MCEtpy7cdF-A@mail.gmail.com>
	(Josh Boyer's message of "Wed, 29 Dec 2021 08:41:45 -0500")
Message-ID: <87leznvct0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Josh Boyer <jwboyer@kernel.org> writes:

> On Thu, Dec 23, 2021 at 9:03 AM Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>>
>> Hi linux-firmware maintainers,
>>
>> here's a pull request to update ath11k firmware images. We have new hard=
ware support WCN6855 and QCN9074, but also updates to existing hardware.
>>
>> Please let me know if there are any problems.
>>
>> Kalle
>>
>> The following changes since commit f682ecb015df087613f91872712eb6c0f6c99=
8a8:
>>
>>   Merge https://github.com/pkshih/linux-firmware into main (2021-12-16 0=
9:42:51 -0500)
>>
>> are available in the Git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git=
 ath10k-20211223
>>
>> for you to fetch changes up to 0f161f385f3854086b4fdae2dae786ab6bd3efa5:
>>
>>   ath11k: WCN6855 hw2.0: add to WLAN.HSP.1.1-03003-QCAHSPSWPL_V1_V2_SILI=
CONZ_LITE-2 (2021-12-23 12:40:55 +0200)
>>
>> ----------------------------------------------------------------
>> Kalle Valo (5):
>>       ath11k: IPQ6018 hw1.0: update to WLAN.HK.2.5.0.1-01100-QCAHKSWPL_S=
ILICONZ-1
>>       ath11k: IPQ8074 hw2.0: update to WLAN.HK.2.5.0.1-01100-QCAHKSWPL_S=
ILICONZ-1
>>       ath11k: QCN9074 hw1.0: add to WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILI=
CONZ-1
>>       ath11k: WCN6855 hw2.0: add board-2.bin and regdb.bin
>>       ath11k: WCN6855 hw2.0: add to WLAN.HSP.1.1-03003-QCAHSPSWPL_V1_V2_=
SILICONZ_LITE-2
>>
>>  WHENCE                           |   14 +-
>>  ath11k/IPQ6018/hw1.0/Notice.txt  |   48 +-
>
> These Notice files seem problematic.  They're clearly well intended,
> but they have language that alludes to an agreement with Atheros and a
> confidential nature to some of the files.  Specifically:
>
> "...your use of these software
> components together with the Qualcomm Atheros software (Qualcomm
> Atheros software hereinafter referred to as =E2=80=9CSoftware=E2=80=9D) is
> subject to the terms of your agreement from Qualcomm Atheros."
>
> Nobody has an opportunity to agree to anything with Atheros when they
> consume the files from linux-firmware.  There's also no explicit grant
> of redistribution for any of these files.
>
> Also:
>
> "/*
>  * Copyright (c) 2011 Qualcomm Technologies, Inc.
>  * 2011 Qualcomm Atheros, Inc.
>  * All Rights Reserved.
>  * Confidential and Proprietary - Qualcomm Technologies, Inc.
>  * Notifications and licenses are retained for attribution purposes only.
>  */
> "
>
> Several of those are followed by "For this file....  has selected the
> BSD license"  but it's unclear what file that's referring to.
>
> I'm not comfortable pulling this with the licenses in an ambiguous
> state.  Can you work with your team to clarify the text?

Sorry for the delay, I was on vacation.

Thanks for the feedback, I'll report this and later send a new pull
request with better language. But this can take some time.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes
