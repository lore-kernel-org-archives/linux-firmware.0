Return-Path: <kvalo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2C8C433EF
	for <linux-firmware@archiver.kernel.org>; Thu, 10 Feb 2022 10:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 698E0C340EE; Thu, 10 Feb 2022 10:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CB6C004E1;
	Thu, 10 Feb 2022 10:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644489938;
	bh=32OaQk+UQ/kYTL9+dr4DZaoEDesEdMynTCoF8QwK6Gg=;
	h=From:To:List-Id:Cc:Subject:References:Date:In-Reply-To:From;
	b=obTGnW2sLiEcWnt5c70h0ewCHsXuXXd1D24gLvdZjhxbSSTsdoY7tsPIVgJEI9OON
	 Yi2cKM7/VFZGYk4kb5WuM3Bc/W1kYoSRY4mJLndhaQSSdNpqMWXvFIddkyymTXwGc4
	 E8yfNpW51Rdw2ARkCHYq4vARI5fF5IC7Z3zuHczXTiJYrfE4wDaiBJIxXlGjHZP1hv
	 Y39hGf3xlXJ1zgMuR9cYNfKbT9Y781u13ouLIM1aI+w0xIMsSuHb7kAH3bHiAWdi9d
	 gDd8wgOG+77qUdqyZYm7mU+uCHzcMepXqDYB0o/U84pcNzi+vi1NwC1ck2mem1pCiH
	 5qpZ2bjHCmb1A==
From: Kalle Valo <kvalo@kernel.org>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware\@kernel.org" <linux-firmware@kernel.org>,  "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>,  "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: [PULL] ath11k firmware 20211223
References: <BYAPR02MB4567669033A210A78AC397E9927E9@BYAPR02MB4567.namprd02.prod.outlook.com>
	<CA+5PVA4WEuJDB3OCKfYK-BPaccpVWd9t_au9S7MCEtpy7cdF-A@mail.gmail.com>
Date: Thu, 10 Feb 2022 12:45:32 +0200
In-Reply-To: <CA+5PVA4WEuJDB3OCKfYK-BPaccpVWd9t_au9S7MCEtpy7cdF-A@mail.gmail.com>
	(Josh Boyer's message of "Wed, 29 Dec 2021 08:41:45 -0500")
Message-ID: <87ee4brodv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Josh,

Josh Boyer <jwboyer@kernel.org> writes:

> On Thu, Dec 23, 2021 at 9:03 AM Kalle Valo <kvalo@qca.qualcomm.com> wrote:
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

So this file we are discussing is the notice.txt file. In the WHENCE
file the actual license for ath11k is:

Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k for details

Does that cover your concerns about redistribution?

I'm still working on your other comment about notice.txt, will get back
on that later.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes
