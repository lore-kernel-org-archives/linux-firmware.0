Return-Path: <SRS0=dEQg=RG=gmail.com=superm1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE1DCF11F8
	for <linux-firmware@archiver.kernel.org>; Thu, 10 Oct 2024 14:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94E81C4CECC; Thu, 10 Oct 2024 14:12:56 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EC2E9C4CEC5
	for <linux-firmware@kernel.org>; Thu, 10 Oct 2024 14:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EC2E9C4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e290e857d56so636313276.1
        for <linux-firmware@kernel.org>; Thu, 10 Oct 2024 07:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728569574; x=1729174374; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/S1y3Ganeqo7qqFrvYWOEg/CT/IohjgqQPWh4RRnn3U=;
        b=GqBtnOT/TAZTYWfjYt9JJSpStpTtaDHTUVyU/Qvhi6wAd0m57h17ZfRWJ4AQ4ZGJST
         Yg4A+R/6NwPQWea5vsIfC2jLZYDlKMcQnJ+bSpslF8mp3dXBs24MrYwKSsldsVHpsj73
         XU8vFmkBBgcrLG11EifyYnYzHjG4ybrO7EJON88uG9RPA3dIanTuF1q0PgBU8vRBPvpf
         z0/v5dVB4c1vLk3dXRKMjlxop/QJFxzYAn5VQHMO5bw/2wTkPKGAa/TL1AGGMUuu/7FV
         luZSZgzlHLVtNiuaLBy88ZA9xU7Tt55w3tll2saWDPdpuAmIe3Q6jZO9bhsTNJgWi6ts
         /LNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728569574; x=1729174374;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/S1y3Ganeqo7qqFrvYWOEg/CT/IohjgqQPWh4RRnn3U=;
        b=misk4PTwGLqroghMcCsX/kbNthOT+lTvH5cZyjKvbRKSz6xLockgNN1d2jv4ciQB+b
         sHN/uM9aRRG3aTN/PPbRutO0v4TryKYwlCpftw8ECGuVAZEvPRCLVmDj+g4YR5vzISMi
         EJwjuVBCxm2M7xygZYiv+jZGkGWiObPXiDJG9fX+Wp1Er4W42pgqLO9El91Y/N86TX88
         800ieu6aJQ2T+lYlHUQ4VpIKKHRx9hF9riWL2lL06jfaR2BQl9eCO5xf3UKQh4cDFLtS
         V/aEFW9Pkt+kqSwfLC9Tpfa01d1k609mmUi6Ai1ZcgfATc4ZhrPAt0Fh4IQ5X5rKjoeG
         NyeA==
X-Forwarded-Encrypted: i=1; AJvYcCXuueYBwKfvGVsSxtvjyZH/PwbbyQgcyXvA8xggcrjzgrVAqU3ORN4GmrLbDTx6MQa/9a12f8rV7t1GYrcKlg==@kernel.org
X-Gm-Message-State: AOJu0YzKgfUjoAk7if47O/1u90UwJnQ8+KI7E5mKaJXDV5JjMlysdI88
	dtiFbnZKnAqCEd4qEdikL3vFlfPK2oFntEZSpvHkBIxhrAzazA4SyFCBiv8kHKuuJmKK6F/TOHS
	uHnOSfoBl2HLv622HBj0epFnoGhSgJgt5D+g=
X-Google-Smtp-Source: AGHT+IG1l84BIIMKWgWes6ViGRVlr7HGnHjyMJDeUejJzp39GCDwWz1jtSU/2E7irTSGcajP/dZIwst9W96e8YklvK8=
X-Received: by 2002:a05:6902:18c4:b0:e28:f31f:5f72 with SMTP id
 3f1490d57ef6-e28fe352e32mr6201787276.19.1728569573802; Thu, 10 Oct 2024
 07:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20241009101807.1473-1-shenghao-ding@ti.com> <d1941b10-0549-4a0e-a3fe-a8d7c50c175b@gmail.com>
 <7e138a1c8b6d4ace8c759bb2266216da@ti.com> <3ef8a82f-5e71-4386-90e1-f34222a60bdf@gmail.com>
 <50daaa7a-d590-4ae5-b33f-8f51d0c2f457@gmail.com> <CAGwozwFAK_8HVgfNok_6jcsNq2OVdNzTc+KotxF0vhPd+PJTHQ@mail.gmail.com>
 <CA+EcB1NF3D+KT_iBUWfYGzW_OTrHUeVp6Pa-cZey=RA+eycgVg@mail.gmail.com>
 <CAGwozwEYwd___PEmHA_SL8jOazJQHBH7goazc_8G1NjkXh-+PQ@mail.gmail.com> <CAGwozwFWqO_Eusc3vFLwDkEZnz0Cq8K=ot+34SCVEXJPeYQXwA@mail.gmail.com>
