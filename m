Return-Path: <SRS0=y5u9=67=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEA5C6FD1A
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Mar 2023 17:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 41A05C433EF; Tue,  7 Mar 2023 17:19:20 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 529E9C4339B;
	Tue,  7 Mar 2023 17:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 529E9C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-53d277c1834so81252707b3.10;
        Tue, 07 Mar 2023 09:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678209558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0HY2UKv7jm9osr2b/lnnuZVkISaE96PK5O4l1gz72c=;
        b=Fgg8jF5xjkk6km232LDlwVi9lQyEjad/unVsERIpKzapdtBIOzQ3lKt+QzQHRl4gs3
         LMKh2Zm9iAFuhbPdqy5c+5PTgKRo29hzuSaab3P7w+DDmL6xce1Ws6U2r1d4UWCE+xrq
         NlWleDSC4BVDHhPNGESHrbBtmr46j7UdDNWZQxxwJMm+H3HHRmKpcpMKiX77YUkM5Hfb
         BMjrb/Cqj8GkiRH6OzTeNhPmXoGI3VUgonmnuHI8GLZi8+/nflyvKiLNEIum4g4TqbJc
         OFaIjYSE1kc+UBwmh8UuSopKGmITU/zRySbvDo/n1HA2dFTMcOTiERYuT5l31cL4K8PX
         VaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678209558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0HY2UKv7jm9osr2b/lnnuZVkISaE96PK5O4l1gz72c=;
        b=p3JPsnCjKJid03ELcMXR5Xjy54RmXnvZjqlT5obS2d/2pMgb2ZYPuEycZkUNHW8Nk5
         TYjylhXMnpdTHFAjSnZLOvURJo7I23V51YAn7vvB4i/KfGML8ddi82qRwg2tHx2tUz4H
         /lQj3V2P6ArVNcbSHVwiROpnaVq7L1SsXfJC8oplL/e+BjnCCGgNVJYPxUGcwpU4eh8S
         3sAXcZ+5tqB55tp/7fa+MQxsPpOJhGOLahRGMhIQzm4E1jAKQ3y+0dbtw1F7IfOWEweY
         wbPFgHBOrjO6tn+xbCWgghi+nxg3SfN9KgYQ0dSt+cMlkw21gvEv+90KkhY9slGXJV80
         UZYA==
X-Gm-Message-State: AO0yUKVuIH1fvQKe1n69ThRDRVL4I6NcAQmqis3nN1XaV3cp+OrsEn7I
	+0Es2+WhM7XNw4slVmJsC2yM4r5+5TE1aAMPHm1ICA3R150=
X-Google-Smtp-Source: AK7set/jKdMzHeVY6cOms/d8cgwGOczD8T4TFop78W18MdjLBKijKnQUSPTBwlHps6j6FPfN7YIngNXrFrzGJBA4og4=
X-Received: by 2002:a81:c543:0:b0:536:4194:e6eb with SMTP id
 o3-20020a81c543000000b005364194e6ebmr9336965ywj.0.1678209557852; Tue, 07 Mar
 2023 09:19:17 -0800 (PST)
MIME-Version: 1.0
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
 <20230301-fixes-and-compression-v2-5-e2b71974e842@gmail.com> <CA+5PVA7eOJ+y2rdSyMAqVqqcp8w4oYfZU1J8PZV7+TKqDcxqbA@mail.gmail.com>
In-Reply-To: <CA+5PVA7eOJ+y2rdSyMAqVqqcp8w4oYfZU1J8PZV7+TKqDcxqbA@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 7 Mar 2023 17:19:06 +0000
Message-ID: <CACvgo51yMRXgbUfK6wNfDvXEuBXH=JPZhm9=oFkhFHipVqz5oQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 05/16] WHENCE: comment out duplicate MediaTek firmware
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Adam Sampson <ats@offog.org>, 
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Mar 2023 at 15:02, Josh Boyer <jwboyer@kernel.org> wrote:
>
> On Wed, Mar 1, 2023 at 1:56=E2=80=AFPM Emil Velikov via B4 Relay
> <devnull+emil.l.velikov.gmail.com@kernel.org> wrote:
> >
> > From: Emil Velikov <emil.l.velikov@gmail.com>
> >
> > As mentioned in the inline comment - file is already listed further
> > down. To prevent check_whence.py errors, comment it out.
>
> Why did you comment this one out instead of remove it as duplicate
> like the previous patch?
>

In the previous patch, we had either a) duplicated within the same
section or b) section that is no longer applicable. Aka the r8723au
driver referenced does not existing in kernel.org
Here we have two drivers which use different firmware sets, which
partially overlap.

Dropping one or the other would be misleading, but I don't have a
strong opinion. Let me know what you prefer and I'll respin the patch.

Thanks
Emil
