Return-Path: <SRS0=CgE7=A5=lontium.corp-partner.google.com=xmzhu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EBCF55425
	for <linux-firmware@archiver.kernel.org>; Wed, 25 Feb 2026 01:13:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7777AC19423; Wed, 25 Feb 2026 01:13:13 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A0AADC116D0
	for <linux-firmware@kernel.org>; Wed, 25 Feb 2026 01:13:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A0AADC116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=lontium.corp-partner.google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lontium.corp-partner.google.com
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-662f5c5507cso4803937eaf.3
        for <linux-firmware@kernel.org>; Tue, 24 Feb 2026 17:13:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771981991; cv=none;
        d=google.com; s=arc-20240605;
        b=gcqdAdq4rjXfjuL2fwaNgbRToWe8dt0+mZ9hhe2m7BjqYnepF8cltIaaJg3rDULIdZ
         XCRoHb8z8uhvVdHiESlSaduxJEgSGFu/Y6ja37OcuVnIIIL6djok/LGJW/v3FJAnF3kx
         KDEeT/K6VlwJXk+ipGglcvGptc06b2aGQMlcNIrsRKw1MxE9jVrwxR+JC135tr7pBIub
         MBc22U175nCWvepN5W0qaj7NwRGX2sIZcI6o2C98QyWfF1tbFsw+AJrTL45RhdFdo2S/
         ZnAg25ICrYJDZd+gRtKciET6fc5XEZn3BDfYMXU/Eisz0HGaSWdgSgRr48RdR4mpUVsK
         /Kag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/joxWyyunu2bl0Kj1nyAq2w2/A21FFZeRtrgrp5Mjuc=;
        fh=mfCCRD0Rj0wS9qiw6i9f/CxdCHcDT3xSiI/eDVvPAP4=;
        b=QBvxq2VvOs2hwOR+AUl9oCSG9RblMxiwAeIiR2MFAsTDsI+KEgnhqHt11baBk37qb5
         2HY56TK/ZDRVs5If3WWGQxGpPMgg/ZwAzWjZK74NCvcLTAu8GmJLwAMANv0BHAT+N614
         hLQTokYFsLd7+fgn2wGFakgwOIC8YjBWbwbXUNpZSuULAyCQ8O5L7OAA6PNq/9uDzLzW
         jrdrHYjOtz9YupcOb7XP8dAf84DciM+XIJXRGCvz6rbrJwBNXgpsBXqqmz/bmNVjymJX
         bIw7MnPc6LOlVnuPQr4yM/n8gvXmQwyMQ8aDt7W4Y7O8k0ea2I3tAJA54vyDkrrD8tDG
         K+YA==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771981991; x=1772586791; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/joxWyyunu2bl0Kj1nyAq2w2/A21FFZeRtrgrp5Mjuc=;
        b=yv8i4PonrYGYtxVWF3iwkQeG4zX60flRaPdOJjt5KZlshUHTyovf7NozVU05cx1AbU
         KK1wuw0B1xI/vAVwX9rmRM8OuschWlYySw6S69sHZOo5tA38/eaFywyqI835URfYEl0b
         tD/iMezlIoVgc+8m8xlxG2C4/hj4taUVYFOt6tnotJRNonRfGHtaXiLyowC9PeLM/Z6i
         cy3bc3qIoQ7z4Jl4e7E8VdKIJ0K1FUqsMjmsmFbEf2HGuu/wl3rkSN7o1H42z5K03S5X
         JUb7H0coMW1cFo7cMo1TYzoJnwlZMx+KvJcFuSxHKBbJjaItujzAtcYeVVGZLsFa8YGp
         OWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771981991; x=1772586791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/joxWyyunu2bl0Kj1nyAq2w2/A21FFZeRtrgrp5Mjuc=;
        b=hKbIHPcHtT6l5Ti2iluI+BC8VbO3y2r6RZ60CylnPMir+cGnIOUDdEGh09IvTK0AZZ
         Vq/+uCFQAllyzn7+9sSa5lV9iuOlGZlA4BN+rHLxFJokFbELUp68Uwbfq1fYHdhSsaZx
         1NWEBUpDyQf5e10Dm5O7xhxS7po+jhTyJLKWtWqtBzKNHi58kmW59PpMGPpb14lyvldX
         NojkSzbMY/5Q5DI06QMS7M0kTVmoU32EQxMOBTY63/lMDdI5GEGgI8WbQ6CQkOhVgRkS
         z87gQaNIm1cQGpPP3oF2/6pSaK9k7qY4BWjMfaoj10JBZ8TfKA28b9RA1WEvOo732Yaq
         YxkA==