In-Reply-To: <CAGwozwFWqO_Eusc3vFLwDkEZnz0Cq8K=ot+34SCVEXJPeYQXwA@mail.gmail.com>
From: Mario Limonciello <superm1@gmail.com>
Date: Thu, 10 Oct 2024 09:12:42 -0500
Message-ID: <CA+EcB1O-B_=YtHOmZmxyaZz7EYm9gpr4a1m5wDmxd0UDkF9UGg@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [PATCH v1] Upload dsp firmware for ASUS laptop
 1EB30 & 1EB31 and Update WHENCE for both
To: Antheas Kapenekakis <lkml@antheas.dev>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "Ding, Shenghao" <shenghao-ding@ti.com>, linux-firmware@kernel.org, 
	"Xu, Baojun" <baojun.xu@ti.com>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 13916275206@139.com, 
	Roman Gilg <romangg@manjaro.org>, linux-sound@vger.kernel.org, 
	"Chen, Robin" <robinchen@ti.com>, open list <linux-kernel@vger.kernel.org>, "Yi, Ken" <k-yi@ti.com>, 
	Philip Muller <philm@manjaro.org>, Jonathan LoBue <jlobue10@gmail.com>, Luke Jones <luke@ljones.dev>
Content-Type: multipart/alternative; boundary="0000000000006a8c7606241ff768"

--0000000000006a8c7606241ff768
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OK thanks.  I'll fix and get it merged.

On Thu, Oct 10, 2024 at 9:11=E2=80=AFAM Antheas Kapenekakis <lkml@antheas.d=
ev>
wrote:

