Return-Path: <SRS0=zEAy=J6=gmail.com=alexdeucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D96C433ED
	for <linux-firmware@archiver.kernel.org>; Mon,  3 May 2021 13:28:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 802EB61278; Mon,  3 May 2021 13:28:37 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2517D6115B;
	Mon,  3 May 2021 13:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2517D6115B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=alexdeucher@gmail.com
Received: by mail-ot1-f49.google.com with SMTP id g4-20020a9d6b040000b029029debbbb3ecso5032238otp.7;
        Mon, 03 May 2021 06:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BOrxjyUj2eJG5s54G1YxeEB/FftVmgfqm01Y2o0MH60=;
        b=pbzVlAZjqQkJyYGsKYcE80LVx+MG0syavcKwJSS0HZRRsvtfcxtZ94r1un5NVau9Xo
         5uHIwPtpf2IsT7kgEVacIGvlHHN2Mxo2OyLFb90D1Ovvdq1wAKhMjpDnTFtnphUPCAQw
         /FV83HtKIxY5OJS/Hy5aALyhDmU9GT5DUG57lVmxWe5Q1W/zQf998gCUSFIANR/xoCuj
         pliRE5f1EBwujh0IjwwPKh4hAnmcE58etVp9TYzv47SndmBOLUJuRbAXycxnR75t2zkg
         FjYGxPnTgepRima/o2gias1WxzRWCslvDkIRekNWvoCxjXq8NLwDwpVJ9hODUyP7MeFj
         Uh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BOrxjyUj2eJG5s54G1YxeEB/FftVmgfqm01Y2o0MH60=;
        b=s4xtgrLuCiGZJbS8YmVimiyB7jOVBOhCyyZiVUSJqJzhFX76obTuGztagnZtpkR3HN
         eL8TYIEL906CDTDIdFRxGrrlatAypNE2+93nG/iKszD/OXkZRPHX6+G2lPLXhHffPSkr
         zOOCORrHyzJQAsCXcavfap5sg2TVt1Jso0m4of33Hggf/yedeJoj/iOp4abSCb5q4IsR
         rJUOT0iMaQI0fBdES7m7t1Bfe7BNbGoKphACDe6CcwU772wYWa7D8Hd1Ofux+FnHlWrc
         abaChP70fjhEb73uQcnxLGSUijTb+dqJzL/Ga/cdfIC6ZKwUqVniNmM6XojqS8ePGogp
         fv5w==
X-Gm-Message-State: AOAM532sSF+KtloPLqQ8wWTMUZNAYCEeiJihgV0UCDX4RO3NXcqRdtLM
	7h6ehekKS0zM0PXpxaRjycb/D1IhVglZYhrxbKAEG1Iq
X-Google-Smtp-Source: ABdhPJxWjFFJlfoArd0t2Zknmo1h0s7TTyvUDouxP3vTqZc28dEukQWRGrogNTsDxZB/IH+1pv1lqwOVHHBTTmYvR/o=
X-Received: by 2002:a9d:4e04:: with SMTP id p4mr3268362otf.311.1620048516178;
 Mon, 03 May 2021 06:28:36 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_OqwuvwVNkbpqs49CpMGdL_zxQ5WKcs1CzC9F9bAFWLug@mail.gmail.com>
 <CA+5PVA7HYKBJa0t5iOLhXkZ_3tH2devvof-bmPY1NfJg7013GA@mail.gmail.com>
In-Reply-To: <CA+5PVA7HYKBJa0t5iOLhXkZ_3tH2devvof-bmPY1NfJg7013GA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 3 May 2021 09:28:25 -0400
Message-ID: <CADnq5_PXfoTsdMvtvy4xUnz08UQdCAWrCyhtfSr9FEBRZ8HTaw@mail.gmail.com>
Subject: Re: New polaris 12 MC firmware
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Thanks!


On Mon, May 3, 2021 at 9:27 AM Josh Boyer <jwboyer@kernel.org> wrote:
>
> On Fri, Apr 30, 2021 at 10:39 AM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > Hi,
> >
> > New firmware for a new polaris 12 board config.  Please apply!
>
> Applied and pushed out.
>
> josh
