Return-Path: <SRS0=dEQg=RG=gmail.com=superm1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9E7CF11F5
	for <linux-firmware@archiver.kernel.org>; Thu, 10 Oct 2024 14:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94163C4CECC; Thu, 10 Oct 2024 14:07:41 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 03A10C4CEC5
	for <linux-firmware@kernel.org>; Thu, 10 Oct 2024 14:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 03A10C4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e28fd8cdfb8so827947276.3
        for <linux-firmware@kernel.org>; Thu, 10 Oct 2024 07:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728569259; x=1729174059; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j86ikakqqBkkQVWmc2iMmclpRiUqnso8T8uUY6BtFMQ=;
        b=TZu4rnjVEZUT1dUw3zwxrERgQO8K46lCzUyjRcf8u2vgaBxZF+xC3Y7Jfw+KOIVGjV
         hk1HCZ1W83LcXXyJYfs1Jh8S3mgwuaIfwDH0ysbit7nZv6TTn2JmpLnp+EM5avQ11l1M
         ZfxbGSyNrxt4h0UKTflLp+d/7axWIBjO2JxFiPqU8ZbyT3sljxqOoZ38+zRPtnm/GT46
         vuLPbJ10gdB+tm/n3aZr4zsxTV8m3aOnvIw47SNcC2FYqxkUoa75olfM/0VZ+zmBEVZD
         mc4cLrce91M/V/bjumMKjfNs7p4bB6oL/8dflZfUsujZ9wd/YJx77v2h/eeppEEAhjsQ
         iTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728569259; x=1729174059;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j86ikakqqBkkQVWmc2iMmclpRiUqnso8T8uUY6BtFMQ=;
        b=qaishpSS27vZzY4BCqBXIXGxmpC/jDcG7USbWz48gwCFHcEyoOWgXR7OQPCt7SmGMM
         GeKV7CueDC3eo5rdjeoowiqxw8z5N3zPWiD5B6aD9bAkf7JrOL3Tg88J+CWGhYQqFF3H
         wUVzIDMQ2AR/MMdlz/tDsPRO+nfFgcnOXVQgBXFSTQTMK6PsRCeRGYBFDNfFwS0BWVMF
         P14HDoMl4cSv33vixEq/m8K8l25mo79bMNwyHsaKYu6EH8MT3IMLbzkKFlIw779nf9fl
         2bbL9hLdJDpyZiwOG1NmNHmtaRa3yGKgRgJf7g90oCncoigjhIodhNkeFnWBkLlrRz83
         /xgw==
X-Forwarded-Encrypted: i=1; AJvYcCU+s+eEmEMX8IAm/MaD81XqMAw/fp1q8E7MjabJ/A+WhwBDqYqFJh5NWe7YM89UMCXjiNcE6bQXr369oedBWg==@kernel.org
X-Gm-Message-State: AOJu0YyKP4wGJkMneyTL5UKUf8JUDT0DVpbRN3JzUR1ggOVoWjgCMSJK
	F/opE51440N1LsOEm3o7fpslKZ8ya++duNIlEk6/5DUcmB4PvG23hsF9+ne/c4UNDuSgJzi9OXX
	HjzF1cuc3o4mpt4kSRLY4ENbNfVkZefYvmzIsTQ==
X-Google-Smtp-Source: AGHT+IF5QKXCiXQOj4/AIbuE5R3dWXIYCwpcloLJuvI+sEgJG9CkwbYFvmUMdpcNbPozBK2C4TDhvJzQIllw9tSq9hY=
X-Received: by 2002:a05:6902:1aca:b0:e29:492:72ef with SMTP id
 3f1490d57ef6-e29049278ccmr4213864276.20.1728569258751; Thu, 10 Oct 2024
 07:07:38 -0700 (PDT)
MIME-Version: 1.0
References: <20241009101807.1473-1-shenghao-ding@ti.com> <d1941b10-0549-4a0e-a3fe-a8d7c50c175b@gmail.com>
 <7e138a1c8b6d4ace8c759bb2266216da@ti.com> <3ef8a82f-5e71-4386-90e1-f34222a60bdf@gmail.com>
 <50daaa7a-d590-4ae5-b33f-8f51d0c2f457@gmail.com> <CAGwozwFAK_8HVgfNok_6jcsNq2OVdNzTc+KotxF0vhPd+PJTHQ@mail.gmail.com>