> Lgtm otherwise
>
> Antheas
>
> On Thu, Oct 10, 2024, 16:09 Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
>> I'd rather you use the email I'm replying to you now with than my
>> personal one
>>
>> Antheas
>>
>> On Thu, Oct 10, 2024, 16:07 Mario Limonciello <superm1@gmail.com> wrote:
>>
>>> OK, can you please make sure I got it right?
>>>
>>> Add a link from TAS2XXX1EB3.bin -> ti/tas2781/TAS2XXX1EB30.bin (!318) =
=C2=B7
>>> Merge requests =C2=B7 kernel-firmware / Linux Firmware =C2=B7 GitLab
>>> <https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/318=
>
>>>
>>> On Thu, Oct 10, 2024 at 8:52=E2=80=AFAM Antheas Kapenekakis <
>>> antheas.dk@gmail.com> wrote:
>>>
>>>> Hi Mario,
>>>> as I am not logged in, kindly close
>>>> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/272
>>>>
>>>> Then, while consulting it and
>>>>
>>>> https://gitlab.com/kernel-firmware/linux-firmware/-/commit/d65613ab8c4=
80dec6d63733d3286451aa8b3795f
>>>> , modify the whence so that 1EB3 points to 1EB30.
>>>>
>>>> Otherwise, your merge will not work with the current TAS driver, and
>>>> we will have to do a second round of workarounds while it is the case.
>>>> We have had that symlink for over 3 months now, and as Chen said,
>>>> while not ideal, it will do for the time being.
>>>>
>>>> You may add me as suggested-by using my lkml email signature
>>>>
>>>> Antheas
>>>>
>>>> On Thu, 10 Oct 2024 at 15:39, Mario Limonciello <superm1@gmail.com>
>>>> wrote:
>>>> >
>>>> >
>>>> >
>>>> > On 10/10/24 08:30, Mario Limonciello wrote:
>>>> > >> Although TAS2XXX1EB30.bin and TAS2XXX1EB31.bin are both in
>>>> ti/tas2781,
>>>> > >> yet it reported "does not exist".
>>>> > >> I have no idea why the file is there while report "does not exist=
".
>>>> > >> After I removed the newly-merged, no such report.
>>>> > >
>>>> > > I think you forgot to git add them to the commit?
>>>> > >
>>>> > >>
>>>> > >> Following is the log.
>>>> > >>
>>>> > >> root@LAPTOP-70RJ5B8Q:/usr/local/src/fw_new# make check
>>>> > >> Check that executables have
>>>> > >> shebangs.....................................Passed
>>>> > >> Forbid new
>>>> > >>
>>>> submodules....................................................Passed
>>>> > >> Check
>>>> > >>
>>>> Yaml...............................................................Pas=
sed
>>>> > >> Check for broken symlinks............................(no files to
>>>> > >> check)Skipped
>>>> > >> Detect Destroyed
>>>> > >> Symlinks................................................Passed
>>>> > >>
>>>> shellcheck............................................................=
...Passed
>>>> > >>
>>>> black.................................................................=
...Passed
>>>> > >>
>>>> markdownlint..........................................................=
...Failed
>>>> > >> - hook id: markdownlint
>>>> > >> - exit code: 1
>>>> > >>
>>>> > >> internal/modules/cjs/loader.js:818
>>>> > >>    throw err;
>>>> > >>    ^
>>>> > >>
>>>> > >> Error: Cannot find module 'node:fs'
>>>> > >> Require stack:
>>>> > >> - /root/.cache/pre-commit/repoxl59c0uz/node_env-system/lib/
>>>> > >> node_modules/markdownlint-cli/markdownlint.js
>>>> > >>      at Function.Module._resolveFilename (internal/modules/cjs/
>>>> > >> loader.js:815:15)
>>>> > >>      at Function.Module._load
>>>> (internal/modules/cjs/loader.js:667:27)
>>>> > >>      at Module.require (internal/modules/cjs/loader.js:887:19)
>>>> > >>      at require (internal/modules/cjs/helpers.js:85:18)
>>>> > >>      at Object.<anonymous> (/root/.cache/pre-commit/repoxl59c0uz/
>>>> > >>
>>>> node_env-system/lib/node_modules/markdownlint-cli/markdownlint.js:5:12=
)
>>>> > >>      at Module._compile (internal/modules/cjs/loader.js:999:30)
>>>> > >>      at Object.Module._extensions..js (internal/modules/cjs/
>>>> > >> loader.js:1027:10)
>>>> > >>      at Module.load (internal/modules/cjs/loader.js:863:32)
>>>> > >>      at Function.Module._load
>>>> (internal/modules/cjs/loader.js:708:14)
>>>> > >>      at Function.executeUserEntryPoint [as runMain]
>>>> (internal/modules/
>>>> > >> run_main.js:60:12) {
>>>> > >>    code: 'MODULE_NOT_FOUND',
>>>> > >>    requireStack: [
>>>> > >>      '/root/.cache/pre-commit/repoxl59c0uz/node_env-system/lib/
>>>> > >> node_modules/markdownlint-cli/markdownlint.js'
>>>> > >>    ]
>>>> > >> }
>>>> > >>
>>>> > >
>>>> > > This looks like you're missing some dependencie on you system for
>>>> > > markdownlint. You need nodejs v18.
>>>> > >
>>>> > > If you can't install this you can skip this check when you commit =
by
>>>> > > adding "SKIP=3Dmarkdownlint" to your environment while running 'gi=
t
>>>> commit'.
>>>> > >
>>>> > >> Check
>>>> > >>
>>>> whence.............................................................Fai=
led
>>>> > >> - hook id: check-whence
>>>> > >> - exit code: 1
>>>> > >>
>>>> > >> E: ti/tas2781/TAS2XXX1EB30.bin listed in WHENCE does not exist
>>>> > >> E: ti/tas2781/TAS2XXX1EB31.bin listed in WHENCE does not exist
>>>> > >> E: target ti/tas2781/TAS2XXX1EB30.bin of link TAS2XXX1EB30.bin in
>>>> > >> WHENCE does not exist
>>>> > >> E: target ti/tas2781/TAS2XXX1EB31.bin of link TAS2XXX1EB31.bin in
>>>> > >> WHENCE does not exist
>>>> > >>
>>>> > >
>>>> > > These files are missing in your commit or they have broken links.
>>>> Double
>>>> > > check them.
>>>> > >
>>>> > >> make: *** [Makefile:10: check] Error 1
>>>> > >> root@LAPTOP-70RJ5B8Q:/usr/local/src/fw_new# ls
>>>> ti/tas2781/TAS2XXX1* -al
>>>> > >> -rw-r--r-- 1 root root 35220 Sep 28 21:54
>>>> ti/tas2781/TAS2XXX1EB30.bin
>>>> > >> -rw-r--r-- 1 root root 35220 Sep 28 21:55
>>>> ti/tas2781/TAS2XXX1EB31.bin
>>>> > >> root@LAPTOP-70RJ5B8Q:/usr/local/src/fw_new#
>>>> > >>>
>>>> > >>> Thanks,
>>>> > >
>>>> >
>>>> > You know - as you've been having problems with git and at least I've
>>>> got
>>>> > the intent and your S-o-b for the firmware I've taken your MR and
>>>> > rebased/squashed it for you here:
>>>> >
>>>> >
>>>> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/317
>>>> >
>>>> > I'll merge this and if you have any follow ups you can do them on to=
p
>>>> as
>>>> > future MR (preferred!) or patches to M/L.
>>>> >
>>>> > Thanks!
>>>> >
>>>>
>>>
>>>
>>> --
>>> Mario Limonciello
>>> superm1@gmail.com
>>>
>>

