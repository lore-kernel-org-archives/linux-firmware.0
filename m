Return-Path: <SRS0=fgsX=RH=antheas.dev=lkml@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E86CFD2FD
	for <linux-firmware@archiver.kernel.org>; Fri, 11 Oct 2024 09:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1AB57C4CECD; Fri, 11 Oct 2024 09:27:38 +0000 (UTC)
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BC5E4C4CECC
	for <linux-firmware@kernel.org>; Fri, 11 Oct 2024 09:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BC5E4C4CECC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id B6E6F2E06422
	for <linux-firmware@kernel.org>; Fri, 11 Oct 2024 12:27:30 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1728638851;
	bh=jtFGKNIzGadbY+fMcqiz9+lmJkab4JirZXfXhpDeEeA=;
	h=Received:From:Subject:To;
	b=YuUdGe32czXReeuwzO/6W59qBUIqJAp3uZAhiq0wbc3DEdY9O1GGYx0mfSxGZAfrG
	 DXnaGg8qygarFeh+HuFq+nQEi9C0VOsYm7VoYyrNcSvVqhR6jFBzYEXs152eVKhV/w
	 9i5w4OQIsLWOrgyiHJ5nHR5CywtS9OsJ9Re/jSHc=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.178) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f178.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2facf40737eso19490131fa.0
        for <linux-firmware@kernel.org>; Fri, 11 Oct 2024 02:27:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV4UvdI6MsXKpnPm4YzbSdy94aQiNA6/amQGWr0QSEJuq+5r0RByIf2Nn4+jtFY2l+8fEJ7P2fP1I1cpbcvdQ==@kernel.org
X-Gm-Message-State: AOJu0YxAwRYmRCmiMIF/+lJXtuwUSQwZQdWj/ZyIiX9+lQdieW6wCVDv
	TuzPWjhd/0ac6rnQ9odpolwjv0kUpZ6+CdysjmJ2fuEwf/kKHUmU0jrxJpPPgRtZn5WUCM/+/dp
	7zPS6d4XE6mEw4tA/lPrrhp9vRP0=
X-Google-Smtp-Source: 
 AGHT+IGe3xGQhI5+GSXPvZkD0ma5zB2KWDcPOelqrciJvqfEZR+gZTxy2f3HSHHBBl9PKy6oIFuNtwSJktF4HT9k0GQ=
X-Received: by 2002:a2e:b893:0:b0:2fa:cac0:2a14 with SMTP id
 38308e7fff4ca-2fb32721641mr9519631fa.11.1728638849822; Fri, 11 Oct 2024
 02:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <20241009101807.1473-1-shenghao-ding@ti.com>
 <d1941b10-0549-4a0e-a3fe-a8d7c50c175b@gmail.com>
 <7e138a1c8b6d4ace8c759bb2266216da@ti.com>
 <3ef8a82f-5e71-4386-90e1-f34222a60bdf@gmail.com>
 <50daaa7a-d590-4ae5-b33f-8f51d0c2f457@gmail.com>
 <3dbebac5b8404d3082a45cbe5610471f@ti.com>
In-Reply-To: <3dbebac5b8404d3082a45cbe5610471f@ti.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Fri, 11 Oct 2024 11:27:18 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwG20mHn03bW94ERkSEjLuScx+tAL8qWL2sXJDv1wH=FHA@mail.gmail.com>
Message-ID: 
 <CAGwozwG20mHn03bW94ERkSEjLuScx+tAL8qWL2sXJDv1wH=FHA@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [PATCH v1] Upload dsp firmware for ASUS laptop
 1EB30 & 1EB31 and Update WHENCE for both
To: "Ding, Shenghao" <shenghao-ding@ti.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Mario Limonciello <superm1@gmail.com>, linux-firmware@kernel.org,
	"Xu, Baojun" <baojun.xu@ti.com>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 13916275206@139.com,
	Roman Gilg <romangg@manjaro.org>, linux-sound@vger.kernel.org,
	"Chen, Robin" <robinchen@ti.com>, open list <linux-kernel@vger.kernel.org>,
 "Yi, Ken" <k-yi@ti.com>,
	Philip Muller <philm@manjaro.org>, Jonathan LoBue <jlobue10@gmail.com>,
 Luke Jones <luke@ljones.dev>
Content-Type: multipart/alternative; boundary="00000000000096c2b40624301862"
X-PPP-Message-ID: 
 <172863885140.31462.15487035505849140671@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

--00000000000096c2b40624301862
Content-Type: text/plain; charset="UTF-8"

