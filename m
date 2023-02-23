Return-Path: <SRS0=lOCV=6T=googlemail.com=martin.blumenstingl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C7CC61DA4
	for <linux-firmware@archiver.kernel.org>; Thu, 23 Feb 2023 21:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C225C4339B; Thu, 23 Feb 2023 21:00:23 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0AE6AC433D2;
	Thu, 23 Feb 2023 21:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0AE6AC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-ed1-f43.google.com with SMTP id s26so47046027edw.11;
        Thu, 23 Feb 2023 13:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZEJmwoeHBaDnkt9DK/t5JUB9F2Etnru1h6EpHkG56A=;
        b=HGpDWnWLnB/qiTUHcKqAO9w3xAo13SA3wqWPUDHHuEucYhUUIS8s2SDKsqshogc7Hp
         wuEE2qAJixZvh43IbODDFjgg7LwvKXhbWkKX4caFVBj/M7jGNDRtDBwGWMFVDOa+d1B6
         pbn7eVFGCjSSWCCQmpJPS4c2q5VI/5kpRA3K1R6DSHPte7UHMl+Xy9FRYeTGc1kWklkf
         JuLMy82G4J3Av2zwxWg/4UOlqKo75KHtr+NTDcz+SBybrA04atzLAHPJJhX5zj9OZeXf
         37Iyd0cT4HknBzbAOl3QT9s77Z7UANBJ0z/BUU8bxQa3khauS4ce3fyWFJUA5JiipR3l
         Zgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZEJmwoeHBaDnkt9DK/t5JUB9F2Etnru1h6EpHkG56A=;
        b=e+qvrwu5mXKCdMkT3D0Bcjq09yM3EjPyY1m+wQO2WXuplnBmcgGFK/YSo468XGsPLu
         WLKGomRb/J2vQIxz18uFUssBHlntp1PRYRcAPSaWAXCfywddKfVFOwBzzOcirDltuXvv
         RbwKbOb5IZxuYan83DCTjlehjBODlinhx+S3/GbVyZXfmOYQEpaom3pJriQZleQpUc3x
         VOyH+vK8GME8p9l8ZQjgVcRPzirLstBjSTFjl+FwCHbSIySuN4RLqwmff6YJ7cunPAxZ
         w9Q6CYvI97LdM4WrQIIL0teLWsNuJnaiVh/2ILNj33hnOqUGeuS8ZhuzVnrQeHapppMR
         l57A==
X-Gm-Message-State: AO0yUKUuEsn+aAjrHFzBXuhmPN4xh5Tx+PPWCq1hjX40PhoYP1C3jaFU
	d/v+HVWpIGGa6SJth+UogBYBwmQ0gfwSBKx7Iy8=
X-Google-Smtp-Source: AK7set/rbJjZ7n4/Qs7cZ044K+isfW1N6nJu2HVaa/sP6x4zWmdWYmhM5CLNVK875PIFr68NfyAfnT4wlf87AuY1zVc=
X-Received: by 2002:a17:906:8295:b0:8b1:3357:b16b with SMTP id
 h21-20020a170906829500b008b13357b16bmr9765097ejx.4.1677186019991; Thu, 23 Feb
 2023 13:00:19 -0800 (PST)
MIME-Version: 1.0
References: <3B9D4DB2-D2CD-44FE-817A-F6EA8A0AD734@gmail.com>
 <CAFBinCBWyiObgbyuT2Xc=FnoTTTUBu3sePpybdrocVZr7SVDWw@mail.gmail.com>
 <7df7bdcad3474791ae69f73f8a761173@realtek.com> <9E1F8017-3F54-416D-9BD3-DF2F1C625094@gmail.com>
 <e4404fcb-69f6-b4c0-7683-69101bbeaa96@lexina.in>
In-Reply-To: <e4404fcb-69f6-b4c0-7683-69101bbeaa96@lexina.in>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 23 Feb 2023 22:00:08 +0100
Message-ID: <CAFBinCDFDv3RJQnydU8_ryFwzT2bevQsciGTsvotjsft4fVmXg@mail.gmail.com>
Subject: Re: Bug/Problem with rtl_bt/rtl8822cs_config.bin
To: Vyacheslav <adeep@lexina.in>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Christian Hewitt <christianshewitt@gmail.com>, Max Chou <max.chou@realtek.com>, 
	Hilda Wu <hildawu@realtek.com>, Josh Boyer <jwboyer@kernel.org>, 
	Linux Firmware <linux-firmware@kernel.org>, 
	Bluez mailing list <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Vyacheslav,

On Thu, Feb 23, 2023 at 3:14 PM Vyacheslav <adeep@lexina.in> wrote:
[...]
> > The bug report stimulated Martin=E2=80=99s maintainer memory over unfin=
ished improvements
> > to the Amlogic UART used in the g12a and newer SoC families (we are tes=
ting with
> > g12b and sm1 devices) resulting in this series being submitted last nig=
ht:
> >
> > https://patchwork.kernel.org/project/linux-amlogic/list/?series=3D72417=
2
>
> However, this does not fix the problem with rtl8822cs BT on gxl/axg chips=
ets
My understanding is that Meson GXBB and newer can also use XTAL along
with the UART controller's internal divider - without any additional
pre-divider like "XTAL divided by 2" or "XTAL divided by 3".
Using XTAL directly (24MHz) also makes it possible to achieve 1500000
baud without any jitter.

The problem with the Meson UART driver however is that using XTAL
directly is not implemented.
Yu Tu from Amlogic worked on patches last year. v6 of his series made
it into -next briefly, but got reverted due to issues. v7 then
stalled: [0] and only the bare minimum (enabling "XTAL divided by 2")
for the S4 SoC made it upstream in the end.

My suggestion is:
- let's get my small patchset upstreamed which at least fixes the
1500000 baud rate on G12A (and newer) SoCs
- then work on resurrecting Yu Tu's patchset and implement "XTAL
without any pre-dividers" support on top of that. Common Clock
Framework will then choose the correct parent depending on the SoC
generation, hopefully allowing arbitrary baud rates in the end - with
no jitter/as little jitter as possible.

What do you think?


Best regards,
Martin


[0] https://lore.kernel.org/all/20220225073922.3947-1-yu.tu@amlogic.com/
