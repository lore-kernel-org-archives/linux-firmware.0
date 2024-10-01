Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48286CE7D10
	for <linux-firmware@archiver.kernel.org>; Tue,  1 Oct 2024 11:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 26D43C4CECD; Tue,  1 Oct 2024 11:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F54C4CED1
	for <linux-firmware@kernel.org>; Tue,  1 Oct 2024 11:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727782481;
	bh=EI2U2/D7Nco5WLLCOnRsfCLtsSunawC4s1atxSqKhIc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=qgSu6f34sVd0pMC3MCm7TSzPpAaQSQs2drUHWQ0z5B8S3nBQ5PS/1JGfu9ZYAsRBC
	 8P8NMr5qFLFrxK7/iU0v+5lPIAGyhnQR76YcdSjXix5DDdZ0j2awibGX4JRnfxgwyt
	 9qx7+wmatKCSxkMNZ2/jCEJrxc8YrFy35HRTUXDh6GO2i1CbAjMBQBsWNiiiUAr+Kp
	 5Uw2B7+FxEGIFsnkYy62PT1XLMjs87C6Bnefu9iAWcKgwqkalQ0FgsHslx3r+ykO5t
	 zIXVU+zrAgLiKjP89DkPxz4uMMiisiJq5Sscc5y6+SdWwr7If500krGmX33yE+HBTz
	 0xYobrbY2rANw==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e21b4d7236so45667997b3.2
        for <linux-firmware@kernel.org>; Tue, 01 Oct 2024 04:34:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWdz9mkkVBxCawY7Z0Hry+WQ65OGZf7mhB/xZjfZ0dZkNAmSb+LElNacX/wt+xvvZWYRhiNUaENp6zRLbUj4A==@kernel.org
X-Gm-Message-State: AOJu0YxrRXj9jMHE8Y1KslRJQsEc7H0kyG9iZfm7UV/Ml/ta8KD5S6sJ
	UjYFEKWYp/kYpdWXotCPOuSqNUWQH1fZw/9qY9VOQV1gcSkVT4JZGbRqu7OyRjxmI5Vc0rgpEBW
	Yb62hwpDCkih3ybl5RXXp/J4HfFk=
X-Google-Smtp-Source: AGHT+IEedUZNR9VWUpxUl8s9eSblmiXygSvVjpkv/zIbDZtEh3dyk54wnj186JGNB3oQgV7fY2DfWBNMX74kKQUtZnU=
X-Received: by 2002:a05:690c:2b06:b0:6db:e045:3b07 with SMTP id
 00721157ae682-6e247547437mr81610377b3.17.1727782480281; Tue, 01 Oct 2024
 04:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240926153701.ymwkxr64x65b7euq@hu-akhilpo-hyd.qualcomm.com> <CAA8EJpoVTxHX1x7BT6PXYQ4FKfgjedfdsYpBFqcbMrY8y12atQ@mail.gmail.com>
In-Reply-To: <CAA8EJpoVTxHX1x7BT6PXYQ4FKfgjedfdsYpBFqcbMrY8y12atQ@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 1 Oct 2024 07:34:28 -0400
X-Gmail-Original-Message-ID: <CA+5PVA72+FXJm=i4A6-WVr6rzQeyNDNbC4k9-YvHzqnWcf3N0g@mail.gmail.com>
Message-ID: <CA+5PVA72+FXJm=i4A6-WVr6rzQeyNDNbC4k9-YvHzqnWcf3N0g@mail.gmail.com>
Subject: Re: qcom: update gpu firmwares for qcm6490 chipset
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 12:12=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 26 Sept 2024 at 17:37, Akhil P Oommen <quic_akhilpo@quicinc.com> =
wrote:
> >
> > Hi,
> >
> > Add/update the gpu firmwares required for Qualcomm's QCM6490 chipset.
> >
> > -Akhil
> >
> > ---
> > The following changes since commit 8306534b8a7265bee2f4323b45fd2a22a7c8=
b9b6:
> >
> >   Merge branch '8922a' into 'main' (2024-09-23 12:36:21 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw=
-QCM6490
> >
> > for you to fetch changes up to 2aded3b604ae42d3f6b1c5a5873db021ec4e4207=
:
> >
> >   qcom: update gpu firmwares for qcm6490 chipset (2024-09-26 20:47:08 +=
0530)
>
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/304

josh

>
> Thank you!
>
> We will need the qcom/qcs6490/a660_zap.mbn -> ../qcm6490/a660_zap.mbn
> symlink, but it can come as a separate patch.
>
> --
> With best wishes
> Dmitry