Hi Shenghao,

Mario merged your patch manually yesterday so you don't need to do
anything. Thanks for helping

Seems my phone does not have a text only mode so lore will complain again.
Oh well

On Fri, Oct 11, 2024, 11:23 Ding, Shenghao <shenghao-ding@ti.com> wrote:

> Hi Mario
> Thanks for your support. Finally "make check" works, following is the log.
>
> root@LAPTOP-70RJ5B8Q:/usr/local/src/fw_new# make check
>  Check that executables have
> shebangs.....................................Passed
>  Forbid new
> submodules....................................................Passed
>  Check
> Yaml...............................................................Passed
>  Check for broken symlinks............................(no files to
> check)Skipped
>  Detect Destroyed
> Symlinks................................................Passed
>
>  shellcheck...............................................................Passed
>
>  black....................................................................Passed
>
>  markdownlint............................................................Skipped
>  Check
> whence.............................................................Passed
>  root@LAPTOP-70RJ5B8Q:/usr/local/src/fw_new#
>
> > On 10/10/24 08:30, Mario Limonciello wrote:
> > >> Although TAS2XXX1EB30.bin and TAS2XXX1EB31.bin are both in
> > >> ti/tas2781, yet it reported "does not exist".
> > >> I have no idea why the file is there while report "does not exist".
> > >> After I removed the newly-merged, no such report.
> > >
> > > I think you forgot to git add them to the commit?
> > >
> > >>
> ................................
> > I'll merge this and if you have any follow ups you can do them on top as
> future
> > MR (preferred!) or patches to M/L.
>
> It seemed that I was not used to submitting patch via gitlab.
> So, finally I have to submit the patch to the git.kernel.com
> I'll try submitting next firmware binary file via Gitlab. Thanks.
>
> >
> > Thanks!
>
>

--00000000000096c2b40624301862
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto"><p dir=3D"ltr">Hi Shenghao,</p>
<p dir=3D"ltr">Mario merged your patch manually yesterday so you don&#39;t =
need to do anything. Thanks for helping</p><p dir=3D"ltr">Seems my phone do=
es not have a text only mode so lore will complain again. Oh well</p></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri=
, Oct 11, 2024, 11:23 Ding, Shenghao &lt;<a href=3D"mailto:shenghao-ding@ti=
.com" target=3D"_blank" rel=3D"noreferrer">shenghao-ding@ti.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">Hi Mario<br>
Thanks for your support. Finally &quot;make check&quot; works, following is=
 the log.<br>
<br>
root@LAPTOP-70RJ5B8Q:/usr/local/src/fw_new# make check<br>
=C2=A0Check that executables have shebangs.................................=
....Passed<br>
=C2=A0Forbid new submodules................................................=
....Passed<br>
=C2=A0Check Yaml...........................................................=
....Passed<br>
=C2=A0Check for broken symlinks............................(no files to che=
ck)Skipped<br>
=C2=A0Detect Destroyed Symlinks............................................=
....Passed<br>
=C2=A0shellcheck...........................................................=
....Passed<br>
=C2=A0black................................................................=
....Passed<br>
=C2=A0markdownlint.........................................................=
...Skipped<br>
=C2=A0Check whence.........................................................=
....Passed<br>
=C2=A0root@LAPTOP-70RJ5B8Q:/usr/local/src/fw_new#<br>
<br>
&gt; On 10/10/24 08:30, Mario Limonciello wrote:<br>
&gt; &gt;&gt; Although TAS2XXX1EB30.bin and TAS2XXX1EB31.bin are both in<br=
>
&gt; &gt;&gt; ti/tas2781, yet it reported &quot;does not exist&quot;.<br>
&gt; &gt;&gt; I have no idea why the file is there while report &quot;does =
not exist&quot;.<br>
&gt; &gt;&gt; After I removed the newly-merged, no such report.<br>
&gt; &gt;<br>
&gt; &gt; I think you forgot to git add them to the commit?<br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
................................<br>
&gt; I&#39;ll merge this and if you have any follow ups you can do them on =
top as future<br>
&gt; MR (preferred!) or patches to M/L.<br>
<br>
It seemed that I was not used to submitting patch via gitlab. <br>
So, finally I have to submit the patch to the <a href=3D"http://git.kernel.=
com" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">git.kernel.=
com</a><br>
I&#39;ll try submitting next firmware binary file via Gitlab. Thanks.<br>
<br>
&gt; <br>
&gt; Thanks!<br>
<br>
</blockquote></div></div>

--00000000000096c2b40624301862--
