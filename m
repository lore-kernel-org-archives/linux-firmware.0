Return-Path: <SRS0=H+fp=YE=gmail.com=jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2672DC3DA6D
	for <linux-firmware@archiver.kernel.org>; Tue, 20 May 2025 12:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E3E38C4CEEA; Tue, 20 May 2025 12:45:38 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 06692C4CEE9
	for <linux-firmware@kernel.org>; Tue, 20 May 2025 12:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 06692C4CEE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7082ad1355bso48283807b3.1
        for <linux-firmware@kernel.org>; Tue, 20 May 2025 05:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745137; x=1748349937; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wx3ZB5Q+eKZwUv3Wg8k+o43YgEhHtEg0wFo4k8doHWQ=;
        b=Vi3FEO95TZgxWXEr62PLwxHj3nx75hx7/7UU77DtgEQOB/D3haCtIJgXwYyd1sU7qy
         kreGAP93WvpMRlbVD+D+XS4PcFcJkrhUflUyeKwcdRb0ylt9N4Wz7Dfkv00y20Tzock4
         zBe/cIXEf2AX4iRKLzYm2HfL20vbY/aRc5wMiZAl72NMi2U0zG3brttlK/sPp6ax4/Yc
         5fVdXAJejjEO/VrDRNjunYySIKKexck9EEJ4NAE6XWr+/v2SYx485ivKo3WxOdSpaKKe
         CD4CQXZMmaxwiFrn2B4deFZS65gLjJ0h9KwqQexLiOv//uxKlc6fjxyLn5TXd5bCxymZ
         oQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745137; x=1748349937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wx3ZB5Q+eKZwUv3Wg8k+o43YgEhHtEg0wFo4k8doHWQ=;
        b=ejV6inkXJKpHoYyBai3WHD1CXzdMzZ/oFNbs3Q7Z2seXA/velKCqaF6rKsLVHy9d9N
         N9Z/OhcOsIz7PhjYyExKmaShJwQSYbf4Yx8O9zmfyM9GXf9bmXFOyvXfddsBt9OkUzzT
         2xN5RCOxxsR6xeAEJ2N0XBO7PKK7StxkXL+LNgeXhccUcuvIwkd9pyMu1w4ZgWTN5909
         jF4HyhwIpRLXKDhqwAZFl2dMr4aiV0ShJrnFwnji9hlpO2bNPv8NWnMYciEpSKhF4X45
         oI8LZ1DvS4OGQEzlL4LwPXhekWR441ZJ2c3F2NNkMW4U953N5PccFTrBHxZQfWLmor/h
         8G6w==
X-Forwarded-Encrypted: i=1; AJvYcCU+U+QMtjSdzXDTqayqau8gZVanABn9aNV4w1vFyNduDnHcLzxCGUNq2NTCpLDVABZC5u3APLocCeS9HMCQFQ==@kernel.org
X-Gm-Message-State: AOJu0YzG745U3SZWfu7i1OgIc0LeiQ5+gTbHg/jr93PXA0MyvNQjyLzo
	lvG1y35hwCTsuGL+dmwN3+PjR6LA/Kb1jTPxhgGHtk5gUNVuidmDG7rrozs99pySrXJbB3WveRm
	/cva6fAHG919Dn3tUS28eGgHsiNdhQaagzOlU
X-Gm-Gg: ASbGnctPZ+QtPji1o4t/j8w6p4Py4UCPbEunrYvofCDsfBGtlazde8H8i+D/Sy3Mkg0
	LC5CejK6JfHs/494DZUSwAph/cTLBI8b4WbUAOHM1zeiGQGyELVDCzXVu2wlorz/P3JQMbsYiJb
	UDh8oGAzRAcqdX5wW34HOFIuOo+sYe4JlcdR3UikXOhg==
X-Google-Smtp-Source: AGHT+IFIkc4OB9ifmuA5PbekOzgNTfccWlHOTUKuSbdKmtO9rM/4AYPvGXov3JgI/yrlxmpnn1tVQ3/E7LnJmdOfYS0=
X-Received: by 2002:a05:690c:7093:b0:703:b30d:3e2b with SMTP id
 00721157ae682-70ca79f0c80mr264999947b3.20.1747745136800; Tue, 20 May 2025
 05:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250519081835.25562-1-nas.chung@chipsnmedia.com>
 <4fs3jqwf6hk6cqaiipbuwwe2u5dcdijig23hlqeiqjh27kmyug@ptxv6u4jqjfq>
 <SL2P216MB1246D2BCF13E83FA41282141FB9FA@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <6xhadxewl3l6ryqs3noeoo3rh3gugxuwt5fsrlxcd3c67rypzn@tvrpe3u7k6gh>
In-Reply-To: <6xhadxewl3l6ryqs3noeoo3rh3gugxuwt5fsrlxcd3c67rypzn@tvrpe3u7k6gh>
From: Josh Boyer <jwboyer@gmail.com>
Date: Tue, 20 May 2025 08:45:24 -0400
X-Gm-Features: AX0GCFuhMljWE5WFDD5f-o1pVR6a622QWf6W0Y2Q4E0qSEHV0brImWu4zXHU4qY
Message-ID: <CA+5PVA72xPebzoyGW15Dt5TShk0ovTar7Ji6c9PPoD76cy36ow@mail.gmail.com>
Subject: Re: [PATCH] cnm: Add Chips&Media wave633c firmware for NXP i.MX9
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Nas Chung <nas.chung@chipsnmedia.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>, 
	"jackson.lee" <jackson.lee@chipsnmedia.com>, "lafley.kim" <lafley.kim@chipsnmedia.com>, 
	"ming.qian@oss.nxp.com" <ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/555

josh

On Tue, May 20, 2025 at 6:49=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, May 20, 2025 at 01:07:45AM +0000, Nas Chung wrote:
> > Hi, Dmitry.
> >
> > >-----Original Message-----
> > >From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > >Sent: Monday, May 19, 2025 7:28 PM
> > >To: Nas Chung <nas.chung@chipsnmedia.com>
> > >Cc: linux-firmware@kernel.org; nicolas.dufresne@collabora.com; jackson=
.lee
> > ><jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>=
;
> > >ming.qian@oss.nxp.com
> > >Subject: Re: [PATCH] cnm: Add Chips&Media wave633c firmware for NXP i.=
MX9
> > >
> > >On Mon, May 19, 2025 at 05:18:35PM +0900, Nas Chung wrote:
> > >> Add the firmware for the Chips&Media wave633c codec IP,
> > >> which integrates both decoder and encoder functionality.
> > >> This firmware is intended for use on NXP SoCs based on
> > >> the i.MX9 architecture.
> > >>
> > >> The LICENSE.cnm file has been updated to restrict redistribution
> > >> of this firmware to NXP silicon products only.
> > >
> > >Is there any chance to change this? This make a life of Linux
> > >distributions much harder. They can not include your firmware at all,
> > >having to strip it from the _source_ packages too. A better idea might
> > >be to allow redistribution (so that distros can include it into source
> > >archive or into the CD / packages), but limit usage (as hopefully was
> > >intended).
> >
> > My intention was also to allow redistribution while restricting usage,
> > but I ended up doing both unintentionally.
> > Your suggestion exactly aligns with what I had in mind.
> >
> > Thanks a lot for your feedback !
>
> THanks a lot for the prompt response!
>
> --
> With best wishes
> Dmitry