In-Reply-To: <CAGwozwFAK_8HVgfNok_6jcsNq2OVdNzTc+KotxF0vhPd+PJTHQ@mail.gmail.com>
From: Mario Limonciello <superm1@gmail.com>
Date: Thu, 10 Oct 2024 09:07:26 -0500
Message-ID: <CA+EcB1NF3D+KT_iBUWfYGzW_OTrHUeVp6Pa-cZey=RA+eycgVg@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [PATCH v1] Upload dsp firmware for ASUS laptop
 1EB30 & 1EB31 and Update WHENCE for both
To: Antheas Kapenekakis <antheas.dk@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "Ding, Shenghao" <shenghao-ding@ti.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Xu, Baojun" <baojun.xu@ti.com>, 
	"derekjohn.clark@gmail.com" <derekjohn.clark@gmail.com>, "13916275206@139.com" <13916275206@139.com>, 
	"romangg@manjaro.org" <romangg@manjaro.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, "Chen, Robin" <robinchen@ti.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Yi, Ken" <k-yi@ti.com>, 
	"philm@manjaro.org" <philm@manjaro.org>, "jlobue10@gmail.com" <jlobue10@gmail.com>, 
	"luke@ljones.dev" <luke@ljones.dev>
Content-Type: multipart/alternative; boundary="000000000000a3411e06241fe47f"

--000000000000a3411e06241fe47f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OK, can you please make sure I got it right?

Add a link from TAS2XXX1EB3.bin -> ti/tas2781/TAS2XXX1EB30.bin (!318) =C2=
=B7
Merge requests =C2=B7 kernel-firmware / Linux Firmware =C2=B7 GitLab
<https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/318>

On Thu, Oct 10, 2024 at 8:52=E2=80=AFAM Antheas Kapenekakis <antheas.dk@gma=
il.com>
wrote:

