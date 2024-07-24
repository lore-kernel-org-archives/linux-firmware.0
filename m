Return-Path: <SRS0=aXl4=OY=google.com=cujomalainey@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159BDC3DA61
	for <linux-firmware@archiver.kernel.org>; Wed, 24 Jul 2024 17:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CC1E8C32786; Wed, 24 Jul 2024 17:39:06 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E5304C32781
	for <linux-firmware@kernel.org>; Wed, 24 Jul 2024 17:39:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E5304C32781
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2cb5243766dso73053a91.0
        for <linux-firmware@kernel.org>; Wed, 24 Jul 2024 10:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721842745; x=1722447545; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSt2KK2zIYK1hYL/2M3AjkN5i0z/uG64IXDus0gPHfk=;
        b=Od+Z1DRX2LA15Wh+SQ+OnTwPdWDhN0lKd9nvWo+aPxkmWZZyVrQkrd0+6XJvxPQan6
         jR2KIQazelqrUTeWATVIWVsdKJym1a3TCvWuxq3CcrIwhG5PMgSAFEMyCXvDFCw1CYfU
         ux1ETWc+/+bVrh0+PEG4gFHPeWazAlKRavciUqZD1BYFEDiMJFEtbGUWhdMqpd9MsaG8
         r/aRXllw9P5bWeP7j/7F4wsEURi21+5QRjaoISn+OI2eyVrrie/Qj67A7OMibqpPHp/H
         D7w7+mBfA4ysdHeMz0ZepaE8xerGxPLDVT0ZmTzaeQBNTyntiw79a/XT0v39vfEQpeSX
         kuqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721842745; x=1722447545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSt2KK2zIYK1hYL/2M3AjkN5i0z/uG64IXDus0gPHfk=;
        b=uX2Y6THql5t3pfEaUP37TIDLS97v/Ji/77LU9if0VEnebGGPJkaVZQpw8AgoirrET9
         IiCdnu4F8jBv9ZzX+j/FXYZQxIYnBpdEhalOO6Zbj77Pn3yKdSW8P/2PVFs71ol8X2Ki
         4eNDc9iatosBAWvM4BTec8xeq+xXjNr2CMoxhhEJlqYdK3wE/jM92b1zJsq+Swu6DbEZ
         JRlb+aLT3q2Ln5qSvQ9FtaKsA5dKPPQvw1bNnnxtFosMzCHsLEXhejY4Gm6kpdSFKDKf
         hqEZsQ3zEl2HXvA+uAIqQCkcYFt9IHUVutITwfmGI+i6fcQ0y9yV6tOAF9hTsLsaVfEm
         aE2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWyn312GSVaqGvUoVs9GoKpkcEZhqltgvaL4KhINeoMux19aS9Mem7XfcFFvxnxyrRA98pQTTHNqkjol28u/fcSKXR7/quNEVJ6
X-Gm-Message-State: AOJu0YwM0TDkp21LVy91AibGTmMUwnMpZD47DNhX9892rgNlHkjNT1DK
	gaZj7PF6yWyL52WG/NSVZ3hVHyMnsfFWgMyXlijkp3EkRF/SikTRV9/FfQmtfRFr2q+NZrQl55g
	aBwCT/j9GK8+palddn61zOKurjI8T2+ojo4Sj
X-Google-Smtp-Source: AGHT+IHE/F/3+xd2ienNaLYTqimWsJdW5ypyI+UzRtp57//RlQnOGuhoHJ3mTM8RSp8YJO2JNwcBhTYslPPXNmdftPE=
X-Received: by 2002:a17:90a:17a1:b0:2c4:af69:5c39 with SMTP id
 98e67ed59e1d1-2cf237a08camr295456a91.13.1721842744809; Wed, 24 Jul 2024
 10:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240719022132.30990-1-xiangzhi.tang@mediatek.com> <e8e66f8f-4238-4d8a-ad20-32bc4cb1dbb1@notapiano>
In-Reply-To: <e8e66f8f-4238-4d8a-ad20-32bc4cb1dbb1@notapiano>
From: Curtis Malainey <cujomalainey@google.com>
Date: Wed, 24 Jul 2024 10:38:53 -0700
Message-ID: <CAOReqxh_rCST_7jfy6rrPreii6DmOM1S8nootuB_cZYYP_GPqQ@mail.gmail.com>
Subject: Re: [PATCH] mediatek: Update mt8195 SOF firmware and sof-tplg
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Xiangzhi Tang <xiangzhi.tang@mediatek.com>, linux-firmware@kernel.org, 
	linux-mediatek@lists.infradead.org, hailong.fan@mediatek.com, 
	Xiangzhi Tang <xiangzhi.tang@mediatek.corp-partner.google.com>, 
	Curtis Malainey <cujomalainey@chromium.org>, Wojciech Macek <wmacek@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2024 at 5:24=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> On Fri, Jul 19, 2024 at 10:21:32AM +0800, Xiangzhi Tang wrote:
> > Update SOF version: sof/sof-mt8195.ri
> > Release version: v0.4.2
> > Remove sof-mt8195-mt6359-rt1019-rt5682-dts.tplg
> >
> > Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.corp-partner.googl=
e.com>
> > ---
> >  WHENCE                                        |   3 +--
> >  .../sof-mt8195-mt6359-rt1019-rt5682-dts.tplg  | Bin 20895 -> 0 bytes
>
> Hi,
>
> the firmware file you're removing here is used by the MT8195 Tomato machi=
ne:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/s=
ound/soc/sof/mediatek/mt8195/mt8195.c?id=3D786c8248dbd33a5a7a07f7c6e55a7bfc=
68d2ca48#n575
>
> So with the latest kernel and linux-firmware, Tomato doesn't have working=
 sound.
> I see there has been a patch a few months ago to change the topology used=
 on
> Tomato, but it hasn't been merged nor followed up:
> https://lore.kernel.org/all/20240318183004.3976923-1-cujomalainey@chromiu=
m.org/#t
>
> If the non-dts topology does indeed work for Tomato, I assume we'll see a=
n
> update to the patch updating the topology for tomato very soon to restore
> functionality?

Yes, I was waiting to resend my patch until this landed. Now that it
has, I will be resending it this week.

An aside on this patch as well is that it missed updating the ldc for
the firmware, which will need to be fixed by MTK.

Curtis

>
> Thanks,
> N=C3=ADcolas
>
> >  mediatek/sof/sof-mt8195.ri                    | Bin 173832 -> 100740 b=
ytes
> >  3 files changed, 1 insertion(+), 2 deletions(-)
> >  delete mode 100644 mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-d=
ts.tplg