X-Forwarded-Encrypted: i=1; AJvYcCVlTCq2ZoWpAw1YpxRciGiARTnIIsVzOntDMak+zlS0TY7JzXkCywJ3reFDFvesDRVz5yZgWZgTWLtws8xIMg==@kernel.org
X-Gm-Message-State: AOJu0Yw6wwdWiUjJ155+bpAO++mdiB7qpzRRhkLVH614sVbw5ZbmMhNu
	Bbqpi8ztPj9xvcmNa+uh9rckGGlMKQDedCoL61Mhi9g03yVHPfHvOsexd0JYLXbhqv+qi/Q7zxG
	zpVSlhsGh6wk2XKAJclFghsraMTN17pa1i6I//KxV+z4=
X-Gm-Gg: AZuq6aJKr7kVVWBwQ4x22mmqz5QLwwge8iIIum6Lmj3L2TINI9P9dF/BlAnKV4BLxDZ
	EXWobnvrg0z36L48sMne6JHFPMVdLPfU8Kfq/pa2fM3cleo4tvVlw3c44HM+9+kqtMAFZ0Pi5my
	RTBSpAOHYVvqfhsddPeFTfzNoVbSrUyzWzrjfw1foPrvZ8CDzCYjTq/6sF8QQ+9oOazUkQWPSqp
	QJLH1ehx8zDtPbHnZfpN8GPeu5ueRaQeB47mjDq7ReAyV/bB6PP8jjSJw4hhtqenrVaAaLRMiHS
	c4Qffg==
X-Received: by 2002:a05:6820:1899:b0:65f:1012:69c5 with SMTP id
 006d021491bc7-679c46222d3mr8009519eaf.76.1771981991361; Tue, 24 Feb 2026
 17:13:11 -0800 (PST)
MIME-Version: 1.0
References: <20260224-lt8713sx_firmware-v2-1-8aa80156b88b@oss.qualcomm.com> <vfhlpudqtpwaccavyjgqhqb4grl7vxdkzdyp4xwzafvujak72d@mfeczqa5h4iy>
In-Reply-To: <vfhlpudqtpwaccavyjgqhqb4grl7vxdkzdyp4xwzafvujak72d@mfeczqa5h4iy>
From: Simon Zhu <xmzhu@lontium.corp-partner.google.com>
Date: Wed, 25 Feb 2026 09:12:59 +0800
X-Gm-Features: AaiRm51jzOMgoHjVWQVlRx6DKCjt1S5kjScfgRMiIepTs7UGx0-kP6JNfsE0VGo
Message-ID: <CAC7NNnoYY1=NbdomzEH=ajiBO7XikeNmR3D3LCSVZsAPxEkr_Q@mail.gmail.com>
Subject: Re: [PATCH v2] linux-firmware: add firmware for Lontium LT8713SX DP hub
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Vishnu Saini <vishnu.saini@oss.qualcomm.com>, linux-firmware@kernel.org, 
	Tony <syyang@lontium.com>, prahlad.valluru@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026 at 2:33=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Feb 24, 2026 at 11:42:49PM +0530, Vishnu Saini wrote:
> > Add firmware V667 provided by Lontium themselves.
> >
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > Cc: =E6=9C=B1=E6=99=93=E6=98=8E <xmzhu@lontium.corp-partner.google.com>
> > ---
> > This patch adds LT8713SX firmware provided by Lontium.
> > ---
> > Changes in v2:
> > - Added Lontium in Cc to confirm License and binary version
>
> It doesn't confirm anything. An email from Lontium will confirm it.
>

This firmware was provided by Lontium for our partners to use.

> > - Link to v1: https://lore.kernel.org/r/20260217-lt8713sx_firmware-v1-1=
-f78b85fceb63@oss.qualcomm.com
> > ---
> >  WHENCE          |   8 ++++++++
> >  lt8713sx_fw.bin | Bin 0 -> 145976 bytes
> >  2 files changed, 8 insertions(+)
>
> --
> With best wishes
> Dmitry