> Hi Mario,
> as I am not logged in, kindly close
> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/272
>
> Then, while consulting it and
>
> https://gitlab.com/kernel-firmware/linux-firmware/-/commit/d65613ab8c480d=
ec6d63733d3286451aa8b3795f
> , modify the whence so that 1EB3 points to 1EB30.
>
> Otherwise, your merge will not work with the current TAS driver, and
> we will have to do a second round of workarounds while it is the case.
> We have had that symlink for over 3 months now, and as Chen said,
> while not ideal, it will do for the time being.
>
> You may add me as suggested-by using my lkml email signature
>
> Antheas
>
> On Thu, 10 Oct 2024 at 15:39, Mario Limonciello <superm1@gmail.com> wrote=
:
> >
> >
> >
> > On 10/10/24 08:30, Mario Limonciello wrote:
> > >> Although TAS2XXX1EB30.bin and TAS2XXX1EB31.bin are both in ti/tas278=
1,
> > >> yet it reported "does not exist".
> > >> I have no idea why the file is there while report "does not exist".
> > >> After I removed the newly-merged, no such report.
> > >
> > > I think you forgot to git add them to the commit?
> > >
> > >>
> > >> Following is the log.
> > >>
> > >> root@LAPTOP-70RJ5B8Q:/usr/local/src/fw_new# make check
> > >> Check that executables have
> > >> shebangs.....................................Passed
> > >> Forbid new
> > >> submodules....................................................Passed
> > >> Check
> > >>
> Yaml...............................................................Passed
> > >> Check for broken symlinks............................(no files to
> > >> check)Skipped
> > >> Detect Destroyed
> > >> Symlinks................................................Passed
> > >>
> shellcheck...............................................................=
Passed
> > >>
> black....................................................................=
Passed
> > >>
> markdownlint.............................................................=
Failed
> > >> - hook id: markdownlint
> > >> - exit code: 1
> > >>
> > >> internal/modules/cjs/loader.js:818
> > >>    throw err;
> > >>    ^
> > >>
> > >> Error: Cannot find module 'node:fs'
> > >> Require stack:
> > >> - /root/.cache/pre-commit/repoxl59c0uz/node_env-system/lib/
> > >> node_modules/markdownlint-cli/markdownlint.js
> > >>      at Function.Module._resolveFilename (internal/modules/cjs/
> > >> loader.js:815:15)
> > >>      at Function.Module._load (internal/modules/cjs/loader.js:667:27=
)
> > >>      at Module.require (internal/modules/cjs/loader.js:887:19)
> > >>      at require (internal/modules/cjs/helpers.js:85:18)
> > >>      at Object.<anonymous> (/root/.cache/pre-commit/repoxl59c0uz/
> > >>
> node_env-system/lib/node_modules/markdownlint-cli/markdownlint.js:5:12)
> > >>      at Module._compile (internal/modules/cjs/loader.js:999:30)
> > >>      at Object.Module._extensions..js (internal/modules/cjs/
> > >> loader.js:1027:10)
> > >>      at Module.load (internal/modules/cjs/loader.js:863:32)
> > >>      at Function.Module._load (internal/modules/cjs/loader.js:708:14=
)
> > >>      at Function.executeUserEntryPoint [as runMain] (internal/module=
s/
> > >> run_main.js:60:12) {
> > >>    code: 'MODULE_NOT_FOUND',
> > >>    requireStack: [
> > >>      '/root/.cache/pre-commit/repoxl59c0uz/node_env-system/lib/
> > >> node_modules/markdownlint-cli/markdownlint.js'
> > >>    ]
> > >> }
> > >>
> > >
> > > This looks like you're missing some dependencie on you system for
> > > markdownlint. You need nodejs v18.
> > >
> > > If you can't install this you can skip this check when you commit by
> > > adding "SKIP=3Dmarkdownlint" to your environment while running 'git
> commit'.
> > >
> > >> Check
> > >>
> whence.............................................................Failed
> > >> - hook id: check-whence
> > >> - exit code: 1
> > >>
> > >> E: ti/tas2781/TAS2XXX1EB30.bin listed in WHENCE does not exist
> > >> E: ti/tas2781/TAS2XXX1EB31.bin listed in WHENCE does not exist
> > >> E: target ti/tas2781/TAS2XXX1EB30.bin of link TAS2XXX1EB30.bin in
> > >> WHENCE does not exist
> > >> E: target ti/tas2781/TAS2XXX1EB31.bin of link TAS2XXX1EB31.bin in
> > >> WHENCE does not exist
> > >>
> > >
> > > These files are missing in your commit or they have broken links.
> Double
> > > check them.
> > >
> > >> make: *** [Makefile:10: check] Error 1
> > >> root@LAPTOP-70RJ5B8Q:/usr/local/src/fw_new# ls ti/tas2781/TAS2XXX1*
> -al
> > >> -rw-r--r-- 1 root root 35220 Sep 28 21:54 ti/tas2781/TAS2XXX1EB30.bi=
n
> > >> -rw-r--r-- 1 root root 35220 Sep 28 21:55 ti/tas2781/TAS2XXX1EB31.bi=
n
> > >> root@LAPTOP-70RJ5B8Q:/usr/local/src/fw_new#
> > >>>
> > >>> Thanks,
> > >
> >
> > You know - as you've been having problems with git and at least I've go=
t
> > the intent and your S-o-b for the firmware I've taken your MR and
> > rebased/squashed it for you here:
> >
> > https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/317
> >
> > I'll merge this and if you have any follow ups you can do them on top a=
s
> > future MR (preferred!) or patches to M/L.
> >
> > Thanks!
> >
>


--=20
Mario Limonciello
superm1@gmail.com

--000000000000a3411e06241fe47f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">OK, can you please make sure I got it rig=
ht?<div><br></div><div><a href=3D"https://gitlab.com/kernel-firmware/linux-=
firmware/-/merge_requests/318">Add a link from TAS2XXX1EB3.bin -&gt; ti/tas=
2781/TAS2XXX1EB30.bin (!318) =C2=B7 Merge requests =C2=B7 kernel-firmware /=
 Linux Firmware =C2=B7 GitLab</a><br></div></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 10, 2024 at 8:=
