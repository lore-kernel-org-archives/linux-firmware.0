Return-Path: <kvalo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F07AC433EF
	for <linux-firmware@archiver.kernel.org>; Wed, 13 Apr 2022 08:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D5DB4C385AB; Wed, 13 Apr 2022 08:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C362FC385A3;
	Wed, 13 Apr 2022 08:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649838526;
	bh=y0bLgtdqrc4kC/bUaLQ8sB2CnYcK5VjYVok5sq719a0=;
	h=From:To:List-Id:Cc:Subject:References:Date:In-Reply-To:From;
	b=a3aUmlPtjj4+tULYr12Ypjw7JlPUSawZDDj6SDNalXhJj2AKSXEC+qu0pPiR12IMQ
	 YT9aOSyaKdWIv8AObQ8DSgSxI/5Wb46zH1X1fPOkBzwgsj7FWgEeDOvqFYD7RZrwPk
	 ZXNAG2UdJvPRAgnjuB+iCdXQHIqnA23X33cyBTiBUJSTuIjGPwX78PUF0YxYg54qE+
	 xT08Q8NWGLaffPyvyerfV1YgRsmcOBYPt9OriUdcXX/zTM7iTywTgJF00HkndNxt9S
	 eRPFgyH5NGhev5cl+Zb4qqsqbuwtXN+PQuQzzaSXC3Dq/iIQVM5twrstxMijsxr5pI
	 UcQVuCneuVo1A==
From: Kalle Valo <kvalo@kernel.org>
To: Sven Eckelmann <sven@narfation.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware\@kernel.org" <linux-firmware@kernel.org>,  ath11k@lists.infradead.org,  "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: Re: [PULL] ath11k firmware 20211223
References: <BYAPR02MB4567669033A210A78AC397E9927E9@BYAPR02MB4567.namprd02.prod.outlook.com>
	<4785910.v3KmxWAaZY@ripper>
Date: Wed, 13 Apr 2022 11:28:43 +0300
In-Reply-To: <4785910.v3KmxWAaZY@ripper> (Sven Eckelmann's message of "Fri, 18
	Feb 2022 16:00:47 +0100")
Message-ID: <87czhlmlok.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain

Sven Eckelmann <sven@narfation.org> writes:

> On Thursday, 23 December 2021 15:03:04 CET Kalle Valo wrote:
>>  ath11k/QCN9074/hw1.0/Notice.txt  |  802 ++++++++++++++++++++
>>  ath11k/QCN9074/hw1.0/amss.bin    |  Bin 0 -> 11897676 bytes
>>  ath11k/QCN9074/hw1.0/m3.bin      |  Bin 0 -> 340108 bytes
>
> This pull adds the firmware for QCN9074 but not the board-2.bin. As result, 
> the initialization of the ath11k PHY will fail.

Good point, I missed that. My plan is to include both QCN9074 firmware
and board-2.bin in my next pull request.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
