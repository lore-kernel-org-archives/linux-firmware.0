Return-Path: <SRS0=7wBf=DE=gmail.com=yangsunyun1993@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21C3CD3436
	for <linux-firmware@archiver.kernel.org>; Thu,  7 May 2026 00:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B25DEC2BCC7; Thu,  7 May 2026 00:56:48 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E511BC2BCB0
	for <linux-firmware@kernel.org>; Thu,  7 May 2026 00:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E511BC2BCB0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7d55b97f358so234102a34.3
        for <linux-firmware@kernel.org>; Wed, 06 May 2026 17:56:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778115407; cv=none;
        d=google.com; s=arc-20240605;
        b=UxZZl0wkolan2zfpBz9PsqYRvpwilWxBp1v4w+tfXtMy1679MDcZP7KpScs1KuquFC
         lAlHKZr9G+JK3S69dMpZ0yFNNPpCj3KjCWKMqdXhQQDSp320F6pdsTwvNpD5J11raN6Q
         3/mJ3FM17hqWra8LCMd+a4H+dMOeM593QmBHkm491rztGa+SxnCVjXh7cd0ubya5FX9i
         2Fci1Fvdj2T+01Gdmz3dVWT83j9jKAoL5Mzazmw/uQjRCAQ/V/cIFWKxwIcoGSJosNRg
         7rWoL1ZMVW/5Tg2vf5aQEgXIzUUUnpbVC2PoxslJLbMAQfT3K/x8Kf1HGlubCYFYfQdB
         d4aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g1sA1lyRofYcGEHdA6gOvVQU5sDRhK4CKp/w5qZjsk0=;
        fh=V+yMd8itJxnTD2osfIboQYbwSE3EXTfCC/fa/EwYCPA=;
        b=bKrXuonEBjhDFWOeZPwrY3jnEiTXvB+iVFWTw5CLPnvyNzIoON2m0INKJ7+PQPJ9Qv
         gQPG2YS9KWe729HWuNM7QeEaqYEQISTG7gDT6eLb7laGLQFu4ekND+oEmCD24eRxLAGY
         AOYI+PSW8zAfVOxAW4zgGOlMWF+eyF0KUa8mIZjq4ZRaLlw76OG2tQO9okWllHbPAhWt
         vI3oiNlQ75RuZIqejXgRnrYCsQVHOwHqquWcqWGaXbChjkyYfOTPuieRYWdiKQqHjfln
         Mcsq/9qpI7dr4dzNoA3CyMpzF2+sCxpvxuw7xzVqS1oKN33Ags4Ak3kazr3LtZjD+PZz
         hbSw==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778115407; x=1778720207; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1sA1lyRofYcGEHdA6gOvVQU5sDRhK4CKp/w5qZjsk0=;
        b=KjvSSKiDCVS57y8n/CLTOXOgxV2mLDOgZhwMasXLaQ1vunPnIvNHMXSiszBzs1ohMn
         +sIcnaKQefsAP1VS1SOLO7DWvqXG0HwsDi2ui3ibNEjsrrsdAViLndxthQ+7HS/vn5m0
         Snu5OR6ercHeT2M3wCNqb9claGldA2QaaohAQc7PE6Ed/1/WvvYnUhtmygnh9He+9jjo
         VNTKlo0KS/XYrQMr7u8jmuiH5sO5GQ3HGCCJq3lCzMfqsY0bpOLJUZUrdeEdLw3o/+cK
         98npEJHiUNQCNQ+CH55Rfb7ZiJL9rFmsCkig/KgYojPn3aO2GELgHgU8Shgtd5CVs4AX
         cy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778115407; x=1778720207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g1sA1lyRofYcGEHdA6gOvVQU5sDRhK4CKp/w5qZjsk0=;
        b=EPq6HZkC8cF5uEZxT1kn5pjlOPZJkuBkDMIpCUENuBtllwaZ0UPW5XDeL9AHF2T2Ot
         q14aDbbDTO2XbG/8pScl9PdlkUong+YRROchXSE112mO/ooA7CjU6Uk9R5VhDJ0NStCg
         a1V75ycVh2vcpUle4ePza3AscjrO8XJ9UxN5oQLYsLGOsX4maA2+5TZg7PCrUoX0CRAw
         7ldRmakY18YsZt8nZWRCpE9bKrlZ8C7kV3Tk0tixJ0nhFrxq9u90qnWiy1Hu5+K1wOzP
         +P+zqpfqQjyKY3Kz9yAVssGuV2e2FlKu/nobIJwry5u93FU0UWrM5XYyRn2jSrXakbZj
         7feA==
X-Forwarded-Encrypted: i=1; AFNElJ/5/D14ZEtWM0+LPxwgGPCwFrY1ZdFw1lEY6p+qgSEp6cNdU/fjf1sov4IaWgKZvj3yNKNBRjLNygDtkgjqzA==@kernel.org
X-Gm-Message-State: AOJu0Yx0TW9dmAaD39f+KFrnf6o3qC+4JAgcX4OKzRtCDLvrNJewbiKe
	NrP3f0CSWL+1C/IeEXeLt0Vtxj5aa+d4wDDok9rhbdbIPEpd4JfpbDnyWqIFhy+fW4jcVPfpDVp
	p3TUpQXSO1zK3GsxcOwUHNmiNNe8Bwt4=
