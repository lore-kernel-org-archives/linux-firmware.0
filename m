Return-Path: <SRS0=6xOh=JM=gmail.com=alexdeucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=3.0 tests=BAYES_05,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508F9C433B4
	for <linux-firmware@archiver.kernel.org>; Thu, 15 Apr 2021 04:28:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1686360FE3; Thu, 15 Apr 2021 04:28:25 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF4C361027;
	Thu, 15 Apr 2021 04:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF4C361027
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=alexdeucher@gmail.com
Received: by mail-ot1-f48.google.com with SMTP id k14-20020a9d7dce0000b02901b866632f29so21475133otn.1;
        Wed, 14 Apr 2021 21:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=Xa2j8TWJZGeuaG9+9Uve7uguoaWP4XJNwhAYtYQ3jFs=;
        b=aZaE6J/B/DY7b6hWADZvZoaJOMlXRdDIhouwdjn2iYd+fhUP+SZ8YfFmyjFlYOkieG
         5gqhFtVg0fdmu+ZZojzo5/HK4T7XcYy+iSEkNONpH5yOKQyyL7i4NN2hlIU0Ayd7RcR7
         xVPcKyIFlpwsCpdUdPvEFx9hKsfNVQf1efuNu+TCtKY6p11FXtXH0/tgJ2x4VEQt0NHE
         sPdAvFB4kJAKgVK+VcJPGOctEYC8BiwyZpdWp6Q/59HIatRMrLolpYJZhk01FXUuFlf9
         CU0UBBW9MI6DTpASfpx4SH+/z+Qwag9RKSY4rzfj02aeRZu0AN2YHzby1sEU4t3qFRqy
         SMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=Xa2j8TWJZGeuaG9+9Uve7uguoaWP4XJNwhAYtYQ3jFs=;
        b=Q6gVRXXunvOB4yhLr+t8KZUNxVT9MHzZqb2cekUZoL9ITUdN4GQHWWZNAwr02hsBoY
         eHUVGj/bdwN6yUysPnv2Y40yuZPbS5T6Mq9ffpKUbRgnes5O62AOeeE3++YiSXJppxLa
         4lF0mbiuJRcv9qqq0KOZH8TCEij4FX+tUWBJdrFANSZz2YhNsLYoGEYSuW6vo2T3PxIG
         8sChEvmfJ1TmglroNbyUHY7z+AQ9NaWWUYz8iLyR/eC0TGxRpTS1t6GIcA3NVvMkc88n
         TUdBqIv7APZM3MUnY7LrC7XYvO3KE91h8SUGoFxCi/RaPLMlTV/Qh8B925/IdrcJ6vBJ
         91YQ==
X-Gm-Message-State: AOAM532/l+CEJw5TZW/5KN0sdJMCTdMLkdsjH2sx8KYkekR/8OoncABd
	9ZXQhnGEHBYlQC+7Zw0cgzlaUMenVSyZDiNLdFOZEgt+Iz2Efg==
X-Google-Smtp-Source: ABdhPJx0Kq3behgnf1/rx8yB8Bp4zrQGImywzm13Vm8xFP2uYbG7Tl1fwbv4EqzR8RdKVajsyeHomRsFuQWAy0EHxUY=
X-Received: by 2002:a05:6830:1697:: with SMTP id k23mr1205338otr.132.1618460904054;
 Wed, 14 Apr 2021 21:28:24 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_Pd5kfpiPa3T7d5XFqkFZJYzHHbVPBmE_kCqG2dK8wQcg@mail.gmail.com>
In-Reply-To: <CADnq5_Pd5kfpiPa3T7d5XFqkFZJYzHHbVPBmE_kCqG2dK8wQcg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Apr 2021 00:28:13 -0400
Message-ID: <CADnq5_MiQzPbtL4z7kTUV37-nJ-FoJYdDq8K23c33m3Rpg643w@mail.gmail.com>
Subject: Re: updated amdgpu firmware
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

Just wanted to make sure this didn't fall through the cracks.

Thanks!

Alex

On Tue, Apr 6, 2021 at 9:15 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> New SMC firmware for navi10 and 14.  Please apply.
>
> Thanks,
>
> Alex
