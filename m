Return-Path: <SRS0=krze=YJ=gmail.com=robdclark@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98683C00140
	for <linux-firmware@archiver.kernel.org>; Fri,  5 Aug 2022 20:08:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 433BCC433B5; Fri,  5 Aug 2022 20:08:53 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 46529C433D7
	for <linux-firmware@kernel.org>; Fri,  5 Aug 2022 20:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 46529C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f51.google.com with SMTP id c185so2680474iof.7
        for <linux-firmware@kernel.org>; Fri, 05 Aug 2022 13:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=X3jszDKVbqc5LgLk/f19b+sABvMxiQhYlgFi+rpy6H4=;
        b=X/VN2EIwdNRbM6JFfB78DjMUfN7WIXuSZmfIDfZpYYECgbmEnkTZT/ppymsnTHgeOP
         WvxdNcAibtF2ehZI6Fj9VcyZ3ah4b9g99YXw1RZOo7/eanWDu6MCKw9TTKw8iHtzF8aQ
         SWb8ydZFr9s3zV3gPqynOpzKLamklgeSHbe3N2pFJ42hy4BVnGF87DVLRxQG7aLlY1jg
         eG05AnTNzKKdKhpzY3onFV0nGWRukDbTtIvmsyl09QyPvIiwlHE9JkU36qgAtZhn52jm
         L7EqGnj4DCBXMb8O4nnlpLiMQ19UJxIkKmjx1B3DhSGb37iWfxsxiXOtjltoQrWZXmmB
         N5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=X3jszDKVbqc5LgLk/f19b+sABvMxiQhYlgFi+rpy6H4=;
        b=BAvDVdki2jCsfV9MIRGlUWGuJjvlvoXrYZV77LZtJaIl4sRiGB2SJK1wqvkHhJft+r
         k7rCj1C7lXNxNLDYc7K+Nt4Taw8NrI4UghFYRiQuGLVipDn4nBvLvFP06UOR0BsXR/kY
         ohO8GFaBPS4SKuAxO4S0fXIQvsozJ64PA8N83IszIm0fa5eClpdrgOPAmITjF4HOxcX6
         bg2vau/OeGcYT+GwW6fkfOel7EFkv09SH/7R9LirAVLMC4RJQraggawf7q2glUaOy17s
         K4Ei+55zc6t8otJ+4eIa/hXjQ/8NWUKf40rSJLDuwLsBwWaOLi9KARfCHwv/IIpJplbk
         kgsQ==
X-Gm-Message-State: ACgBeo0cKYrHJjf3xt5wd9u8PPJeN+bPeu4lZ5SV8fjlNJuk3kZkBAfA
	gwpSRzauZbJ76oHgjKucw9FyeICsUkZicag4n8M=
X-Google-Smtp-Source: AA6agR4VQiaXWpr6VcITODd1FiPbC3w/NtDCVe6q4C6AtZ0RJhN1p8UghcxajJoGk4AtrYccK8vM0jathTcpySNZbvU=
X-Received: by 2002:a05:6638:1353:b0:342:9bfb:7382 with SMTP id
 u19-20020a056638135300b003429bfb7382mr3751680jad.129.1659730131310; Fri, 05
 Aug 2022 13:08:51 -0700 (PDT)
MIME-Version: 1.0
References: <9a79936b-70e2-f964-55ac-e2be8e9346ed@lenovo.com> <2a4ae0d4-8ba2-a202-0051-6bd7b170bccd@linaro.org>
In-Reply-To: <2a4ae0d4-8ba2-a202-0051-6bd7b170bccd@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 5 Aug 2022 13:09:17 -0700
Message-ID: <CAF6AEGvdnrPn+rnDGmjza1-xoPaOQgdPLkSfaOL6hCPnB2ea5w@mail.gmail.com>
Subject: Re: qcom: Add firmware for Lenovo ThinkPad X13s
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Mark Pearson <markpearson@lenovo.com>, linux-firmware@kernel.org, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, bjorn.andersson@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 5, 2022 at 2:37 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 03/08/2022 23:37, Mark Pearson wrote:
> > The following changes since commit 150864a4d73e8c448eb1e2c68e65f07635fe1a66:
> >
> >    amdgpu partially revert "amdgpu: update beige goby to release 22.20"
> > (2022-07-25 14:16:04 -0400)
> >
> > are available in the Git repository at:
> >
> >    https://github.com/mrhpearson/linux-firmware lenovo-thinkpad-x13s
> >
> > for you to fetch changes up to 4ae4ae88918928e15006eb129ad981aa58216b59:
> >
> >    qcom: Add firmware for Lenovo ThinkPad X13s (2022-08-03 16:29:07 -0400)
>
> Mark, it's so great to see firmware packages for Lenovo laptops being
> submitted!
>
> >
> > ----------------------------------------------------------------
> > Mark Pearson (1):
> >        qcom: Add firmware for Lenovo ThinkPad X13s
> >
> >   WHENCE                             |   8 ++++++++
> >   qcom/LENOVO/21BX/adspr.jsn         |  28 ++++++++++++++++++++++++++++
> >   qcom/LENOVO/21BX/adspua.jsn        |  29 +++++++++++++++++++++++++++++
> >   qcom/LENOVO/21BX/battmgr.jsn       |  22 ++++++++++++++++++++++
> >   qcom/LENOVO/21BX/cdspr.jsn         |  22 ++++++++++++++++++++++
> >   qcom/LENOVO/21BX/qcadsp8280.mbn    | Bin 0 -> 14367860 bytes
> >   qcom/LENOVO/21BX/qccdsp8280.mbn    | Bin 0 -> 3575808 bytes
> >   qcom/LENOVO/21BX/qcdxkmsuc8280.mbn | Bin 0 -> 14392 bytes
> >   qcom/LENOVO/21BX/qcslpi8280.mbn    | Bin 0 -> 6213632 bytes
> >   9 files changed, 109 insertions(+)
> >   create mode 100644 qcom/LENOVO/21BX/adspr.jsn
> >   create mode 100644 qcom/LENOVO/21BX/adspua.jsn
> >   create mode 100644 qcom/LENOVO/21BX/battmgr.jsn
> >   create mode 100644 qcom/LENOVO/21BX/cdspr.jsn
> >   create mode 100755 qcom/LENOVO/21BX/qcadsp8280.mbn
> >   create mode 100755 qcom/LENOVO/21BX/qccdsp8280.mbn
> >   create mode 100755 qcom/LENOVO/21BX/qcdxkmsuc8280.mbn
> >   create mode 100755 qcom/LENOVO/21BX/qcslpi8280.mbn
>
> I think it's the time to settle onto firmware paths for the
> Qualcomm-based devices. At some point it was proposed to use
> qcom/<SoC>/device/*mbn.
>
> So, in your case it could be qcom/sc8280xp/Lenovo_21BX/

I don't think it is a good idea.. we should stick to a path that can
be constructed from SMBIOS fields if we ever want a chance to get ACPI
boot with acceleration working

BR,
-R

>
> Bjorn, WDYT?
>
>
> P.S. Can we hope to get firmware for older laptops to be published too?
> It would be really great if it would be possible to provide full support
> for Yoga C630 or Flex5G using redistributable firmware from linux-firmware.
>
> --
> With best wishes
> Dmitry
