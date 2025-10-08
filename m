Return-Path: <SRS0=2mr0=4R=gmail.com=technoboy85@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B95CAC5BB
	for <linux-firmware@archiver.kernel.org>; Wed,  8 Oct 2025 13:27:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0D6DAC4CEF5; Wed,  8 Oct 2025 13:27:26 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 40A63C4CEF4
	for <linux-firmware@kernel.org>; Wed,  8 Oct 2025 13:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 40A63C4CEF4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b48d8deafaeso1331766b.1
        for <linux-firmware@kernel.org>; Wed, 08 Oct 2025 06:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759930043; x=1760534843; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/IqmJxYbXkGUJafgNNovCiyKceh2Ks0X8PZsaDhrLHg=;
        b=UqgUbsaNEQkPvrVzu4Yd91wZ85hy/Wuecc3kw+0myPNVZXNfBQz4B+MYdUAJiArKS2
         wLrUXsLPS/NQDLUgNIJRDJqEitUlperKKWbbESfwrGvUv+iTMEEOJ0O2DZt8sAScetCE
         vSPpv/E8s2Iuf0WaKxR/kLcZbV/cNVbFjWHQ/x71oGPpJsFCXmGHtremBPSBwHNll2Ft
         mvzdbIcmeQPNddboxMdg2w7REIWGOp/MZAmtrOVk/87xzRtJAM1VedPXNte9SL6ckenE
         tyVbRJFooOs+KqxMuj+oQJUS+KAgIBjPJ7boK1qIi+fdzO4PyGkFNUSjz7aQdJ2GKour
         KBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759930043; x=1760534843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/IqmJxYbXkGUJafgNNovCiyKceh2Ks0X8PZsaDhrLHg=;
        b=ODBgXM1xo6OCTaIuxsxZsYgXD+viCJI6HJY0UtAp68XUBD/yacGHDDlsLw/WwWsxQ9
         JclsPgKRqEoN5cNfey4TFS0zXAJRN1/9EgWxxpSYAhpSa07cANzQ8mM3x/KaVE0C1u+l
         PH7ISASDWOJKIrb9EQsRgQJPihVyZKJYaN/r0aCyWqh+iMwpa0EUDIxXiG374QUmJOpo
         mXZ6ZKNg9Rl4Ow7r3WfWFfvzkxD7tAEMqlA9g3eiHpRZqi+SfuEeo1SajSUbdcDnQSgy
         pB1k4ALQ1ChccJDu/f6b24m5iisDQqOH843rUHKvnNIKFNef43bioOED99/+bDThtU2w
         PpJg==
X-Forwarded-Encrypted: i=1; AJvYcCVlwvpHh2JGmXLbPbRqh97rdlGe5SKSmp0ZS0u388i2yGxO7u9oi6HFhK/vZa6qfJSHP5YuRkllmT6COrU6UA==@kernel.org
X-Gm-Message-State: AOJu0Ywgcgickd3z7p76o/ttai+s/vu0LSghTNx5ds70Ty/eYqrKiZ6a
	RPJDPo2yoTzbaW2pARBfxnVoljKqo3zfqJW3cw3WoHJQqukBhQNmxxn2/Y535rtYJCpyJDJRd/j
	aAIlL9W/vNgmcM0+xNrWvNJZ4Z6mXVFo=
X-Gm-Gg: ASbGncvgaOxV0qFeXwzIFasGU/qsKxCkD7vRae0sXkM55bxCLuGv5CevvJ1+ibI6/uF
	PJRUUaavnKCCCvowg0qNrhMss8SZLwdYiSyU9hUDsUHx3bpdGs25g3HTHEid8LLEZvv4dvs3qJj
	FH9jUQ0Wu4m20yIE382rwFS0VUwUcZVrIPRuZfBLfZJKnBUa/MnKiQrAgmdvLTUe84ItVkfRzC3
	HdnU19OJwgk+9VLipy2HlZ+lbYw
X-Google-Smtp-Source: AGHT+IGtJ3jgYS7oPpguD0YA6ZhtC3wC1OUit6lk2wQGBVxISV94tnsyrtpc9yPU/HqjXfGT1Y+pevkAgWHeTxVbv1c=
X-Received: by 2002:a17:906:c153:b0:b46:35c3:83fd with SMTP id
 a640c23a62f3a-b50aae96556mr314316366b.29.1759930043185; Wed, 08 Oct 2025
 06:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <87bjn6fgr6.fsf@gentoo.org> <87a52n1xvv.fsf@gentoo.org>
 <dda63a6b723d31f41e6e275ac7f38d31c6715fc8.camel@mediatek.com> <d0a06fe1-abd0-49b2-8867-6c01d6551e54@gmail.com>
In-Reply-To: <d0a06fe1-abd0-49b2-8867-6c01d6551e54@gmail.com>
From: Matteo Croce <technoboy85@gmail.com>
Date: Wed, 8 Oct 2025 15:26:46 +0200
X-Gm-Features: AS18NWDmEhUMBJE36cywPVgrOf9iPqSdrOLBHTFGScvseC-Phs7Q7qbvrnVFBg0
Message-ID: <CAFnufp2pbBtNnVrEpxbkKzA5JhRFRiD-7Vd8ss9fLbYW39Jqgg@mail.gmail.com>
Subject: Re: Regression in linux-firmware-20250917 for mt7921e driver
To: =?UTF-8?B?QWxsYW4gV2FuZyAo546L5a625YGJKQ==?= <Allan.Wang@mediatek.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "sam@gentoo.org" <sam@gentoo.org>, 
	=?UTF-8?B?TWluZ3llbiBIc2llaCAo6Kyd5piO6Ku6KQ==?= <Mingyen.Hsieh@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "xiangzhedev@gmail.com" <xiangzhedev@gmail.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il giorno mer 8 ott 2025 alle ore 15:12 Matteo Croce
<technoboy85@gmail.com> ha scritto:
>
>
> On 22/09/25 10:24, Allan Wang (=E7=8E=8B=E5=AE=B6=E5=81=89) wrote:
> > Hi Sam,
> >
> > Would you please try "insmod mt7921_common disable_clc=3D1"
> > to help us clarifying this issue ?
>
> I confirm that disable_clc=3D1 fixes the issue:
>
>

Looking at the code seems regulatory stuff to handle the power
depending on the country.
Am I right?

Regards,
--=20
Matteo Croce

perl -e 'for($t=3D0;;$t++){print chr($t*($t>>8|$t>>13)&255)}' |aplay
