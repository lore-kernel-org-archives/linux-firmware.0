Return-Path: <SRS0=FKq7=X7=digigram.com=debief@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0DFC433EF
	for <linux-firmware@archiver.kernel.org>; Tue, 26 Jul 2022 06:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF373C341CE; Tue, 26 Jul 2022 06:57:57 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BBC6DC341C0
	for <linux-firmware@kernel.org>; Tue, 26 Jul 2022 06:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BBC6DC341C0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=digigram.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=digigram.com
Received: by mail-oi1-f171.google.com with SMTP id r13so15789707oie.1
        for <linux-firmware@kernel.org>; Mon, 25 Jul 2022 23:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=digigram.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1zY8Nph9aehYwO3BkhcoAjd19PtQ+yK6MobeFAGM9L8=;
        b=MezDNVOqj59l4TNb9n/caa9EgTl1qesPMPg8lIDuUZxu/DfvAI6ydf0OxUVH+le3Dt
         geuPjE2GpLIsTiMEFAWgW4P8ZbqEjxMDtJyOVG5gVArG+bJu2d6UpkzamtQYXolVuNVK
         SSv0IbDXwE2FFsGL8nrk+dsdFabvsLKFp/Rmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1zY8Nph9aehYwO3BkhcoAjd19PtQ+yK6MobeFAGM9L8=;
        b=vNAN67WpOZ9xP+sFtP6LjROGJ/LEI0mfZZTtOG0JXGPyGsVPPIfBkFPbMknkdyhcbf
         Vez5AFuluoaM0Cj/SK7ETcD/DCtkZ3v0ub+sAkkoBqHETmbyyoKrFp84nk62xPJZtK4L
         2eo3Xz7ScpqIZKkakBPYkMYA7vfkThehWIN2MOO+s1rAy6eRpDoDedQTe/ejVTeTrH7a
         j8RRBKEtD5B4cTWJ45pMTykC+hDuT/q5YkUYnGOIOxvnRd1dZvoykBMp03HSiXyaz2BQ
         vdTQyAqrl2kCU6X+6cPkGFkHaj637ticsFnky/KeKx2CBQaCyEOle5LPdEW4SVEH+ydp
         DZKA==
X-Gm-Message-State: AJIora9Jty8P1k+ADZ5YjAD7VzXH6htxn7RVa2FP2c0It9SJ0zwW3dZk
	NXEjnsswvtdlt7RuuZlVTUK3TNJn8brrtck+BxCdEg==
X-Google-Smtp-Source: AGRyM1uhxDP2S6qKMmcShaY2M7sZIMfmXy5zYvjL/CBbQDTTxpDspfjPfflRyS2Jjb1QP0bu7A2Kj7720MPDDCkF/Ko=
X-Received: by 2002:a05:6808:1202:b0:2f9:c7b4:fd56 with SMTP id
 a2-20020a056808120200b002f9c7b4fd56mr7139844oil.55.1658818675473; Mon, 25 Jul
 2022 23:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAHrc+6k2hy20_3yrTGBsp9n3c2t0wkZymd1e+EiU_R_R3phD4g@mail.gmail.com>
 <CA+5PVA47kz3y=xCsnsQdj8XeJV+HaKPRVSOnan6BWSwfABQ_dw@mail.gmail.com>
In-Reply-To: <CA+5PVA47kz3y=xCsnsQdj8XeJV+HaKPRVSOnan6BWSwfABQ_dw@mail.gmail.com>
From: Eric Debief <debief@digigram.com>
Date: Tue, 26 Jul 2022 08:57:40 +0200
Message-ID: <CALYqZ9mo_naXWaR-+vKRCQNA_YN3d-znNVwwSqnLfoPiFz8G5g@mail.gmail.com>
Subject: Re: New pull request?
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: =?UTF-8?B?TG/Dr2MgQm9pc3N5?= <boissy@digigram.com>, 
	Linux Firmware <linux-firmware@kernel.org>, Yoann Lubiato <lubiato@digigram.com>
Content-Type: multipart/alternative; boundary="000000000000e618ef05e4afd12a"

--000000000000e618ef05e4afd12a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Josh,

Thanks for your quick reply and your help.
We will follow your advice.

Could we come back to you if we have any questions ?

Best regards,
Eric.


Le lun. 25 juil. 2022 =C3=A0 20:23, Josh Boyer <jwboyer@kernel.org> a =C3=
=A9crit :

> On Thu, Jul 21, 2022 at 4:23 AM Lo=C3=AFc Boissy <boissy@digigram.com> wr=
ote:
> >
> > Hello,
> > I am Lo=C3=AFc BOISSY. I work for Digigram company in France.
> > Digigram is an audio card manufacturer for professional customers.
> >
> > Our old cards used specific firmware files.
> > These files were provided by the alsa-firmware package.
> > But it seems that this package is now deprecated and replaced by
> linux-firmware package.
> > Do you confirm that?
>
> Generally speaking, new firmware that is used by drivers in the Linux
> kernel would be added to the linux-firmware project under a license
> that permits redistribution.
>
> The alsa-firmware package still exists for some old cards and that
> firmware hasn't been migrated to the linux-firmware repo.
>
> > If yes, How can we push our firmwares files? Just by sending them to yo=
u?
>
> If they are net new firmware files, you can follow the README file for
> the project to send new submissions:
>
>
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.g=
it/tree/README
>
> A pull request from a GitHub or Gitlab style git forge is also acceptable=
.
>
> josh
>

--000000000000e618ef05e4afd12a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Josh,</div><div><br></div><div>Thanks for your qui=
ck reply and your help.</div><div>We will follow your advice.</div><div><br=
></div><div>Could we come back to you if we have any questions ?</div><div>=
<br></div><div>Best regards,</div><div>Eric.<br></div><div><br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=
=A0lun. 25 juil. 2022 =C3=A0=C2=A020:23, Josh Boyer &lt;<a href=3D"mailto:j=
wboyer@kernel.org">jwboyer@kernel.org</a>&gt; a =C3=A9crit=C2=A0:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Jul 21, 2022 at 4=
:23 AM Lo=C3=AFc Boissy &lt;<a href=3D"mailto:boissy@digigram.com" target=
=3D"_blank">boissy@digigram.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello,<br>
&gt; I am Lo=C3=AFc BOISSY. I work for Digigram company in France.<br>
&gt; Digigram is an audio card manufacturer for professional customers.<br>
&gt;<br>
&gt; Our old cards used specific firmware files.<br>
&gt; These files were provided by the alsa-firmware package.<br>
&gt; But it seems that this package is now deprecated and replaced by linux=
-firmware package.<br>
&gt; Do you confirm that?<br>
<br>
Generally speaking, new firmware that is used by drivers in the Linux<br>
kernel would be added to the linux-firmware project under a license<br>
that permits redistribution.<br>
<br>
The alsa-firmware package still exists for some old cards and that<br>
firmware hasn&#39;t been migrated to the linux-firmware repo.<br>
<br>
&gt; If yes, How can we push our firmwares files? Just by sending them to y=
ou?<br>
<br>
If they are net new firmware files, you can follow the README file for<br>
the project to send new submissions:<br>
<br>
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-f=
irmware.git/tree/README" rel=3D"noreferrer" target=3D"_blank">https://git.k=
ernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/README<=
/a><br>
<br>
A pull request from a GitHub or Gitlab style git forge is also acceptable.<=
br>
<br>
josh<br>
</blockquote></div>

--000000000000e618ef05e4afd12a--
