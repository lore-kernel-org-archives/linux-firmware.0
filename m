Return-Path: <SRS0=GdVC=5U=collabora.com=denys.f@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B96BC05027
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Jan 2023 18:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4FC8FC433EF; Mon, 23 Jan 2023 18:28:36 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8241EC433D2
	for <linux-firmware@kernel.org>; Mon, 23 Jan 2023 18:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8241EC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from [IPv6:2a0d:e40:0:4000:a33d:5e2a:b8b4:d3c4] (unknown [IPv6:2a0d:e40:0:4000:a33d:5e2a:b8b4:d3c4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nuclearcat)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 10E426602C0F;
	Mon, 23 Jan 2023 18:28:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674498512;
	bh=BpcRf39ZbZ2Z/6Sv+Ydq+Z5y4Bmezwk0nyyX8c+ZZDk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=eYOAJW3XcrFQ2Y4mhZk/0IhDhRZWqmKlSDImp30J7JualcfJO7ktyxkdyw1bMymuK
	 JowFGYsYx8tsNxFAYM7wZcttmpOEmt5k5T3I8zUKTm6SZ6/a/WOZryti/N7VtUNNzA
	 kfh1w+JPpyCZ/z1p5Tj8vjUKX7sm1v7+Up0YfGg19OFBmBDHer1v4FO78D6OmD/zNO
	 vC04+N/i5kwM/O86XkI815NDa8J2SsXPO2BOOykCQJOZDa2SJENnae8cYZN9v5iyZm
	 JqqrT8ItJx/iV4izCx5VdYv1Poi04E03IN8PoSkFLEwBA63VSUt0jMxAeC/wbV6jbw
	 KkITGRq7s1/Dg==
Message-ID: <c9e53148789e0b6f31fe8fc04977e6b56728cdfb.camel@collabora.com>
Subject: Re: pull request: add back missing symlink to Qualcomm firmware file
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: Nathan Hebert <nhebert@chromium.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Date: Mon, 23 Jan 2023 20:28:26 +0200
In-Reply-To: <CANHAJhG3ba2jQhJ1p0nhN=XfFysp8vAPBW_wp9gsnyPu69bT7A@mail.gmail.com>
References: <5dc7081a8b793baf08f20df6b641a86a80c9e15c.camel@collabora.com>
	 <CANHAJhG3ba2jQhJ1p0nhN=XfFysp8vAPBW_wp9gsnyPu69bT7A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 2023-01-23 at 10:06 -0800, Nathan Hebert wrote:
> Hi Denys,
> 
> On Fri, Jan 20, 2023 at 10:23 PM Denys Fedoryshchenko
> <denys.f@collabora.com> wrote:
> > 
> > Add missing symlink required for Qualcomm SC7180.
> > As stated in
> > https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/qcom/venus-5.4?id=ad9fdba01fd2c909ea7962844211e25aa276e705
> > likely by mistake file got deleted, instead of replaced by symlink.
> > 
> > It results SC7180 failing to load firmware with following message:
> > 
> > 1679 20:43:46.474154  <4>[   18.381820] qcom-venus aa00000.video-
> > codec:
> > Direct firmware load for qcom/venus-5.4/venus.mdt failed with error
> > -2
> > 
> > After fixing it device booting without error.
> > 
> > 
> > The following changes since commit
> > 7e4f0eda76d58024f78ac68d4ffd6f87d63a3a29:
> > 
> >   Merge https://github.com/pkshih/linux-firmware (2023-01-17
> > 08:00:15 -
> > 0500)
> > 
> > are available in the Git repository at:
> > 
> >   https://github.com/nuclearcat/linux-firmware
> > 
> > for you to fetch changes up to
> > a02f1168becbaacbae82a7002ff489c137f9b8b4:
> > 
> >   qcom: Fix symlink from venus-5.4/venus.mdt to venus.mbn (2023-01-
> > 20
> > 14:18:17 +0200)
> > 
> > ----------------------------------------------------------------
> > Denys Fedoryshchenko (1):
> >       qcom: Fix symlink from venus-5.4/venus.mdt to venus.mbn
> > 
> >  qcom/venus-5.4/venus.mdt | 1 +
> >  1 file changed, 1 insertion(+)
> >  create mode 120000 qcom/venus-5.4/venus.mdt
> It is my understanding that the link from qcom/venus-5.4/venus.mdt to
> venus.mbn should be handled by the WHENCE file. There is a line [0]
> that describes the link. A reviewer discouraged me from creating the
> link in the file tree.
Thank you very much for the information! 
This is somewhat surprising, i guess we will adapt our CI to use
copy-firmware.sh now.

> > 
> > 
> > Thank you!
> > 
> 
> Best regards,
> Nathan Hebert
> 
> [0]: 
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/WHENCE?id=bb2d42dceff755623d6d59a32a743ccf87cbb6b9#n5730


