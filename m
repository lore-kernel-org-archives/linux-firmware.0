Return-Path: <SRS0=Rn5w=7P=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE6CC6FD1D
	for <linux-firmware@archiver.kernel.org>; Thu, 23 Mar 2023 09:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A1448C4339E; Thu, 23 Mar 2023 09:35:14 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 81890C433EF
	for <linux-firmware@kernel.org>; Thu, 23 Mar 2023 09:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 81890C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id e65so24009909ybh.10
        for <linux-firmware@kernel.org>; Thu, 23 Mar 2023 02:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679564112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JF+vGQVgdI6sx9plJs4AJswLA4WXZNTBD08CbZnYmOw=;
        b=qgnBDQsImBRsBRzL04y/XruUAp85l8H3/quagH2UU3puPCBRsAsmXcd0fQqkGckt22
         3VLNedY8PKZr5ZwPq1czPzZAkvbryUhYFIe0hSApclFTrouW4GcL7UR1EUL6+juQphEt
         uHYHwGObMae+CTi4Q5Rj0hbbE4nGkI4o8qpg7GdTOkBwLf1x8nkqJJPdyYBRX7Gm0adu
         Wt2WlQ5ByWszvYzJsYf/Gwe3uwr7LDZlJPViam/w9AYmGiGpmGE7WFRszWLdCSA6j8nI
         klqDqSxihNxQSyXykhMvL26Ym84VBmx7T3oeSM8bqxRlXHQNGqNKY6My2yKDO8cP2/m3
         GqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679564112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JF+vGQVgdI6sx9plJs4AJswLA4WXZNTBD08CbZnYmOw=;
        b=TgxepKJr+b/0CXtvmTiawLpw9/Os9jB4XM2ISgffIEo97+Y3EVXF5OKN0V5a/PmZvA
         WYvmjOIKJpl/atslj6Y3gaxyaXJGudfuyGQxsExk2Mrqt6Sii1TOme6a4EjbiZ9I7WLE
         Da89P5m8axP15ffiOXwhvXD9CwyS3ELBPJEcpiQvB3mD7C37xxbf04U5GojRlumSJI5v
         gNIz31XSJMJWsJIjqFFV7x5w8t7swl/LPVvzbl9pYwSaPpR2AdsLG3dsIOawD8Nw8R9F
         KKW7e1SJYpJxDI5U6s71tddWQUccLaFysroZFB0Rs4Akl0GXJKzn2PB/iz5tMH4cKuYX
         TKng==
X-Gm-Message-State: AAQBX9dhmVabub2s/S330KrP5Bmk5iGmVfYqprFEX1Zp/rxg+PJLlPyb
	IWaeVW7pMyAfeEozkJOQZH7yHOA9oonwJe3ZyvTVz2gxhcL+sSPjJsM=
X-Google-Smtp-Source: AKy350bNDlq8omL6C5VYBvrDpmMp+ZJqXKk9D1arTEZ5Jo48ki+2fH+W9YnpT+A9TVctPNAUkGxRMWzPGLfKS2MSHg0=
X-Received: by 2002:a05:6902:a8e:b0:b6d:1483:bc0f with SMTP id
 cd14-20020a0569020a8e00b00b6d1483bc0fmr1379565ybb.9.1679564112387; Thu, 23
 Mar 2023 02:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <878rgzuw37.fsf@kernel.org> <f08d7310-8c33-ab0b-c9f1-317f737ba37c@linaro.org>
 <87v8ite3g4.fsf@kernel.org>
In-Reply-To: <87v8ite3g4.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 23 Mar 2023 11:35:01 +0200
Message-ID: <CAA8EJppge=2Zf1CZPY4sUNkC2VzhDQ8ah8f3x6LGAky=PdFQrw@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20230215
To: Kalle Valo <kvalo@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Mar 2023 at 07:54, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> >>   ath11k/IPQ5018/hw1.0/Notice.txt          | 4094 ++++++++++++++++++++++++++++++
> >>   ath11k/IPQ5018/hw1.0/board-2.bin         |  Bin 0 -> 524564 bytes
> >>   ath11k/IPQ5018/hw1.0/m3_fw.b00           |  Bin 0 -> 148 bytes
> >>   ath11k/IPQ5018/hw1.0/m3_fw.b01           |  Bin 0 -> 136 bytes
> >>   ath11k/IPQ5018/hw1.0/m3_fw.b02           |  Bin 0 -> 262144 bytes
> >>   ath11k/IPQ5018/hw1.0/m3_fw.flist         |    3 +
> >>   ath11k/IPQ5018/hw1.0/m3_fw.mdt           |  Bin 0 -> 284 bytes
> >>   ath11k/IPQ5018/hw1.0/q6_fw.b00           |  Bin 0 -> 532 bytes
> >>   ath11k/IPQ5018/hw1.0/q6_fw.b01           |  Bin 0 -> 520 bytes
> >>   ath11k/IPQ5018/hw1.0/q6_fw.b02           |  Bin 0 -> 7552 bytes
> >>   ath11k/IPQ5018/hw1.0/q6_fw.b03           |  Bin 0 -> 545008 bytes
> >>   ath11k/IPQ5018/hw1.0/q6_fw.b04           |  Bin 0 -> 86788 bytes
> >>   ath11k/IPQ5018/hw1.0/q6_fw.b05           |  Bin 0 -> 17776 bytes
> >>   ath11k/IPQ5018/hw1.0/q6_fw.b07           |  Bin 0 -> 1488 bytes
> >>   ath11k/IPQ5018/hw1.0/q6_fw.b08           |  Bin 0 -> 4096 bytes
> >>   ath11k/IPQ5018/hw1.0/q6_fw.b09           |  Bin 0 -> 2330624 bytes
> >>   ath11k/IPQ5018/hw1.0/q6_fw.b10           |  Bin 0 -> 269028 bytes
> >>   ath11k/IPQ5018/hw1.0/q6_fw.b11           |  Bin 0 -> 99436 bytes
> >>   ath11k/IPQ5018/hw1.0/q6_fw.b13           |  Bin 0 -> 7024 bytes
> >>   ath11k/IPQ5018/hw1.0/q6_fw.b14           |  Bin 0 -> 1668 bytes
> >>   ath11k/IPQ5018/hw1.0/q6_fw.flist         |   13 +
> >>   ath11k/IPQ5018/hw1.0/q6_fw.mdt           |  Bin 0 -> 1052 bytes
> >
> > For the past several years, the Qualcomm community has been shifting
> > from the pack of .mdt+.bNN files to a single .mbn file as a main
> > firmware file format. It reduces the back-and-forth between the kernel
> > and userspace and also simplifies handling of these files.
> >
> > In-kernel mdt loader provides backwards compatibility, detecting the
> > file type and using .mbn instead of .mdt one, retaining the name (or
> > using symlink).
> >
> > Do you have any plans to also shift from .mdt to .mbn?
>
> I have not heard any such plans but I'll ask around. Would you mind
> filing this to bugzilla as a feature request?

Done, https://bugzilla.kernel.org/show_bug.cgi?id=217235

> https://wireless.wiki.kernel.org/en/users/drivers/ath11k/bugreport
>
> That way it's easier for me to track it.


-- 
With best wishes
Dmitry