--=20
Mario Limonciello
superm1@gmail.com

--0000000000006a8c7606241ff768
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">OK thanks.=C2=A0 I&#39;ll fix and get it merged.</div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oc=
t 10, 2024 at 9:11=E2=80=AFAM Antheas Kapenekakis &lt;<a href=3D"mailto:lkm=
l@antheas.dev">lkml@antheas.dev</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"auto">Lgtm otherwise<div dir=
=3D"auto"><br></div><div dir=3D"auto">Antheas</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 10, 2024, 16=
:09 Antheas Kapenekakis &lt;<a href=3D"mailto:lkml@antheas.dev" target=3D"_=
blank">lkml@antheas.dev</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"auto">I&#39;d rather you use the email I=
&#39;m replying to you now with than my personal one<div dir=3D"auto"><br><=
/div><div dir=3D"auto">Antheas</div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 10, 2024, 16:07 Mario Limon=
ciello &lt;<a href=3D"mailto:superm1@gmail.com" rel=3D"noreferrer" target=
=3D"_blank">superm1@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">OK, can you =
please make sure I got it right?<div><br></div><div><a href=3D"https://gitl=
ab.com/kernel-firmware/linux-firmware/-/merge_requests/318" rel=3D"noreferr=
er noreferrer" target=3D"_blank">Add a link from TAS2XXX1EB3.bin -&gt; ti/t=
as2781/TAS2XXX1EB30.bin (!318) =C2=B7 Merge requests =C2=B7 kernel-firmware=
 / Linux Firmware =C2=B7 GitLab</a><br></div></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 10, 2024 at =
8:52=E2=80=AFAM Antheas Kapenekakis &lt;<a href=3D"mailto:antheas.dk@gmail.=
com" rel=3D"noreferrer noreferrer" target=3D"_blank">antheas.dk@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi=
 Mario,<br>
as I am not logged in, kindly close<br>
<a href=3D"https://gitlab.com/kernel-firmware/linux-firmware/-/merge_reques=
ts/272" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://=
gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/272</a><br>
<br>
Then, while consulting it and<br>
<a href=3D"https://gitlab.com/kernel-firmware/linux-firmware/-/commit/d6561=
3ab8c480dec6d63733d3286451aa8b3795f" rel=3D"noreferrer noreferrer noreferre=
r" target=3D"_blank">https://gitlab.com/kernel-firmware/linux-firmware/-/co=
mmit/d65613ab8c480dec6d63733d3286451aa8b3795f</a><br>
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
m1@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">superm1@gmail=
.com</a>&gt; wrote:<br>
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
equests/317" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">htt=
ps://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/317</a><br>
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
r><a href=3D"mailto:superm1@gmail.com" rel=3D"noreferrer noreferrer" target=
=3D"_blank">superm1@gmail.com</a></font></span></div>
</blockquote></div>
</blockquote></div>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><s=
pan style=3D"font-size:x-small"><font color=3D"#666666">Mario Limonciello<b=
r><a href=3D"mailto:superm1@gmail.com" target=3D"_blank">superm1@gmail.com<=
/a></font></span></div>

--0000000000006a8c7606241ff768--
