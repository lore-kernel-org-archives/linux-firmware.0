Return-Path: <SRS0=7SJJ=ND=gmail.com=alexdeucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88BBCC4338F
	for <linux-firmware@archiver.kernel.org>; Thu, 12 Aug 2021 13:23:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 61A3161059; Thu, 12 Aug 2021 13:23:29 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 355F660FC3;
	Thu, 12 Aug 2021 13:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 355F660FC3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f42.google.com with SMTP id v10-20020a9d604a0000b02904fa9613b53dso7666539otj.6;
        Thu, 12 Aug 2021 06:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GpgHpCj+pBoX9xD7Gih37lnJROX+0nld8N349toKgUY=;
        b=DrIkS0QiV3HfEys0faUXdspgNRxzwVyGl+WyAdDpquW0PjPB5uNllZnsO88wf44qzl
         viNMqWHryK8Ry+DtQi1RTChjo+i5wpXOR8hEO0fcJRckDkfX9FAWHARKoayY9u3Xl1oT
         /8QONFJ2QWqGdzDtg++D26ZpJA0BrW1iCG2zm0NVfeJBzNv5JMkI3r6X9kyQNi9Xd9Vk
         JFMF82wM2QV7pK6CGKZlzBy618Z974I1+xCzvwwnIK+0AvTgtKs0f8j7TkiAm7Pp9lTS
         4fbzlQU+Zhsl4jn2O+lBTaYz78H4abOQqau+62z3AZT1C7pGKDUCiu7lwKgnCFXLLaDi
         a8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GpgHpCj+pBoX9xD7Gih37lnJROX+0nld8N349toKgUY=;
        b=mbmp/jw2sXABYEz9OLWr3sKW+FDPe+cbSLyd/64tmdMow0OX3pj1y2QCULTPAhOV+O
         Y3+osd+srY0C4I04H3+ePWIZzbOuJDTxwRfMoEoLGDww3m9VTq8eOyV4WVJj7WA2fd+b
         RhBJAKSITDtDfiA3a2VYGDCrWa3NRwFUJIVh0JYn1rA5eFI5+i0K0Ii0Gmgt/nIbSKEU
         LGJMyFFnep77GDbvbWxDNCE7eaE3ow2za8fAsiekdvmYELPDX7Vr5+/pZ/NuAYMSGXAE
         SIqEqesKUxaeguIFI0uxgunMIRLdp3zPSAevmqKCDsn3wfgewoVkkNg5KHnj2sXhnikc
         B2pw==
X-Gm-Message-State: AOAM532aM15JZ7iWOJAlNyQ5xuO9C5cIj+DABMGxaxAqV5W+jg5jfcsG
	T79dAjlbG+JFkk1uizJ7VyLPtE0xAb5lrDejPz2hy/hA
X-Google-Smtp-Source: ABdhPJysBGW6OhjHHejIWtuMtl6pJYRtoSff1wRj8PMAiR/nevd6vHVoBGpiVGikW0EjLMqv1gGxCUw6HygL4UlC9gk=
X-Received: by 2002:a05:6830:1e78:: with SMTP id m24mr3430265otr.23.1628774608468;
 Thu, 12 Aug 2021 06:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_OA2C=yQfgtrhU4Gw5vYRXPUyPyPc+AP0qPsKQ41PUULQ@mail.gmail.com>
 <CA+5PVA5PwY0FiK5CRfBp_Mj9QDkX2VOV=8qm2uVUTJk+hSR4xQ@mail.gmail.com>
In-Reply-To: <CA+5PVA5PwY0FiK5CRfBp_Mj9QDkX2VOV=8qm2uVUTJk+hSR4xQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 12 Aug 2021 09:23:17 -0400
Message-ID: <CADnq5_Oir8_Q=GMFdwSCTC6aGBL7XcPuAVJS+aMbZo0rCBREGA@mail.gmail.com>
Subject: Re: AMDGPU firmware updates for raven APUs
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Thanks!

Alex

On Thu, Aug 12, 2021 at 9:22 AM Josh Boyer <jwboyer@kernel.org> wrote:
>
> Applied and pushed out.
>
> josh
>
> On Wed, Aug 11, 2021 at 5:30 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > Hi,
> >
> > Updated SDMA firmware to fix stability issues on raven APUs.  Please apply!
> >
> > Thanks,
> >
> > Alex
