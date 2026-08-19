Return-Path: <SRS0=oZor=GM=molgen.mpg.de=pmenzel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71090C5DF86
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Aug 2026 10:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 492E11F00A3A; Wed, 19 Aug 2026 10:40:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1787136025;
	b=rZHyQntZNJkeN0tv8ievVve3UyoTF4o/sI4RADGFfP5HTtVNPmjPt1TzPR+GtucbV91l
	 7vDIKce60KYh5TTWQ3kqACgWmlAPBptDExlXkRfWZ6QtolCQw2PFdpx9lEoFDSxFr0VyS
	 TGrhCNsnHU6/mEttz0tQByIGoCskxHwyOrKRk7+AU3CfLKXHohP8TIlcO6NZU6qzy7rmN
	 +0Mm0MOvAWrbw9SJP0R62AVDsR1Anb0Pu2Agp5EUwxoFOP4l1S/1OFjaLGQryvpK1EDXj
	 eZxC/KaAPyS/wUICTLFSKjtmRh3E5/bb0KuuGzvL2L+rA4Pg46CqmK9xKAj7daldQyA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787136025;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:List-Id:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=HukbyObVR5fMqPJdqufVjaPpmFUKP0LCkJl35Ps+dG4=;
	b=beL/ySVvXZaFtc6zLE5jaSXdiUgbdSJRwSAcVou+ZlcjUcAQY3o2Ia4eqt/HlnsLlgB7
	 1cdZ/uS5iXANdbE4A0aN5rqmk0r+iVbCwkB4rgpjI/RinGaAMAqW3Sr4bAir1K+TSYdFA
	 Pcq88Oq9Y55fsC+XbPIMUZrDOvPqvwPesBPzM1lM6cJbCRnsJTSG+Foqwk+piVnMXRpuI
	 dXOSzmfySgfk2i1YTOzmi097sXeX0yGQYrBWrQN2XpDO61OO/JtUGykknm9DFEllO5pJE
	 SdChokAHrcBwn34xZELOlTREwgGJQIhigOQ5TIWW5k9r8B4r97jRCIffs0P6FbB0WXw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dmarc=none header.from=molgen.mpg.de;
	spf=pass smtp.mailfrom=molgen.mpg.de;
	arc=none smtp.remote-ip=141.14.17.11
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7824E1F000E9;
	Wed, 19 Aug 2026 10:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 7824E1F000E9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.42] (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id A2D714C2C37F09;
	Wed, 19 Aug 2026 12:39:45 +0200 (CEST)
Message-ID: <2714ca05-ba70-40d1-ae41-68808bbab7b1@molgen.mpg.de>
Date: Wed, 19 Aug 2026 12:39:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mediatek MT7925: update bluetooth firmware to
 20260813113236
To: Chris Lu <chris.lu@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Ben Hutchings <ben@decadent.org.uk>, Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, Will Lee
 <will-cy.Lee@mediatek.com>, SS Wu <ss.wu@mediatek.com>,
 linux-firmware@kernel.org, linux-bluetooth@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org
References: <20260818013413.451943-1-chris.lu@mediatek.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20260818013413.451943-1-chris.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Chris,


Thank you for the patch.

Am 18.08.26 um 03:34 schrieb Chris Lu:
> Update binary firmware for MT7925 BT devices.
> 
> File: mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin
> Version: 20260813113236

It’d be great if you added a change-log or some kind of release notes 
for users to look at.

> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> ---
>   WHENCE                                        |   2 +-
>   .../mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin     | Bin 446831 -> 448367 bytes
>   2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/WHENCE b/WHENCE
> index 7be795df..07dceaea 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -6259,7 +6259,7 @@ Licence: Redistributable. See LICENCE.mediatek for details.
>   Driver: mt7925 - MediaTek MT7925 bluetooth chipset
>   
>   File: mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin
> -Version: 20260605184935
> +Version: 20260813113236
[…]


Kind regards,

Paul
