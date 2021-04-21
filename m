Return-Path: <SRS0=5t/6=JS=gmail.com=alexdeucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F274C433ED
	for <linux-firmware@archiver.kernel.org>; Wed, 21 Apr 2021 14:37:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 118CA61456; Wed, 21 Apr 2021 14:37:33 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1EA461421;
	Wed, 21 Apr 2021 14:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1EA461421
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=alexdeucher@gmail.com
Received: by mail-ot1-f51.google.com with SMTP id f75-20020a9d03d10000b0290280def9ab76so34018378otf.12;
        Wed, 21 Apr 2021 07:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BsebC1WVLm1Ct4N1HajPNujNlML4hVKdGQwUMmSJjMs=;
        b=hFOROOL9ggsO7GqagojatKfw08P94HXeteRSskfNdL1fiuBjPJ1+63MGuecN4V0TZW
         84qGjzgWGHAVple0pPwchXmUops1NqC3Ph33qRp7FbaDkKSboyqwq7oPw9/FaPWZJjig
         jrBGJns3btzXQmi6uFvOzG+fr031FKXezgEuYyzAVJ4fsDiDWh7lyPE4xd69XJ6NW3Q/
         UYMJfqrS/HRNpqo179tAYvmNt0Nlh/Ps+SoV8/rHN9wSEUMNXPvJt+VEAU2hT59bC7eT
         X9fXHAR78McH6fXfiytkzI20sWfu2gptDFiYOyz3CLYetjRZxHYrsw7ZkTZyr0m0bxlM
         379w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BsebC1WVLm1Ct4N1HajPNujNlML4hVKdGQwUMmSJjMs=;
        b=F3oCoGwKd53AIzibmMaNRlwZ97u/WR1zOU24ngi1akijDh56HN+X5W2oq4t+74CM7s
         urdCuHjV2SCMElTwI1HjW4McyWz96CFi/QCG3cKJRrNMzFqvyV1CXNlg+7pPSskRB0EJ
         G+Zl4Y5GtNjmdgCs4fAEGuNJmd6FsPH6YC3zPddenl1UyzZ320xBEzNH9e1T6V+INvYW
         3hJPcb7+PxJIhtgFF3G2KzVp06PJ3n5IWCZU9IXYyppmfGixiwhUJisrEllgrn3S2cZf
         VkzFqvN1K/VP3wy0QMpvxhn5CkF7EMx6p3P0W3671K/a1qCITefpfNyvX4yxBdGGoUfw
         VUXg==
X-Gm-Message-State: AOAM530eHkWaQmewSO0jdNZZoJY72lf1SxS4Eay7Hpr621SOz+LjeK7h
	2hn7/Va9CuPRENlxnJ16qZb1bSEhgd2RNF5cf7gHpbu5r3SzZA==
X-Google-Smtp-Source: ABdhPJwzCx1tO+w+7ufAbnP6i7/HbYpqZHT5E7leaJtlKIo6n4GfstbNf3guGpE77VT7UbYp9OWWKmccyrGLUBf1IUA=
X-Received: by 2002:a05:6830:1f12:: with SMTP id u18mr16776564otg.132.1619015851938;
 Wed, 21 Apr 2021 07:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_Oru5_LB3cnO_P=VCd_ZwqvwHi=7wWH7ruAc7RKAjmSeg@mail.gmail.com>
 <CA+5PVA5_GYo-SF9xTUQNjoqDjUqbO5tcguUrWB012M2j27Frog@mail.gmail.com>
In-Reply-To: <CA+5PVA5_GYo-SF9xTUQNjoqDjUqbO5tcguUrWB012M2j27Frog@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 21 Apr 2021 10:37:20 -0400
Message-ID: <CADnq5_Mi4XK969QutoePikSepJNtEdGeY2vucSTKXwHiRe9uxQ@mail.gmail.com>
Subject: Re: amdgpu firmware updates
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Thanks!

Alex

On Wed, Apr 21, 2021 at 7:14 AM Josh Boyer <jwboyer@kernel.org> wrote:
>
> Applied and pushed out.
>
> josh
>
> On Tue, Apr 20, 2021 at 8:52 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > Updated amdgpu firmwares.  Please apply!
> >
> > Thanks!
> >
> > Alex
