Return-Path: <SRS0=ibhU=UM=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA20C02185
	for <linux-firmware@archiver.kernel.org>; Mon, 20 Jan 2025 09:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7E64C4CEE0; Mon, 20 Jan 2025 09:29:52 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D53ACC4CEDD
	for <linux-firmware@kernel.org>; Mon, 20 Jan 2025 09:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D53ACC4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e3a1cfeb711so6348098276.0
        for <linux-firmware@kernel.org>; Mon, 20 Jan 2025 01:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737365391; x=1737970191; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2bu7F+5ti4f9t3aOvlXwReKpI6CvbKrd1k13nOlOuw=;
        b=mkLY0TEDLJkkOUNFi9pCEiCBcrgQ5f3ggJmeq2/D1a1y9D7A5OPvT7pjfnREjHpoY+
         53OOhEcGSNruUufJzqRnxttba7uSN3fwdiLhuMR7EQcZLT9syWJDLIeqZVsPme5xOjXk
         QLBgeym/jI5Sxr5PrvkbzJFADze8T2mSFSqPYo24yarm4mWV1xRFZgS0QN/NnEMpuNNN
         Hh8ux4ck9S/WF5FWraztmpwIbfU/30R5Tz6gsqMM2m8+lQHFhCUQ6s7TPNFCHmQQrzt5
         wq7mK+3ulWZNCB1wzGInRaHSQDfA7XUsN0fEx5kKzYSxAXx/SmP+wEqU97jPDrDQdRxx
         O0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737365391; x=1737970191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2bu7F+5ti4f9t3aOvlXwReKpI6CvbKrd1k13nOlOuw=;
        b=pQTmNWGclsjFsiCEDbWEVAiDMlwZ9zuhHCRKtgot5ZDoPNsUG4/Otf997Hojo0bHLg
         8XB9oyL0IiWkMFmrpSIQoECZ9vT4U9kKx8MQVVrYt2tdFiP525UjcxUP1XPtX1irb4+g
         n73152Ix8P4VCozMj2tP0lfCZw9PNYtL93IcdV6frHaFIR/jVW+IP3KrEJ3pEyS6DWc6
         /GX9Q8P3UeOHVEYHIez4UdQ6rmq+Hob1Nu6XLcmdbTN7wXs1xbKD5ixpFI0usD30uLk2
         NubOwTnpZ/mhfsaWaOoxPEOGR7+MWl/tr9Q5+sp4NeeWfWngp1isTJjw5bTJCJP5ECxM
         HW/A==
X-Gm-Message-State: AOJu0Yz2B80z+CEb8HMRZxukPrOOHARrZlXs4/rnPK4CLzccdKajhnSB
	wOtUO5PHGVmpsrodZ0tvqAI5WheQRCCxgrS4sXXnqEPweXI2vIQjiIiE0XhykOLab9KbsVh5FlF
	lyNaEbsnO1o7csF1Amz2U4vcYzS/cBM5W7PxQYA==
X-Gm-Gg: ASbGncsR/dd7tyHoe5EcHyxMCsf8ZxQMcYOqdWAzkAXimD2uyZ2pwZL3bN9R8r+Gb+P
	VL0VUDv+RREuh6eYW3D85jGNMr/SahAN2HlTvQPhKLQ8gOAr7GP47WZA6Z3aTC3yl3We+KmTzDO
	QmaYLEvw==
X-Google-Smtp-Source: AGHT+IFAnIuhsbrqXwI1QYa5jicRl029ggjLa6BJeWr/jYWGYSp4IJ2m8yfPw+BM5i2peEbSUNDPCOFGNkGws/HQ8Ec=
X-Received: by 2002:a05:690c:9a04:b0:6ef:75af:6170 with SMTP id
 00721157ae682-6f6eb905806mr82022567b3.28.1737365390670; Mon, 20 Jan 2025
 01:29:50 -0800 (PST)
MIME-Version: 1.0
References: <57fe5525-8383-4737-ba60-6c9c0c6997f0@quicinc.com>
 <bf08e319-07ae-4f96-92f2-aac8f1a7e136@quicinc.com> <2cqzso5hkp4t3m3xqrsprt52mhafm6kasjm2hol5b4te23aos2@2uwy7tkaowyv>
 <d3924fae-8e5d-44bf-b882-6f18286beab8@quicinc.com>
In-Reply-To: <d3924fae-8e5d-44bf-b882-6f18286beab8@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 20 Jan 2025 11:29:39 +0200
X-Gm-Features: AbW1kvbTJUNojujdqgQtjfXgmrcx94UmoaKqSSwtpDtGy0VMfaP7dbGPSOj0q08
Message-ID: <CAA8EJprtVp-1GNxJsdnuCsJAeRo0yL6DUjK5X7dU3zgASEx=qQ@mail.gmail.com>
Subject: Re: QCA: Update firmware files for BT chip WCN6856
To: Vivek Sahu <quic_vivesahu@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, quic_janathot@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vivek,

On Mon, 20 Jan 2025 at 11:19, Vivek Sahu <quic_vivesahu@quicinc.com> wrote:

Please don't top-post while responding. It breaks the logic of the messagin=
g.

>
> We have created a repository https://github.com/vivesahu-qcom/bt_hsp_fw.g=
it by cloning https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linu=
x-firmware.git/. Then we replaced FW files which are required to update the=
 FW of the chip and created a patch and shared snapshot of the pull request=
 in trailing mail.

I assume that either GH treats 'for/foo' branches in a strange way or
you have pushed your changes directly to 'refs/for/master' instead of
pushing to just 'for/master'.

Anyway, your branch is not visible at
https://github.com/vivesahu-qcom/bt_hsp_fw/branches.

>
> Let me know if this makes sense and good for move ahead with the approval=
. If not please share right way of raising upstream request for FW patched.

Well. At least Zijun Hu does it in the right way. Please communicate
with your colleagues, it improves overall experience.

>
>
> Thanks,
>
> Vivek K Sahu
>
> On 1/17/2025 3:45 PM, Dmitry Baryshkov wrote:
>
> On Fri, Jan 17, 2025 at 02:27:32PM +0530, Vivek Sahu wrote:
>
> Hi Team,
>
> Any update on this ?
>
> I don't see this branch on GitHub. Did you push it in some strange way?
>
> thanks,
>
> Vivek K Sahu
>
> On 1/13/2025 6:19 PM, Vivek Sahu wrote:
>
> Hi Team,
>
> Please include firmware bins for WCN6856.
>
> Major contributions : Bug Fixes/Stability.
>
> Snapshot of pull request is as below, let me know if anything is missing.
>
> --------------------------------------------------------------------
> The following changes since commit
> ff68bad967033e2973d3a82e5b160813b1d43488:
>
>   qca: Update Bluetooth WCN6856 2.1.0-00642 firmware to 2.1.0-00650
> (2025-01-10 16:33:04 +0530)
>
> are available in the Git repository at:
>
> https://github.com/vivesahu-qcom/bt_hsp_fw.git for/master
>
> for you to fetch changes up to ff68bad967033e2973d3a82e5b160813b1d43488:
>
>   qca: Update Bluetooth WCN6856 2.1.0-00642 firmware to 2.1.0-00650
> (2025-01-10 16:33:04 +0530)
>
> ----------------------------------------------------------------
>
>
> Thanks and regards,
>
> Vivek K Sahu
>


--=20
With best wishes
Dmitry
