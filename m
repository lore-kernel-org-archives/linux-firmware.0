Return-Path: <SRS0=hOzA=RG=gmail.com=kapenekakis@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128EACF11F5
	for <linux-firmware@archiver.kernel.org>; Thu, 10 Oct 2024 13:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CF670C4CECC; Thu, 10 Oct 2024 13:52:56 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C09E5C4CEC5
	for <linux-firmware@kernel.org>; Thu, 10 Oct 2024 13:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C09E5C4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fadb636abaso8761411fa.3
        for <linux-firmware@kernel.org>; Thu, 10 Oct 2024 06:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728568374; x=1729173174; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WOrxW89AILQk3udFAERN7y6AGGLIomslxo7RvrRZ38Y=;
        b=GnPj+mPDcXuZOOgMXMCoplBFR84bVPrtlYuLpT7bIGpRJNh0e5gZ8Cril9FkL5ufII
         TEnq3NqxoFMerIqNSAhXiN15BO0tYQyBr63bqR9B7e6ANPWZGs4IVLuH1lBHJLVxKxe7
         RvZWKYZRdmkEapURwc3Yqvf1nv7EiUMzyLs03S/lnEhFFYEgjb5+JvGqtO/k6zokITth
         LNZC11MOsppzj/sbyOGnQZ/hvv4DjJROVQ8gB9WhcmHYIrYXKgNcBiLj+jyqaR9jTO5B
         5VZXo8GhYDZE135+e7aq559trElbbuIUMbEZfi8yadm0kCLAdHeOKx0WwhIsZUXbd3uM
         S7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728568374; x=1729173174;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOrxW89AILQk3udFAERN7y6AGGLIomslxo7RvrRZ38Y=;
        b=rloqIn4WCszSe3RN1Gg+FDqKhSkYRu/uwzmhpSggcobMViMbhDvjgS3JO8p6cdzywj
         3YDGq90She6pcL4iWF66b8/U5M8X8KEwgr2snXQGO4EQM4CCX9DyXFw6U7C27gBMrFS5
         zifVkQiVZQDmRAYKW0ik+Zc/gmwpsTGLQKKuWW1WH7kzGOLVuyVm5bIvpgNLvrOWjY7E
         HpnuGpQP8b+r55pHhkq4kdv5BLvMBxrCi0FcONm/eUAdcvO27bJ5ttayEPE1MyLoRbdu
         Ll35XdrmGMX92hV11DiF/i66ibbVxo/CVHTAnTmis5If/UXPuzq1na8/KB4vgCDMqnpx
         UxJw==
X-Forwarded-Encrypted: i=1; AJvYcCWu7LB5AJ+N5PL4NfPv7bBho/8K1fxYCqCF8Fb9UlXEwDT3jLzq+4bgi/hd9AKkWLVfuDs8UFzBPD9kLTAiSw==@kernel.org
X-Gm-Message-State: AOJu0YwYKhgB0XUN4hfN+TA0XsaYsjAS9zmavyQzoachJpeaX1jqP7iB
	KkeuJr1I86nbVdnOz9D/qViIRJKh37Sqnkv/XLhqGg42V3D83Z8SeJtpuBX6RLyqYoxSZAgRaCI
	TKaywWKtZjYiZTuWO2Xp2a2c6guM=
X-Google-Smtp-Source: AGHT+IFiV/oe6ftCSnrY7kyWamWo9/1u8Pum4SDAuMad0lrhvAfaM6nzggC3GCxiMPa8Ad+RAUbPvZr6tKLhuZDF7Vk=
X-Received: by 2002:a2e:a545:0:b0:2fa:be5c:8ae8 with SMTP id
 38308e7fff4ca-2fb187d2818mr41048491fa.41.1728568373219; Thu, 10 Oct 2024
 06:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <20241009101807.1473-1-shenghao-ding@ti.com> <d1941b10-0549-4a0e-a3fe-a8d7c50c175b@gmail.com>
 <7e138a1c8b6d4ace8c759bb2266216da@ti.com> <3ef8a82f-5e71-4386-90e1-f34222a60bdf@gmail.com>
 <50daaa7a-d590-4ae5-b33f-8f51d0c2f457@gmail.com>
In-Reply-To: <50daaa7a-d590-4ae5-b33f-8f51d0c2f457@gmail.com>
From: Antheas Kapenekakis <antheas.dk@gmail.com>
Date: Thu, 10 Oct 2024 15:52:41 +0200
Message-ID: <CAGwozwFAK_8HVgfNok_6jcsNq2OVdNzTc+KotxF0vhPd+PJTHQ@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [PATCH v1] Upload dsp firmware for ASUS laptop
 1EB30 & 1EB31 and Update WHENCE for both
To: Mario Limonciello <superm1@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "Ding, Shenghao" <shenghao-ding@ti.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Xu, Baojun" <baojun.xu@ti.com>, 
	"derekjohn.clark@gmail.com" <derekjohn.clark@gmail.com>, "13916275206@139.com" <13916275206@139.com>, 
	"romangg@manjaro.org" <romangg@manjaro.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, "Chen, Robin" <robinchen@ti.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Yi, Ken" <k-yi@ti.com>, 
	"philm@manjaro.org" <philm@manjaro.org>, "jlobue10@gmail.com" <jlobue10@gmail.com>, 
	"luke@ljones.dev" <luke@ljones.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Mario,