X-Gm-Gg: AeBDieubUhpK+3EQwY6FAzCeT4t6aLJNAdgFVEcBzntkDGBcJk6fBMkpYLCbdmio2qi
	MPtFMEzjNcKATZ0FJ4ALAFh8IwwsoHl9dfyxn73ieNXBgiejY+L6O3fp/3i6FjhTJQ64dhA8WcO
	Lky9ZA33+oCPIt3QtH+7hRc/J0EsM453sF7OGa9SRPFAV465s7onI/nFpaB+xZn2HNjxIZMRYdF
	tfdj0unyOoWmdruhleZdYjBfSHRHzHmfCgMU9LlQzK9zfgh809N6mh3j2xNaZdjQ9aGkqHdHvLb
	jDIK/quj3DG7nZ7GQVvP3TSDwC6O
X-Received: by 2002:a05:6820:178a:b0:696:982b:1c24 with SMTP id
 006d021491bc7-69998d56a5cmr3110249eaf.57.1778115406810; Wed, 06 May 2026
 17:56:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260506104934.82275-1-syyang@lontium.com> <CAO9ioeVBF2O9sRT+KzMETvYuV5Jw0okj6MiM1sxVdc5j8Pdk3w@mail.gmail.com>
 <CAFQXuNbA-wW-ZyqZKjRagA+qpPMP7AAtaX67Y4=AHOx23s2SEg@mail.gmail.com>
 <CAFQXuNbWQQN0U+s0K2XV7hy6ow3x7RAB8Q=nxOvsWENDAE=2VQ@mail.gmail.com> <uprzduq4ct2dpkwvlbwxw43b77yzubjwkzvjhadlkoajmbbybe@3cygq6vamfy4>
In-Reply-To: <uprzduq4ct2dpkwvlbwxw43b77yzubjwkzvjhadlkoajmbbybe@3cygq6vamfy4>
From: =?UTF-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Date: Thu, 7 May 2026 08:56:35 +0800
X-Gm-Features: AVHnY4IpqoVhLCpOMAkka2K3RzMKu25-S4RZJ-aEYGB73dj_vPbjIK_Tkr419W8
Message-ID: <CAFQXuNZpBnA=kCCKEhXtN4wDOdU48D94PpbYrR_cEu+YUt8aBw@mail.gmail.com>
Subject: Re: [PATCH v2] linux-firmware: Add firmware for Lontium LT9611C
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: syyang@lontium.com, linux-firmware@kernel.org, 
	xmzhu@lontium.corp-partner.google.com, xmzhu@lontium.com, rlyu@lontium.com, 
	xbpeng@lontium.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
5=E6=9C=887=E6=97=A5=E5=91=A8=E5=9B=9B 04:08=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, May 06, 2026 at 08:01:46PM +0800, =E6=9D=A8=E5=AD=99=E8=BF=90 wro=
te:
> > =E6=9D=A8=E5=AD=99=E8=BF=90 <yangsunyun1993@gmail.com> =E4=BA=8E2026=E5=
=B9=B45=E6=9C=886=E6=97=A5=E5=91=A8=E4=B8=89 19:55=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B45=E6=9C=886=E6=97=A5=E5=91=A8=E4=B8=89 19:46=E5=86=99=E9=81=93=EF=BC=
=9A
> > > >
> > > > On Wed, 6 May 2026 at 13:49, <syyang@lontium.com> wrote:
> > > > >
> > > > > From: Sunyun Yang <syyang@lontium.com>
> > > > >
> > > > > This is the firmware for the Lontium LT9611C,
> > > > > which implements the function of converting MIPI DSI to HDMI.
> > > > >
> > > > > Signed-off-by: Sunyun Yang <syyang@lontium.com>
> > > > > ---
> > > > > Change in v2:
> > > > > - WHENCE
> > > > >  1. Modify lt9611c_fw.bin to Lontium/lt9611c_fw.bin in the WHENCE=
 file.
> > > > > - Link to v1: https://lore.kernel.org/all/20260506100242.79276-1-=
syyang@lontium.com/
> > > >
> > > > Why? The rest of the Lontium firmware is in the root directory. The
> > > > driver also (IIRC) expects the firmware in the root firmware
> > > > directory.
> > > >
> > >
> > > Our intention is to place all Lontium firmware in the Lontium/
> > > directory for the following reasons:
> > >
> > > 1. To distinguish them from other companies' firmware files=EF=BC=8Cs=
uch as
> > > rockchip, qcom.
> > >
> > > 2. To keep the root directory cleaner and more organized.
> > >
> > 3. Clear organizational structure
> > 4. Avoid root directory bloat
> > 5. Improve readability
> >
> > That's what I think.
>
> It's all fine... If it was consistent with the driver that is being sent
> to dri-devel@. I'm fine either way (and yes, having Lontium subdir makes
> sense as this is the 3rd one already). But then at least drop a note to
> the dri-devel mailing list that you'll send the next iteration of the
> driver.
>
thanks Dmitry, your reply is very useful to me.

In the next version of the driver (v5), I will use  #define FW_FILE
"Lontium/lt9611c_fw.bin".

> --
> With best wishes
> Dmitry
