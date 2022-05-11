Return-Path: <SRS0=zkMB=VT=collabora.com=nfraprado@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6530DC433F5
	for <linux-firmware@archiver.kernel.org>; Wed, 11 May 2022 16:29:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 396B7C34113; Wed, 11 May 2022 16:29:41 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B010AC34115
	for <linux-firmware@kernel.org>; Wed, 11 May 2022 16:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B010AC34115
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: nfraprado)
	with ESMTPSA id 983341F43201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1652286577;
	bh=hX0iafREagtxS66FG0SAEAbZpk1B/kOrKATbL3d0zp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BDPTLaFPsCs9+9U1N3GSw/OfKzPkpcR7P1q5p3URastOjrNfhjHkBpBmxNpMJlMId
	 lShS8O6LTW5U6dqmAwNfihHKDDVtoC6Ia9z5UxdHI/SzpuMSYcLdr+mGOGRA4J+Ibz
	 HBsk+ok/pVHF36LhohT2MsnLUW1IaY1eKowCgsKAQunrD8QlvNo57EEQ1Hu6oiJXra
	 p2qDvzIRAJkz5wEhJmMHl17PbGf18WFwll0n9OPHVhn7n2dvGPf7In8sIdX3RqaKUx
	 9ZJCrjSuuzg3TnSSoiNDZ0YbPbvDUIQL7wRq2pgKuoB89AfmiCgrbyiTVfK2SHQ7S7
	 TT7l0oX4nMKOw==
Date: Wed, 11 May 2022 12:29:31 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Tinghan Shen <tinghan.shen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org,
	rongchang@google.com, yunfei.dong@mediatek.com, shawnku@google.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	weishunc@google.com, nfraprado@collabora.corp-partner.google.com
Subject: Re: [PULL] mediatek: Update mt8192 firmware
Message-ID: <20220511162931.nlb4gdbnefjgozpu@notapiano>
References: <2537b84fbba82a77ee0a517b12bdcdd5e6ac1503.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2537b84fbba82a77ee0a517b12bdcdd5e6ac1503.camel@mediatek.com>

On Wed, May 11, 2022 at 02:54:42PM +0800, Tinghan Shen wrote:
> Hi linux-firmware maintainers,
> 
> Update the MediaTek mt8192 firmware to v2.0.8537.
> 
> 
> Thanks,
> TingHan
> 
> --
> The following changes since commit b19cbdca78ab2adfd210c91be15a22568e8b8cae:
> 
>   Merge branch '8183-v2.0.2745' of https://github.com/tinghan-shen/linux_fw_scp into main (2022-05-
> 09 13:59:43 -0400)
> 
> are available in the Git repository at:
> 
>   https://github.com/tinghan-shen/linux_fw_scp 8192-v2.0.8537
> 
> for you to fetch changes up to 86e64fe7c052b85762eeefc258c379331e6b20b3:
> 
>   mediatek: Update mt8192 SCP firmware (2022-05-11 13:36:48 +0800)

Hi TingHan,

thank you for this update. Unlike the previous mt8192 firmware which had trouble
booting, this firmware does work and I was able to decode VP8 and VP9 with it on
mt8192-asurada-spherion with the mt8192 decoder series [1] applied. So,

Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

[1] https://lore.kernel.org/all/20220506092855.22940-1-yunfei.dong@mediatek.com/

> 
> ----------------------------------------------------------------
> Tinghan Shen (1):
>       mediatek: Update mt8192 SCP firmware
> 
>  WHENCE                  |   2 +-
>  mediatek/mt8192/scp.img | Bin 309436 -> 327968 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> 