52=E2=80=AFAM Antheas Kapenekakis &lt;<a href=3D"mailto:antheas.dk@gmail.co=
m">antheas.dk@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Hi Mario,<br>
as I am not logged in, kindly close<br>
<a href=3D"https://gitlab.com/kernel-firmware/linux-firmware/-/merge_reques=
ts/272" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/kernel-firm=
ware/linux-firmware/-/merge_requests/272</a><br>
<br>
Then, while consulting it and<br>
<a href=3D"https://gitlab.com/kernel-firmware/linux-firmware/-/commit/d6561=
3ab8c480dec6d63733d3286451aa8b3795f" rel=3D"noreferrer" target=3D"_blank">h=
ttps://gitlab.com/kernel-firmware/linux-firmware/-/commit/d65613ab8c480dec6=
d63733d3286451aa8b3795f</a><br>
, modify the whence so that 1EB3 points to 1EB30.<br>
<br>
Otherwise, your merge will not work with the current TAS driver, and<br>
we will have to do a second round of workarounds while it is the case.<br>
We have had that symlink for over 3 months now, and as Chen said,<br>
while not ideal, it will do for the time being.<br>
<br>
You may add me as suggested-by using my lkml email signature<br>
<br>
Antheas<br>
<br>
On Thu, 10 Oct 2024 at 15:39, Mario Limonciello &lt;<a href=3D"mailto:super=
m1@gmail.com" target=3D"_blank">superm1@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On 10/10/24 08:30, Mario Limonciello wrote:<br>
&gt; &gt;&gt; Although TAS2XXX1EB30.bin and TAS2XXX1EB31.bin are both in ti=
/tas2781,<br>
&gt; &gt;&gt; yet it reported &quot;does not exist&quot;.<br>
&gt; &gt;&gt; I have no idea why the file is there while report &quot;does =
not exist&quot;.<br>
&gt; &gt;&gt; After I removed the newly-merged, no such report.<br>
&gt; &gt;<br>
&gt; &gt; I think you forgot to git add them to the commit?<br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Following is the log.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; root@LAPTOP-70RJ5B8Q:/usr/local/src/fw_new# make check<br>
&gt; &gt;&gt; Check that executables have<br>
&gt; &gt;&gt; shebangs.....................................Passed<br>
&gt; &gt;&gt; Forbid new<br>
&gt; &gt;&gt; submodules...................................................=
.Passed<br>
&gt; &gt;&gt; Check<br>
&gt; &gt;&gt; Yaml.........................................................=
......Passed<br>
&gt; &gt;&gt; Check for broken symlinks............................(no file=
s to<br>
&gt; &gt;&gt; check)Skipped<br>
&gt; &gt;&gt; Detect Destroyed<br>
&gt; &gt;&gt; Symlinks................................................Passe=
d<br>
&gt; &gt;&gt; shellcheck...................................................=
............Passed<br>
&gt; &gt;&gt; black........................................................=
............Passed<br>
&gt; &gt;&gt; markdownlint.................................................=
............Failed<br>
&gt; &gt;&gt; - hook id: markdownlint<br>
&gt; &gt;&gt; - exit code: 1<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; internal/modules/cjs/loader.js:818<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 throw err;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 ^<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Error: Cannot find module &#39;node:fs&#39;<br>
&gt; &gt;&gt; Require stack:<br>
&gt; &gt;&gt; - /root/.cache/pre-commit/repoxl59c0uz/node_env-system/lib/<b=
r>
&gt; &gt;&gt; node_modules/markdownlint-cli/markdownlint.js<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 at Function.Module._resolveFilename (inte=
rnal/modules/cjs/<br>
&gt; &gt;&gt; loader.js:815:15)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 at Function.Module._load (internal/module=
s/cjs/loader.js:667:27)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 at Module.require (internal/modules/cjs/l=
oader.js:887:19)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 at require (internal/modules/cjs/helpers.=
js:85:18)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 at Object.&lt;anonymous&gt; (/root/.cache=
/pre-commit/repoxl59c0uz/<br>
&gt; &gt;&gt; node_env-system/lib/node_modules/markdownlint-cli/markdownlin=
t.js:5:12)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 at Module._compile (internal/modules/cjs/=
loader.js:999:30)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 at Object.Module._extensions..js (interna=
l/modules/cjs/<br>
&gt; &gt;&gt; loader.js:1027:10)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 at Module.load (internal/modules/cjs/load=
er.js:863:32)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 at Function.Module._load (internal/module=
s/cjs/loader.js:708:14)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 at Function.executeUserEntryPoint [as run=
Main] (internal/modules/<br>
&gt; &gt;&gt; run_main.js:60:12) {<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 code: &#39;MODULE_NOT_FOUND&#39;,<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 requireStack: [<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 &#39;/root/.cache/pre-commit/repoxl59c0uz=
/node_env-system/lib/<br>
&gt; &gt;&gt; node_modules/markdownlint-cli/markdownlint.js&#39;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 ]<br>
&gt; &gt;&gt; }<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; This looks like you&#39;re missing some dependencie on you system=
 for<br>
