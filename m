Return-Path: <SRS0=4k8/=CC=gmail.com=alexdeucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FEDBC433DF
	for <linux-firmware@archiver.kernel.org>; Mon, 24 Aug 2020 20:16:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 28C6B20738; Mon, 24 Aug 2020 20:16:53 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF231206BE;
	Mon, 24 Aug 2020 20:16:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQOUwjMZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF231206BE
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=alexdeucher@gmail.com
Received: by mail-wr1-f46.google.com with SMTP id a5so10372576wrm.6;
        Mon, 24 Aug 2020 13:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IEGDexZxe+0cPufYDDsHfkMUHga05vxuE3b0u6FBplo=;
        b=KQOUwjMZY/zbp2mfHMo1SUAMOlM7EA1AfcenSiqLDl6yrsUBy3n1HdNYot4GKCKoB4
         YNqOEW/QQ5CzO+ymEorf0Z0yYLtnwq7e0FEKvIE/yJr4GUc2UKcIM94XfcKq7JnGY3TX
         Oh05TAPAjUFZzf7PvuaW3y5FCxpRKjVLSz2mL/OTfU95mFzaLbk9RuRxIkN6kS24dV3k
         CrMDc0zyS6xAJoBBWRExhW2PfQwdsoLHafmxgKVzj1pTt/h6IZUmSWPZpa4tjIf+K8lM
         MfkAd7kO4aTD5dx5cP7OGz0NULUpkkY+q8y3B63700BJllvAtINrPXjVOPUXGFtyo2vD
         p1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IEGDexZxe+0cPufYDDsHfkMUHga05vxuE3b0u6FBplo=;
        b=KTSGJ6o5JZs8oxoIm8JNY7QWhb35hbX7H74DyWAfE+LVBIMmG8jxu8C25skdNYw/+A
         4DJOC1FTg+APss384fkzG5TtiMWaUlfdQP6l2534FJJcXhJ1PKHsHKRkyptlYFecVaTA
         hO4eszG/+6S+rh58g27swcDiCwROGfkbrCys4IULi2nRJa+xgXWw4TuEvGaUn1hdSMl5
         qP1PC/VfyJpo5BrYtf4fMFSgdcNP7JPhUdZ7EG4KgbWI2njBKMgaNbUJualb7PqDmVv5
         v0ER+l3U77vUXOoBUXx1OfLNplms4BetwBgTERFFdk3KaFdTeTUijMvqO486Mzei7M15
         c1ig==
X-Gm-Message-State: AOAM53183PLgJ1ZWoS92HTBTwrlwf0/wnj8UQ76LISe6zolhs5Ikisdd
	/GW84n19eFRlSi4/J+lT3Pj1bUQ4K0jQuYjaoWdvyD9j
X-Google-Smtp-Source: ABdhPJxPzrISjCNV4eSPelztsiqmK903RbAbJIHQHQCgpGcmlfbSJjzCt9SYoOeKvtNv4FS+YbAnR3LXXYqUrvCjOXE=
X-Received: by 2002:a5d:494b:: with SMTP id r11mr7660910wrs.419.1598300211295;
 Mon, 24 Aug 2020 13:16:51 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_McWVA0fPPsjPO8YddUPyKuTv7pBRuu1hKpD7OH-eYq9w@mail.gmail.com>
 <CA+5PVA56+dzGhOSrDYpZpe75JEmN=AAQhtd-QJhndzOa4r+H3A@mail.gmail.com>
In-Reply-To: <CA+5PVA56+dzGhOSrDYpZpe75JEmN=AAQhtd-QJhndzOa4r+H3A@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Aug 2020 16:16:39 -0400
Message-ID: <CADnq5_PGnGGO6CJokHe1pwL3waJWic51SJA_iCbYAdVKKjYcsA@mail.gmail.com>
Subject: Re: amdgpu firmware updates
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Thanks!

Alex

On Mon, Aug 24, 2020 at 4:15 PM Josh Boyer <jwboyer@kernel.org> wrote:
>
> On Wed, Aug 19, 2020 at 10:58 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > Firmware updates for amdgpu.  This adds updated firmware for navi10
> > and adds the firmware for a new GPU, navi12.  Please apply.
>
> Applied and pushed out.
>
> josh
