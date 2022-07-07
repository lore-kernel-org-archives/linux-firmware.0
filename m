Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9654FC433EF
	for <linux-firmware@archiver.kernel.org>; Thu,  7 Jul 2022 17:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 537B6C341D0; Thu,  7 Jul 2022 17:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E0B9C341D2
	for <linux-firmware@kernel.org>; Thu,  7 Jul 2022 17:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657215639;
	bh=uTBsp+nZRmEC10umshDOaUzA0yEQMiqZCnaP4V6mJeQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=THVZGjSTn4Yg2eTetUBiKQ7hRw3peA4qpkSoofgFub+vHJMmSpVtf/HG2SOM1NTQN
	 ZyMp+s+JmZq4yU15VaGjeV0n+7N3wSd9PHFzujojYpLJHLnQRT1xfauvFJHba2vCt5
	 VCKpmwDgjBsLdeL+j5OVo6Rgfc79fCIKLMjzfG0v8k35IAqCfaO95hF4Pe20Pp8lLH
	 jqzZDPzPhxwUBKG+F+EBJmirwcQqtXgj4Arla+mfA7bLo5jtunUpWFhYP94ZG759GB
	 gxUyfYNPw3UkgjZdnw9gYyKFmD4tVYbtXo6dIgWrr2PPv2Ty+E1dZzd5f63zPyUC2K
	 n18Rswr9UIXmA==
Received: by mail-il1-f175.google.com with SMTP id h16so3484030ila.2
        for <linux-firmware@kernel.org>; Thu, 07 Jul 2022 10:40:39 -0700 (PDT)
X-Gm-Message-State: AJIora+IyTP4Yhf2NbWKM5pH2yvoDN1K5vEsUaVG3G00C8wB5RAgAdzv
	n/N/FtVjD+lMnASikrH9Vi4Zunan9WQOPlsT+tM=
X-Google-Smtp-Source: AGRyM1s7nq6cQEa0iTdmAfWgf5pwnXQEUhv8xYn3//CX4Oao0L/tYBc2qN4I2LyHaVpofYmj6eR/gZ3kfqZt2UWEyfM=
X-Received: by 2002:a05:6e02:1b8c:b0:2dc:557c:5fbb with SMTP id
 h12-20020a056e021b8c00b002dc557c5fbbmr105631ili.218.1657215638325; Thu, 07
 Jul 2022 10:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220221163754.150011-1-Jerome.Pouiller@silabs.com>
 <20220221163754.150011-3-Jerome.Pouiller@silabs.com> <cb49da01-584a-bb71-eecb-c54e40bce062@demerara.io>
In-Reply-To: <cb49da01-584a-bb71-eecb-c54e40bce062@demerara.io>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 7 Jul 2022 13:40:27 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7F7-5GY=YE9rSL0ZYkAtiG+mi-gGyq6=65fpvBiqpe6Q@mail.gmail.com>
Message-ID: <CA+5PVA7F7-5GY=YE9rSL0ZYkAtiG+mi-gGyq6=65fpvBiqpe6Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] wfx: add antenna configuration files
To: ben@demerara.io
List-Id: <linux-firmware.lore.kernel.org>
Cc: Jerome Pouiller <Jerome.Pouiller@silabs.com>, 
	Linux Wireless <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@codeaurora.org>, 
	Linux Firmware <linux-firmware@kernel.org>, devel@driverdev.osuosl.org, 
	netdev <netdev@vger.kernel.org>, 
	"Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, jerome.pouiller@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 7, 2022 at 1:04 PM Ben Brown <ben@demerara.io> wrote:
>
> On 21/02/2022 16:37, Jerome Pouiller wrote:
> > From: J=C3=A9r=C3=B4me Pouiller <jerome.pouiller@silabs.com>
> <snip>
> > diff --git a/WHENCE b/WHENCE
> > index 0a6cb15..96f67f7 100644
> > --- a/WHENCE
> > +++ b/WHENCE
> > @@ -5845,8 +5845,18 @@ Driver: wfx - Silicon Labs Wi-Fi Transceiver
> >  File: wfx/wfm_wf200_C0.sec
> >  Version: 3.12.1
> >
> > +File: wfx/brd4001a.pds not listed in WHENCE
> > +File: wfx/brd8022a.pds not listed in WHENCE
> > +File: wfx/brd8023a.pds not listed in WHENCE
>
> This format does not appear to be correct. While this will seemingly
> pass the `check_whence.py` check, it will be completely ignored by
> `copy-firmware.sh`, as that takes the full line after 'File: ' (e.g.
> 'wfx/brd4001a.pds not listed in WHENCE', which of course does not exist).

Oh, indeed.

> I'm assuming the trailing ' not listed in WHENCE' needs to be removed
> from each of these lines. Otherwise these are likely not being picked up
> by distros (they are missing from Arch, for example). This may have been
> the intention, but that seems odd (and unclear if so).

I doubt that was the intention.  I'll correct WHENCE in a separate
commit.  Thank you for reporting the issue.

josh
