Return-Path: <SRS0=eDDz=5J=collabora.com=nfraprado@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98D5C678D6
	for <linux-firmware@archiver.kernel.org>; Thu, 12 Jan 2023 20:46:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B045DC433F0; Thu, 12 Jan 2023 20:46:39 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A39FAC433D2
	for <linux-firmware@kernel.org>; Thu, 12 Jan 2023 20:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A39FAC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9FA2D6602CEE;
	Thu, 12 Jan 2023 20:46:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673556395;
	bh=FtkDtIh6NMt+QWac83XzUxw2O6dDKVoMsCkF62h/iKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AnMjxNlUxyaP13R1jyHTlo0xkMblU1UCSxC2dB+y8a0lVa3xWzKh+gn8scVwNGA99
	 e08g1aP1kOOoOhCJQT5cw6C0Rt2QuERtIN9Ee60YgQxAlUKFXL+gA9BVEsfMDZnwJl
	 /L0wA5Ri68qFOaPNwFPvu9+DFoVjtj15buSqvLpD1AXAum8QWwoS2IWJaDIaZBadbA
	 46ORAtuNPu/DONI3CMuEt6IFRCtu/lllUMpTie48YyGkxiXnoRE/e7S/yh18HJ0G+G
	 5JG7q5MKbRaNyjPGK84tOuohwlR2v3Yh3LBFt8Ba985DZfo+tClO5+aV5nFeNlSV/h
	 kzDfjlVv9dn0Q==
Date: Thu, 12 Jan 2023 15:46:26 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Tinghan Shen <tinghan.shen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org,
	yunfei.dong@mediatek.com, shawnku@google.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Justin.Yeh@mediatek.com, Allen-KH.Cheng@mediatek.com
Subject: Re: pull request: linux-firmware: Update Mediatek
 MT8183/MT8192/MT8195 SCP firmware
Message-ID: <20230112204626.ciaff4amseoidybw@notapiano>
References: <42437b6fc5dac19bf23f9806dfbe6915e055397b.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42437b6fc5dac19bf23f9806dfbe6915e055397b.camel@mediatek.com>

On Fri, Jul 22, 2022 at 04:29:34PM +0800, Tinghan Shen wrote:
> Hi maintainers,
> 
> Update SCP firmware for MediaTek MT8183/MT8192/MT8195.
> Thank you!
> 
> 
> Regards,
> TingHan
> 
> ---
> 
> The following changes since commit 4421586e8e95ce789cb6b3f1af98962bfef74c7b:
> 
>   amdgpu: update renoir to release 22.20 (2022-07-19 06:44:08 -0400)
> 
> are available in the Git repository at:
> 
>   https://github.com/tinghan-shen/linux_fw_scp mtk-scp-20220722
> 
> for you to fetch changes up to 56cf6461a82b08facd41154f7c44a19f0a085f66:
> 
>   mediatek: Update mt8183/mt8192/mt8195 SCP firmware (2022-07-22 16:16:27 +0800)

Hi Tinghan,

the SCP firmware for mt8192 added in this commit caused a regression. Gstreamer
currently supports using the decoder on mt8192 only with the MM21 format, which
was available in the previous firmware, but after this commit the firmware only
enumerates MT21C as the format available, hence breaking the decoder usage with
Gstreamer. Please update the firmware so that it makes the MM21 format available
again and restores the functionality.

Thanks,
Nícolas

> 
> ----------------------------------------------------------------
> Tinghan Shen (1):
>       mediatek: Update mt8183/mt8192/mt8195 SCP firmware
> 
>  WHENCE                  |   6 +++---
>  mediatek/mt8183/scp.img | Bin 1032064 -> 1030776 bytes
>  mediatek/mt8192/scp.img | Bin 327968 -> 328096 bytes
>  mediatek/mt8195/scp.img | Bin 429668 -> 429820 bytes
>  4 files changed, 3 insertions(+), 3 deletions(-)
> 
> 