as I am not logged in, kindly close
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/272

Then, while consulting it and
https://gitlab.com/kernel-firmware/linux-firmware/-/commit/d65613ab8c480dec6d63733d3286451aa8b3795f
, modify the whence so that 1EB3 points to 1EB30.

Otherwise, your merge will not work with the current TAS driver, and
we will have to do a second round of workarounds while it is the case.
We have had that symlink for over 3 months now, and as Chen said,
while not ideal, it will do for the time being.

You may add me as suggested-by using my lkml email signature

Antheas

On Thu, 10 Oct 2024 at 15:39, Mario Limonciello <superm1@gmail.com> wrote:
>
>
>
> On 10/10/24 08:30, Mario Limonciello wrote:
> >> Although TAS2XXX1EB30.bin and TAS2XXX1EB31.bin are both in ti/tas2781,
> >> yet it reported "does not exist".
> >> I have no idea why the file is there while report "does not exist".
> >> After I removed the newly-merged, no such report.
> >
> > I think you forgot to git add them to the commit?
> >
> >>
> >> Following is the log.
> >>
> >> root@LAPTOP-70RJ5B8Q:/usr/local/src/fw_new# make check
> >> Check that executables have
> >> shebangs.....................................Passed
> >> Forbid new
> >> submodules....................................................Passed
> >> Check
> >> Yaml...............................................................Passed
> >> Check for broken symlinks............................(no files to
> >> check)Skipped
> >> Detect Destroyed
> >> Symlinks................................................Passed
> >> shellcheck...............................................................Passed
> >> black....................................................................Passed
> >> markdownlint.............................................................Failed
> >> - hook id: markdownlint
> >> - exit code: 1
> >>
> >> internal/modules/cjs/loader.js:818
> >>    throw err;
> >>    ^
> >>
> >> Error: Cannot find module 'node:fs'
> >> Require stack:
> >> - /root/.cache/pre-commit/repoxl59c0uz/node_env-system/lib/
> >> node_modules/markdownlint-cli/markdownlint.js
> >>      at Function.Module._resolveFilename (internal/modules/cjs/
> >> loader.js:815:15)
> >>      at Function.Module._load (internal/modules/cjs/loader.js:667:27)
> >>      at Module.require (internal/modules/cjs/loader.js:887:19)
> >>      at require (internal/modules/cjs/helpers.js:85:18)
> >>      at Object.<anonymous> (/root/.cache/pre-commit/repoxl59c0uz/
> >> node_env-system/lib/node_modules/markdownlint-cli/markdownlint.js:5:12)
> >>      at Module._compile (internal/modules/cjs/loader.js:999:30)
> >>      at Object.Module._extensions..js (internal/modules/cjs/
> >> loader.js:1027:10)
> >>      at Module.load (internal/modules/cjs/loader.js:863:32)
> >>      at Function.Module._load (internal/modules/cjs/loader.js:708:14)
> >>      at Function.executeUserEntryPoint [as runMain] (internal/modules/
> >> run_main.js:60:12) {
> >>    code: 'MODULE_NOT_FOUND',
> >>    requireStack: [
> >>      '/root/.cache/pre-commit/repoxl59c0uz/node_env-system/lib/
> >> node_modules/markdownlint-cli/markdownlint.js'
> >>    ]
> >> }
> >>
> >
> > This looks like you're missing some dependencie on you system for
> > markdownlint. You need nodejs v18.
> >
> > If you can't install this you can skip this check when you commit by
> > adding "SKIP=markdownlint" to your environment while running 'git commit'.
> >
> >> Check
> >> whence.............................................................Failed
> >> - hook id: check-whence
> >> - exit code: 1
> >>
> >> E: ti/tas2781/TAS2XXX1EB30.bin listed in WHENCE does not exist
> >> E: ti/tas2781/TAS2XXX1EB31.bin listed in WHENCE does not exist
> >> E: target ti/tas2781/TAS2XXX1EB30.bin of link TAS2XXX1EB30.bin in
> >> WHENCE does not exist
> >> E: target ti/tas2781/TAS2XXX1EB31.bin of link TAS2XXX1EB31.bin in
> >> WHENCE does not exist
> >>
> >
> > These files are missing in your commit or they have broken links. Double
> > check them.
> >
> >> make: *** [Makefile:10: check] Error 1
> >> root@LAPTOP-70RJ5B8Q:/usr/local/src/fw_new# ls ti/tas2781/TAS2XXX1* -al
> >> -rw-r--r-- 1 root root 35220 Sep 28 21:54 ti/tas2781/TAS2XXX1EB30.bin
> >> -rw-r--r-- 1 root root 35220 Sep 28 21:55 ti/tas2781/TAS2XXX1EB31.bin
> >> root@LAPTOP-70RJ5B8Q:/usr/local/src/fw_new#
> >>>
> >>> Thanks,
> >
>
> You know - as you've been having problems with git and at least I've got
> the intent and your S-o-b for the firmware I've taken your MR and
> rebased/squashed it for you here:
>
> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/317
>
> I'll merge this and if you have any follow ups you can do them on top as
> future MR (preferred!) or patches to M/L.
>
> Thanks!
>
