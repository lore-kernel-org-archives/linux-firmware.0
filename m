Return-Path: <SRS0=DtDr=OY=collabora.com=nfraprado@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5BDC3DA61
	for <linux-firmware@archiver.kernel.org>; Wed, 24 Jul 2024 12:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C4414C4AF0C; Wed, 24 Jul 2024 12:24:52 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A80A6C4AF0E
	for <linux-firmware@kernel.org>; Wed, 24 Jul 2024 12:24:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A80A6C4AF0E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721823889;
	bh=UVD2Yt3dsJrWL4IWAIKjqj8rXsBGJy+fgtZcpJxMWUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hlU/Gld0klFYbgCRKZsWCRxzEGnD4J8kp8ZMSRl7eyb/4tUDymd233JP2YzxDCzK+
	 SZnJChXHYClbUzoQ6RJUKbRx1XliJU0FLjXM4+LSD8fZS5abF18bvsepPYjeMXz5vK
	 wTPEinZR6KZFBWwXGaxpSM1VxbChJ8Aa6MTNzOxYJ0fOQRhcmFRE0g+hW+g6t5aVzK
	 chtHhK664Bt30eKMU0OrxNtAhp0wrEPb6es+sc2NEJWkswcpT7sLJmI5/4wCEFuEyJ
	 WmV+PnyDmk8Yn6VCrdCmTFcB6xyvFqUsVfTRraFkY93fP5pOPq2lS6vt4FhsFUBE1N
	 3aonblASpSaeQ==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E73093781144;
	Wed, 24 Jul 2024 12:24:47 +0000 (UTC)
Date: Wed, 24 Jul 2024 08:24:45 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org,
	hailong.fan@mediatek.com,
	Xiangzhi Tang <xiangzhi.tang@mediatek.corp-partner.google.com>,
	Curtis Malainey <cujomalainey@chromium.org>,
	Wojciech Macek <wmacek@google.com>
Subject: Re: [PATCH] mediatek: Update mt8195 SOF firmware and sof-tplg
Message-ID: <e8e66f8f-4238-4d8a-ad20-32bc4cb1dbb1@notapiano>
References: <20240719022132.30990-1-xiangzhi.tang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240719022132.30990-1-xiangzhi.tang@mediatek.com>

On Fri, Jul 19, 2024 at 10:21:32AM +0800, Xiangzhi Tang wrote:
> Update SOF version: sof/sof-mt8195.ri
> Release version: v0.4.2
> Remove sof-mt8195-mt6359-rt1019-rt5682-dts.tplg
> 
> Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.corp-partner.google.com>
> ---
>  WHENCE                                        |   3 +--
>  .../sof-mt8195-mt6359-rt1019-rt5682-dts.tplg  | Bin 20895 -> 0 bytes

Hi,

the firmware file you're removing here is used by the MT8195 Tomato machine:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/sof/mediatek/mt8195/mt8195.c?id=786c8248dbd33a5a7a07f7c6e55a7bfc68d2ca48#n575

So with the latest kernel and linux-firmware, Tomato doesn't have working sound.
I see there has been a patch a few months ago to change the topology used on
Tomato, but it hasn't been merged nor followed up:
https://lore.kernel.org/all/20240318183004.3976923-1-cujomalainey@chromium.org/#t

If the non-dts topology does indeed work for Tomato, I assume we'll see an
update to the patch updating the topology for tomato very soon to restore
functionality?

Thanks,
Nícolas

>  mediatek/sof/sof-mt8195.ri                    | Bin 173832 -> 100740 bytes
>  3 files changed, 1 insertion(+), 2 deletions(-)
>  delete mode 100644 mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg
