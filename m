Return-Path: <SRS0=65yr=IS=makrotopia.org=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670C7C3DA6E
	for <linux-firmware@archiver.kernel.org>; Mon,  8 Jan 2024 21:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3DBDAC43390; Mon,  8 Jan 2024 21:06:16 +0000 (UTC)
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4A2D4C433C7;
	Mon,  8 Jan 2024 21:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4A2D4C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rMwoy-00079t-03;
	Mon, 08 Jan 2024 21:06:09 +0000
Date: Mon, 8 Jan 2024 21:06:01 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Sky Huang <SkyLake.Huang@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: John Boyer <jwboyer@kernel.org>,
	linux-firmware <linux-firmware@kernel.org>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	Steven Liu <Steven.Liu@mediatek.com>,
	John Crispin <john@phrozen.org>
Subject: Re: [PATCH] linux-firmware: add firmware for mt7988 internal 2.5G
 ethernet phy
Message-ID: <ZZxjuf32ks-L9DdC@makrotopia.org>
References: <20231113075818.23391-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113075818.23391-1-SkyLake.Huang@mediatek.com>

Hi SkyLake,

On Mon, Nov 13, 2023 at 03:58:18PM +0800, Sky Huang wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> This patch adds firmware file of version 2023/07/28 for mt7988 internal 2.5G
> ethernet phy.
> 
> Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
> ---
>  WHENCE                             |   9 +++++++++
>  mediatek/mt7988/i2p5ge-phy-pmb.bin | Bin 0 -> 131072 bytes

Will you also submit 2p5ge-phy-dmb.bin ?
The hardware seems to require both files (*pbm.bin and *dmb.bin).

Cheers

Daniel