&gt; &gt; markdownlint. You need nodejs v18.<br>
&gt; &gt;<br>
&gt; &gt; If you can&#39;t install this you can skip this check when you co=
mmit by<br>
&gt; &gt; adding &quot;SKIP=3Dmarkdownlint&quot; to your environment while =
running &#39;git commit&#39;.<br>
&gt; &gt;<br>
&gt; &gt;&gt; Check<br>
&gt; &gt;&gt; whence.......................................................=
......Failed<br>
&gt; &gt;&gt; - hook id: check-whence<br>
&gt; &gt;&gt; - exit code: 1<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; E: ti/tas2781/TAS2XXX1EB30.bin listed in WHENCE does not exis=
t<br>
&gt; &gt;&gt; E: ti/tas2781/TAS2XXX1EB31.bin listed in WHENCE does not exis=
t<br>
&gt; &gt;&gt; E: target ti/tas2781/TAS2XXX1EB30.bin of link TAS2XXX1EB30.bi=
n in<br>
&gt; &gt;&gt; WHENCE does not exist<br>
&gt; &gt;&gt; E: target ti/tas2781/TAS2XXX1EB31.bin of link TAS2XXX1EB31.bi=
n in<br>
&gt; &gt;&gt; WHENCE does not exist<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; These files are missing in your commit or they have broken links.=
 Double<br>
&gt; &gt; check them.<br>
&gt; &gt;<br>
&gt; &gt;&gt; make: *** [Makefile:10: check] Error 1<br>
&gt; &gt;&gt; root@LAPTOP-70RJ5B8Q:/usr/local/src/fw_new# ls ti/tas2781/TAS=
2XXX1* -al<br>
&gt; &gt;&gt; -rw-r--r-- 1 root root 35220 Sep 28 21:54 ti/tas2781/TAS2XXX1=
EB30.bin<br>
&gt; &gt;&gt; -rw-r--r-- 1 root root 35220 Sep 28 21:55 ti/tas2781/TAS2XXX1=
EB31.bin<br>
&gt; &gt;&gt; root@LAPTOP-70RJ5B8Q:/usr/local/src/fw_new#<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Thanks,<br>
&gt; &gt;<br>
&gt;<br>
&gt; You know - as you&#39;ve been having problems with git and at least I&=
#39;ve got<br>
&gt; the intent and your S-o-b for the firmware I&#39;ve taken your MR and<=
br>
&gt; rebased/squashed it for you here:<br>
&gt;<br>
&gt; <a href=3D"https://gitlab.com/kernel-firmware/linux-firmware/-/merge_r=
equests/317" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/kernel=
-firmware/linux-firmware/-/merge_requests/317</a><br>
&gt;<br>
&gt; I&#39;ll merge this and if you have any follow ups you can do them on =
top as<br>
&gt; future MR (preferred!) or patches to M/L.<br>
&gt;<br>
&gt; Thanks!<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><s=
pan style=3D"font-size:x-small"><font color=3D"#666666">Mario Limonciello<b=
r><a href=3D"mailto:superm1@gmail.com" target=3D"_blank">superm1@gmail.com<=
/a></font></span></div>

--000000000000a3411e06241fe47f--
