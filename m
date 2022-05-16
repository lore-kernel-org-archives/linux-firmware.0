Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF667C433F5
	for <linux-firmware@archiver.kernel.org>; Mon, 16 May 2022 19:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6CDADC3411A; Mon, 16 May 2022 19:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57FFAC34119
	for <linux-firmware@kernel.org>; Mon, 16 May 2022 19:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652728844;
	bh=qwaR9MS+vRCYsBAEEmVSvTOhEEi9a2Uj6OE3qZoj8Wc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=fQpGBN9aXw3RRjl8JoOUn2he9ISaMAGYYRxWOJJQ896uuGbDINgShQn0nYlfsUUjL
	 jPglvCuaYkA33QwBQOZDlxfD6CBI2UTDS7gCGgfZhWWLKP0KiKnOmLajVF70o1xL4c
	 DIRY07+9qvgyipTeLnvAQcbEU66gx7idx6X3WX1FIrq8axRn8GPrikzXZsBcvOBs/V
	 //fct5hSc3CJgMfoET7Gu7bk1fowazvPCl4Zk9x8ymNU3kZMNYEoUjAyuBoj19hLmg
	 meL8yUHngejdeBlMfg8p36UrcSeakJwasimMA/Y4SXWW2H7caCfycK8cSLZIP5n7C5
	 ssXxdQ16RPhrQ==
Received: by mail-io1-f51.google.com with SMTP id m6so17064683iob.4
        for <linux-firmware@kernel.org>; Mon, 16 May 2022 12:20:44 -0700 (PDT)
X-Gm-Message-State: AOAM533lo/mjFZbwMQujlYCbLwLTUeFnq3GBsrdD1pPsKEXU+ZHqPMfP
	yaZaYME7RDe2cbMmr2Y9ZVQeEBgxUvTg8oPiI1Q=
X-Google-Smtp-Source: ABdhPJx6+tyZr+cCMZ4s+UJPlLzZR/SlQ6X8GG8QqZTDRpwrF59NKWw4qKWbENpxelAOvNDyLqNfW1l4Oqbd1badVTM=
X-Received: by 2002:a05:6638:3e86:b0:32e:30d4:af53 with SMTP id
 ch6-20020a0566383e8600b0032e30d4af53mr3402267jab.146.1652728843486; Mon, 16
 May 2022 12:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <2537b84fbba82a77ee0a517b12bdcdd5e6ac1503.camel@mediatek.com> <20220511162931.nlb4gdbnefjgozpu@notapiano>
In-Reply-To: <20220511162931.nlb4gdbnefjgozpu@notapiano>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 16 May 2022 15:20:32 -0400
X-Gmail-Original-Message-ID: <CA+5PVA43SgXKz5EA6RTk74FxiDALy899G1Rvi_aO=q9Yd_pCKw@mail.gmail.com>
Message-ID: <CA+5PVA43SgXKz5EA6RTk74FxiDALy899G1Rvi_aO=q9Yd_pCKw@mail.gmail.com>
Subject: Re: [PULL] mediatek: Update mt8192 firmware
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Tinghan Shen <tinghan.shen@mediatek.com>, Linux Firmware <linux-firmware@kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>, Rong Chang <rongchang@google.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Shawn Ku <shawnku@google.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, weishunc@google.com, 
	nfraprado@collabora.corp-partner.google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2022 at 12:29 PM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> On Wed, May 11, 2022 at 02:54:42PM +0800, Tinghan Shen wrote:
> > Hi linux-firmware maintainers,
> >
> > Update the MediaTek mt8192 firmware to v2.0.8537.
> >
> >
> > Thanks,
> > TingHan
> >
> > --
> > The following changes since commit b19cbdca78ab2adfd210c91be15a22568e8b=
8cae:
> >
> >   Merge branch '8183-v2.0.2745' of https://github.com/tinghan-shen/linu=
x_fw_scp into main (2022-05-
> > 09 13:59:43 -0400)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/tinghan-shen/linux_fw_scp 8192-v2.0.8537
> >
> > for you to fetch changes up to 86e64fe7c052b85762eeefc258c379331e6b20b3=
:
> >
> >   mediatek: Update mt8192 SCP firmware (2022-05-11 13:36:48 +0800)
>
> Hi TingHan,
>
> thank you for this update. Unlike the previous mt8192 firmware which had =
trouble
> booting, this firmware does work and I was able to decode VP8 and VP9 wit=
h it on
> mt8192-asurada-spherion with the mt8192 decoder series [1] applied. So,
>
> Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Pulled and pushed out.

josh

>
> Thanks,
> N=C3=ADcolas
>
> [1] https://lore.kernel.org/all/20220506092855.22940-1-yunfei.dong@mediat=
ek.com/
>
> >
> > ----------------------------------------------------------------
> > Tinghan Shen (1):
> >       mediatek: Update mt8192 SCP firmware
> >
> >  WHENCE                  |   2 +-
> >  mediatek/mt8192/scp.img | Bin 309436 -> 327968 bytes
> >  2 files changed, 1 insertion(+), 1 deletion(-)
> >
> >
